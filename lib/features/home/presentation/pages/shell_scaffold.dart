import 'package:flutter/material.dart';
import 'package:glypha/features/home/presentation/widgets/custom_bottom_navigation.dart';

class ShellScaffold extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final ValueChanged<int> onNavTap;

  const ShellScaffold({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigation(
              currentIndex: currentIndex,
              onTap: onNavTap,
            ),
          ),
        ],
      ),
    );
  }
}
