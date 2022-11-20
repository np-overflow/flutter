import 'package:flutter/material.dart';

// Controllers
TextEditingController answerController = new TextEditingController();

String getAPI() {
  return "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif";
}

bool checkAnswer() {
  // Get Textbox Value
  String answer = answerController.text;
  print("User Answer: $answer");
  return false;
}
