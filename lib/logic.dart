import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for jsonDecode
import 'dart:math'; // for random number

// Controllers
TextEditingController answerController = new TextEditingController();

// Variables
String api_key =
    "live_b8VFtq3DpPQmPOh271GEJryIOYXv6yhQFiAAzcw1GlRwbcIKs2ShAV0AOQkRvzX5";

List catBreeds = [];
String answer = "";
String image = "https://cdn2.thecatapi.com/images/NZpO4pU56M.jpg";

void initGame() async {
  // --- Get Cat Breeds ----
  String breedURL = "https://api.thecatapi.com/v1/breeds";
  var res = await http.get(Uri.parse(breedURL),
      headers: {"x-api-key": api_key, "Access-Control-Allow-Origin": "*"});
  // Convert to JSON
  var data = jsonDecode(res.body);
  for (var breed in data) {
    catBreeds.add(breed["id"]);
  }
  getCat();
}

void getCat() async {
  // Randomize
  int random = new Random().nextInt(catBreeds.length);
  String breed = catBreeds[random];
  // Get Cat Image
  String imageURL =
      "https://api.thecatapi.com/v1/images/search?breed_ids=$breed";
  var res = await http.get(Uri.parse(imageURL),
      headers: {"x-api-key": api_key, "Access-Control-Allow-Origin": "*"});
  // Convert to JSON
  var data = jsonDecode(res.body);

  String previous_image = image;
  image = data[0]["url"];
  answer = data[0]["breeds"][0]["name"];
  print(image);
}

bool checkAnswer() {
  // Get Textbox Value
  String user_answer = answerController.text;
  print("User Answer: $user_answer | Answer: $answer");

  if (user_answer.toLowerCase() == answer.toLowerCase()) {
    print("Correct");
    getCat();
    answerController.clear();
    return true;
  }
  print("Incorrect");
  return false;
}
