import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // TODO: Create Animation Controller

  // TODO: Create Dispose Method

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('BRING ME BACK!!!',
                  style: TextStyle(fontSize: 30)),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Image(
                image: NetworkImage(
                    "https://i.pinimg.com/236x/2c/d1/4b/2cd14b87d50e776276778268b974ccce.jpg?nii=t",
                    scale: 0.5),
              ),
            ),
            // TODO: Add AnimatedBuilder
            const Text("Welcome Traveller...", style: TextStyle(fontSize: 30)),
          ],
        ));
  }
}
