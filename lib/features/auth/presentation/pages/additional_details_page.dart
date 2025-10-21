import 'package:flutter/material.dart';

class AdditionalDetailsPage extends StatelessWidget {
  const AdditionalDetailsPage({super.key});

  static const route = '/additionalDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Additional Details'),
      ),
      body: const Center(
        child: Text('This is the Additional Details Page'),
      ),
    );
  }
}
