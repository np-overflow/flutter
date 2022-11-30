import 'package:cat_app/second.dart';
import 'package:flutter/material.dart';

// Plugin Packages
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Quiz Demo',
      theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Cat Quiz Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Container Size
  double width = 400;
  double height = 400;

  // TODO: Update Container Size when button is pressed
  void updateContainerSize() {
    setState(() {
      if (width != 500) {
        width = 500;
        height = 500;
      } else {
        width = 400;
        height = 400;
      }
    });
  }

  // TODO: Add Transition Animation to next Page
  // Curve: ease out | duration: 0.5 seconds | transition: rotate
  // Hint: Replace MaterialPageRoute with PageTransition
  void transitionAnimation() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SecondPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Column(children: [
        MaterialButton(
          onPressed: () {
            updateContainerSize();
          },
          color: Colors.grey[200],
          padding: const EdgeInsets.all(10),
          child: const Text("Animate!", style: TextStyle(fontSize: 30)),
        ),
        // TODO: Change Container to AnimatedContainer & Add Duration & Curve
        AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.bounceOut,
            margin: const EdgeInsets.all(10),
            width: width,
            height: height,
            alignment: Alignment.center,
            color: Colors.blue[400],
            child: const Image(
              image: NetworkImage(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2Fc2%2F77%2Fb8%2Fc277b80998305d460a8b5b2f692d446b.jpg&f=1&nofb=1&ipt=8a48814587a5fbe528fcae08e56275533b8b33a4a4139db08e9abc18eb7a0e84&ipo=images"),
              width: 450,
            )),
        MaterialButton(
          onPressed: () {
            transitionAnimation();
          },
          color: Colors.grey[200],
          padding: const EdgeInsets.all(10),
          child:
              const Text("Transition! Woosh!", style: TextStyle(fontSize: 30)),
        ),
      ])),
    ));
  }
}
