import 'package:flutter/material.dart';

class HabitsPage extends StatelessWidget {
  const HabitsPage({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Habits Page'),
      ),
    );
  }
}
