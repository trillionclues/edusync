import 'package:flutter/material.dart';
import 'package:glypha/features/home/data/model/level_data.dart';

class LevelCircle extends StatelessWidget {
  final LevelData level;

  const LevelCircle({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Widget content;
    bool hasCrown = level.isCurrent && !level.isLocked;

    if (level.isLocked) {
      bgColor = const Color(0xFF8B8B8B);
      content = const Icon(Icons.lock_rounded, size: 28, color: Colors.white);
    } else if (level.isCompleted) {
      bgColor = const Color(0xFFCD9B66);
      content = const Icon(Icons.check_rounded, size: 30, color: Colors.white);
    } else {
      bgColor = Colors.white;
      content = Text(level.emoji, style: const TextStyle(fontSize: 30));
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(child: content),
        ),
        if (hasCrown)
          Positioned(
            top: -8,
            right: -8,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFFFFD700),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.emoji_events_rounded,
                  size: 18, color: Colors.white),
            ),
          ),
      ],
    );
  }
}