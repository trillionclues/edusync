import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:glypha/features/home/presentation/widgets/hills_painter.dart';

class LandscapeLayers extends StatelessWidget {
  final double height;

  const LandscapeLayers({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(screenWidth, height),
            painter: HillsPainter(),
          ),
          ..._generateDecorations(screenWidth, height),
        ],
      ),
    );
  }

  List<Widget> _generateDecorations(double screenWidth, double totalHeight) {
    final List<Widget> decorations = [];
    final random = math.Random(42);

    // Calculate number of sections based on height
    final numSections = (totalHeight / 200).ceil();

    for (int i = 0; i < numSections; i++) {
      final sectionTop = i * 200.0;

      if (i % 2 == 0) {
        decorations.add(
          Positioned(
            left: 30 + random.nextDouble() * 20,
            top: sectionTop + 50 + random.nextDouble() * 100,
            child: _DecorativeTree(size: 45 + random.nextDouble() * 15),
          ),
        );
      }

      if (i % 3 == 1) {
        decorations.add(
          Positioned(
            right: 35 + random.nextDouble() * 25,
            top: sectionTop + 80 + random.nextDouble() * 80,
            child: _DecorativeTree(
                size: 40 + random.nextDouble() * 20, isDark: true),
          ),
        );
      }

      if (i % 2 == 1) {
        decorations.add(
          Positioned(
            left: 90 + random.nextDouble() * 40,
            top: sectionTop + 120 + random.nextDouble() * 60,
            child: _Bush(size: 28 + random.nextDouble() * 8),
          ),
        );
      }

      if (i % 3 == 0) {
        decorations.add(
          Positioned(
            right: 100 + random.nextDouble() * 30,
            top: sectionTop + 140 + random.nextDouble() * 50,
            child: _Bush(size: 25 + random.nextDouble() * 10),
          ),
        );
      }

      if (i % 2 == 0) {
        decorations.add(
          Positioned(
            left: 130 + random.nextDouble() * 50,
            top: sectionTop + 100 + random.nextDouble() * 80,
            child: _Flower(type: random.nextInt(3)),
          ),
        );
      }

      if (i % 3 == 2) {
        decorations.add(
          Positioned(
            right: 140 + random.nextDouble() * 40,
            top: sectionTop + 90 + random.nextDouble() * 90,
            child: _Flower(type: random.nextInt(3)),
          ),
        );
      }

      if (i % 4 == 1) {
        decorations.add(
          Positioned(
            left: 110 + random.nextDouble() * 60,
            top: sectionTop + 160 + random.nextDouble() * 40,
            child: _Rock(size: 25 + random.nextDouble() * 10),
          ),
        );
      }

      if (i % 3 == 0) {
        decorations.add(
          Positioned(
            left: 70 + random.nextDouble() * 30,
            top: sectionTop + 170 + random.nextDouble() * 30,
            child: const _GrassPatch(),
          ),
        );
      }

      if (i % 3 == 2) {
        decorations.add(
          Positioned(
            right: 80 + random.nextDouble() * 35,
            top: sectionTop + 150 + random.nextDouble() * 40,
            child: const _GrassPatch(),
          ),
        );
      }
    }

    return decorations;
  }
}

//===== DECORATIVE WIDGETS ====== //

class _DecorativeTree extends StatelessWidget {
  final double size;
  final bool isDark;

  const _DecorativeTree({required this.size, this.isDark = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      isDark ? '🌲' : '🌳',
      style: TextStyle(fontSize: size),
    );
  }
}

class _Bush extends StatelessWidget {
  final double size;

  const _Bush({required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      '🌿',
      style: TextStyle(fontSize: size),
    );
  }
}

class _Flower extends StatelessWidget {
  final int type;

  const _Flower({required this.type});

  @override
  Widget build(BuildContext context) {
    final flowers = ['🌸', '🌼', '🌺'];
    return Text(
      flowers[type % flowers.length],
      style: const TextStyle(fontSize: 22),
    );
  }
}

class _Rock extends StatelessWidget {
  final double size;

  const _Rock({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 0.7,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(size / 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }
}

class _GrassPatch extends StatelessWidget {
  const _GrassPatch();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '🌾',
      style: TextStyle(fontSize: 20),
    );
  }
}
