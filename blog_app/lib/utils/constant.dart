import 'package:flutter/material.dart';

const baseURL = 'http://127.0.0.1:8000/api';
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/user';
const postsURL = baseURL + '/posts';
const commentsURL = baseURL + '/comments';

// ----- Errors -----
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';

// --- input decoration
InputDecoration kInputDecoration(String label) {
  return InputDecoration(

      hoverColor: primary,
       labelText: label,
      contentPadding: const EdgeInsets.all(30),
  );
}

// --- colors
const Color primary = Color(0xFF03045e);
const Color white = Colors.white;
const Color black = Colors.black26;

//--- size
const double fontSize = 16;

// button
Center kTextButton(String label, Function onPressed) {
  return Center(
    child: TextButton(
      child: Text(
        label,
        style: const TextStyle(color: white),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => primary),
          padding: MaterialStateProperty.resolveWith(
              (states) => const EdgeInsets.symmetric(vertical: 20, horizontal: 30))),
      onPressed: () => onPressed(),
    ),
  );
}

// loginRegisterHint
Row kLoginRegisterHint(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
          child: Text(label, style: const TextStyle(color: primary)),
          onTap: () => onTap())
    ],
  );
}

// likes and comment btn

Expanded kLikeAndComment(
    int value, IconData icon, Color color, Function onTap) {
  return Expanded(
    child: Material(
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: color,
              ),
              const SizedBox(width: 4),
              Text('$value')
            ],
          ),
        ),
      ),
    ),
  );
}
