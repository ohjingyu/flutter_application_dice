import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_dice/dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dice dice = Dice(size: 100);
  @override
  Widget build(BuildContext context) {
    late Timer timer;
    int resultNum = 0;

    void start() {
      timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        dice.shake();
        print(dice.dice[0]);
        setState(() {
          resultNum = dice.dice[0];
        });
      });
    }

    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Center(
              child: Text(
                '$resultNum',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
          const Flexible(
            flex: 2,
            child: Center(
              child: Text(
                '결과',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      iconSize: 100,
                      onPressed: start,
                      icon: const Icon(
                        Icons.play_circle_fill_rounded,
                      )),
                  IconButton(
                      iconSize: 100,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check_box_rounded,
                      )),
                ],
              ))
        ],
      )),
    );
  }
}
