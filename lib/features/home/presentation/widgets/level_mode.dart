import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glypha/features/home/data/model/level_data.dart';
import 'package:glypha/features/home/presentation/widgets/level_circle.dart';

class LevelNode extends StatelessWidget {
  final LevelData level;
  final AnimationController pulseController;

  const LevelNode({super.key,
    required this.level,
    required this.pulseController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: level.isLocked
          ? null
          : () {
        HapticFeedback.mediumImpact();
        _showLevelDialog(context);
      },
      child: Column(
        children: [
          level.isCurrent
              ? AnimatedBuilder(
            animation: pulseController,
            builder: (context, child) {
              final scale = 1.0 +
                  (math.sin(pulseController.value * 2 * math.pi) * 0.08);
              return Transform.scale(scale: scale, child: child);
            },
            child: LevelCircle(level: level),
          )
              : LevelCircle(level: level),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              'Level ${level.number}',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Color(0xFF4A5568),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLevelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Text(level.emoji, style: const TextStyle(fontSize: 32)),
            const SizedBox(width: 12),
            Text('Level ${level.number}'),
          ],
        ),
        content: Text(level.isCompleted
            ? 'Replay this level? ✓'
            : 'Start this challenge?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Play'),
          ),
        ],
      ),
    );
  }
}