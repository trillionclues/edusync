import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  static const String route = '/leaderboard';
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.leaderboard_rounded, size: 100, color: Colors.grey),
            const SizedBox(height: 20),
            Text(
              'Leaderboard',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}