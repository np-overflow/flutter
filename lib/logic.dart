import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for jsonDecode
import 'dart:math'; // for random number

// Controllers
TextEditingController answerController = new TextEditingController();

// Variables
String api_key = ""; // Define API Key

List catBreeds = []; // List of all the cat breeds (in API)
String answer = ""; // Answer for the quiz (will change randomly)
String image =
    "https://cdn2.thecatapi.com/images/NZpO4pU56M.jpg"; // Image URL for the Image (NetworkImage) Widget

void initGame() async {
  // --- Get Cat Breeds ----
  String breedURL = "https://api.thecatapi.com/v1/breeds";
  var res = await http.get(Uri.parse(breedURL),
      headers: {"x-api-key": api_key, "Access-Control-Allow-Origin": "*"});

  // Convert to JSON
  var data = jsonDecode(res.body);

  // Add cat breeds to list
  for (var breed in data) {
    catBreeds.add(breed["id"]);
  }

  // On first load, get a new cat :D
  getCat();
}

void getCat() async {
  // Randomize Cat Breed -> for next image & answer
  int random = new Random().nextInt(catBreeds.length);
  String breed = catBreeds[random];
  // Get Cat Image
  String imageURL =
      "https://api.thecatapi.com/v1/images/search?breed_ids=$breed";
  var res = await http.get(Uri.parse(imageURL),
      headers: {"x-api-key": api_key, "Access-Control-Allow-Origin": "*"});

  // Convert response to JSON
  var data = jsonDecode(res.body);

  // Update Image & Answer
  image = data[0]["url"];
  answer = data[0]["breeds"][0]["name"];
}

bool checkAnswer() {
  String user_answer = answerController.text; // Get Textbox Value
  print("User Answer: $user_answer | Answer: $answer");

  if (user_answer.toLowerCase() == answer.toLowerCase()) {
    print("Correct");
    getCat(); // Get a new cat (image & answer)
    answerController.clear(); // Clear TextField Widget
    return true;
  }
  print("Incorrect");
  return false;
}
