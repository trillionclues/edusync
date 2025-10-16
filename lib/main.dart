import 'package:flutter/material.dart';
import 'package:micro_habits/app.dart';
import 'package:micro_habits/bootstrap.dart';

Future<void> main() async {
  final result = await Bootstrap.initialize();
  runApp(App(dependencies: result.right));
}
