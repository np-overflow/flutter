import 'package:flutter/material.dart';

// Import logic dart file
import 'logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Image(
                image: NetworkImage(getAPI()),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text("What cat is this?")),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width * 0.50,
                child: Row(children: [
                  Expanded(
                      flex: 1,
                      child: TextField(
                        controller: answerController,
                        obscureText: false,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Your Answer"),
                      )),
                  IconButton(
                      onPressed: (() {
                        checkAnswer();
                      }),
                      icon: const Icon(Icons.check))
                ]),
              )
            ]),
          )
        ],
      ),
    );
  }
}
