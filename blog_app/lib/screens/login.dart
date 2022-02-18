import 'package:blog_app/models/api_response.dart';
import 'package:blog_app/models/user.dart';
import 'package:blog_app/services/user_service.dart';
import 'package:blog_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  void _loginUser() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Form(
         key: formkey,
         child: ListView(
           padding: EdgeInsets.all(40),
           children: [
             const SizedBox(
               height: 64,
             ),
             TextFormField(
                 keyboardType: TextInputType.emailAddress,
                 controller: txtEmail,
                 validator: (val) =>
                 val!.isEmpty ? 'Invalid email address' : null,
                 decoration: kInputDecoration('Email')),
             const SizedBox(
               height: 32,
             ),
             TextFormField(
                 controller: txtPassword,
                 obscureText: true,
                 validator: (val) =>
                 val!.length < 6 ? 'Required at least 6 chars' : null,
                 decoration: kInputDecoration('Password')),
             const SizedBox(
               height: 32,
             ),
             loading
                 ? const Center(
               child: CircularProgressIndicator( color: primary),
             )
                 : kTextButton('Login', () {
               if (formkey.currentState!.validate()) {
                 setState(() {
                   loading = true;
                   _loginUser();
                 });
               }
             }),
             const SizedBox(
               height: 16,
             ),
             kLoginRegisterHint("Don't have an account? ", 'Register', () {
               Navigator.of(context).pushAndRemoveUntil(
                   MaterialPageRoute(builder: (context) => Register()),
                       (route) => false);
             })

           ],
         ),
       ),
    );
  }
}
