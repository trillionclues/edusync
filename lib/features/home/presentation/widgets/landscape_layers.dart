import 'package:flutter/material.dart';
import 'package:glypha/features/home/presentation/widgets/hills_painter.dart';

class LandscapeLayers extends StatelessWidget {
  final double height;

  const LandscapeLayers({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, height),
            painter: HillsPainter(),
          ),
          Positioned(left: 40, top: 350, child: const Text('🌲', style: TextStyle(fontSize: 50))),
          Positioned(right: 50, top: 500, child: const Text('🌳', style: TextStyle(fontSize: 45))),
          Positioned(left: 60, top: 700, child: const Text('🌲', style: TextStyle(fontSize: 48))),
          Positioned(right: 40, top: 850, child: const Text('🌳', style: TextStyle(fontSize: 52))),
          Positioned(left: 80, top: 1000, child: const Text('🌲', style: TextStyle(fontSize: 46))),
          Positioned(right: 70, top: 1150, child: const Text('🌳', style: TextStyle(fontSize: 50))),
          Positioned(left: 100, top: 450, child: const Text('🌿', style: TextStyle(fontSize: 30))),
          Positioned(right: 90, top: 650, child: const Text('🌿', style: TextStyle(fontSize: 28))),
          Positioned(left: 120, top: 900, child: const Text('🌿', style: TextStyle(fontSize: 32))),
          Positioned(left: 140, top: 550, child: const Text('🌸', style: TextStyle(fontSize: 24))),
          Positioned(right: 130, top: 750, child: const Text('🌼', style: TextStyle(fontSize: 22))),
          Positioned(left: 110, top: 1050, child: const Text('🌸', style: TextStyle(fontSize: 26))),
        ],
      ),
    );
  }
}