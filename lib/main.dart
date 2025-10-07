import 'package:flutter/material.dart';
import 'package:micro_habits/app.dart';
import 'package:micro_habits/bootstrap.dart';

Future<void> main() async {
  final result = await Bootstrap.initialize();

  if(result.isRight()){
    runApp(App(dependencies: result.right));
  } else{
    final failure = result.left;
    debugPrint('App initialization failed: ${failure.message}');
    runApp(const MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Initialization failed')),
      ),
    ),);
  }
}
