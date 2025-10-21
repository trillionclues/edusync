import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  const AuthForm({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
