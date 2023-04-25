import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int times = 1 * 60; //1 min
  late Timer timer;

  void timeStart() {
    //1초마다 1씩 감소
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        times--;
      });
    });
  }

  void timeStop() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'My timer',
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      '$times',
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ),
                )),
            Flexible(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: timeStart,
                        icon: Icon(
                          Icons.play_circle_fill_rounded,
                        ),
                        iconSize: 50,
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.pause_circle_rounded),
                        iconSize: 50,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
