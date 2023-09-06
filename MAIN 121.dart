import 'dart:math';

import 'package:flutter/material.dart';

// hide andriod status bar
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  var num1 = 1;
  var num2 = 1;

  var text = 'draw';

  void play() {
    num1 = Random().nextInt(3) + 1;
    num2 = Random().nextInt(3) + 1;

    if (num1 == num2) {
      text = 'draw';
    } else if (num1 == 1 && num2 == 2) {
      text = 'player 2 is the winner';
    } else if (num1 == 2 && num2 == 1) {
      text = 'player 1 is the winner';
    } else if (num1 == 2 && num2 == 3) {
      text = 'player 2 is the winner';
    } else if (num1 == 3 && num2 == 2) {
      text = 'player 1 is the winner';
    } else if (num1 == 3 && num2 == 1) {
      text = 'player 2 is the winner';
    } else if (num1 == 1 && num2 == 3) {
      text = 'player 1 is the winner';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Rock Paper Scissors!')),
            backgroundColor: Colors.purple,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/i_$num1.png',
                            height: 150, width: 150),
                        Text(
                          'player 1',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/i_$num2.png',
                            height: 150, width: 150),
                        Text(
                          'player 2',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  'Result: $text',
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  width: 230,
                  height: 70,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 73, 143, 154)),
                    child: Text(
                      'Play!',
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () => play(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
