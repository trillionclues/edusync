import 'package:flutter/material.dart';
import 'package:glypha/features/home/data/model/level_data.dart';
import 'package:glypha/features/home/presentation/widgets/landscape_layers.dart';
import 'package:glypha/features/home/presentation/widgets/level_mode.dart';
import 'package:glypha/features/home/presentation/widgets/path_finder.dart';

class MapView extends StatelessWidget {
  final ScrollController scrollController;
  final AnimationController pulseController;

  const MapView({super.key,
    required this.scrollController,
    required this.pulseController,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final levels = [
      LevelData(1, 0.5, true, false, true, '📐'),
      LevelData(2, 0.3, true, false, false, '⚛️'),
      LevelData(3, 0.7, true, false, false, '🧪'),
      LevelData(4, 0.4, false, true, false, '🧬'),
      LevelData(5, 0.6, false, true, false, '📐'),
      LevelData(6, 0.35, false, true, false, '⚛️'),
      LevelData(7, 0.65, false, true, false, '🧪'),
      LevelData(8, 0.5, false, true, false, '🧬'),
    ];

    final totalHeight = 180.0 * levels.length + 400.0;

    return SingleChildScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        width: screenWidth,
        height: totalHeight,
        child: Stack(
          children: [
            // Sky gradient
            Container(
              height: totalHeight,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF87CEEB),
                    Color(0xFFB4E4F3),
                    Color(0xFFD4F1F4),
                  ],
                ),
              ),
            ),

            // Landscape layers
            LandscapeLayers(height: totalHeight),

            // Path
            CustomPaint(
              size: Size(screenWidth, totalHeight),
              painter: PathPainter(levels, screenWidth),
            ),

            // Level nodes
            ...levels.asMap().entries.map((entry) {
              final index = entry.key;
              final level = entry.value;
              final yPosition = (levels.length - index) * 180.0 + 50;

              return Positioned(
                left: screenWidth * level.xPosition - 35,
                top: yPosition,
                child: LevelNode(
                  level: level,
                  pulseController: pulseController,
                ),
              );
            }).toList(),

            // Bottom padding for navigation bar
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}