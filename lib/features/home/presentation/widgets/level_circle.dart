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
      content = Stack(
        alignment: Alignment.center,
        children: [
          const Icon(Icons.check_rounded, size: 30, color: Colors.white),
          Positioned(
            top: 25,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                3,
                (index) => const Icon(
                  Icons.star,
                  size: 8,
                  color: Color(0xFFFFD700),
                ),
              ),
            ),
          ),
        ],
      );
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
            border: Border.all(
              color: level.isCurrent
                  ? const Color(0xFFFFD700)
                  : Colors.white.withOpacity(0.5),
              width: level.isCurrent ? 3 : 2,
            ),
            boxShadow: [
              BoxShadow(
                color: level.isCurrent
                    ? const Color(0xFFFFD700).withOpacity(0.4)
                    : Colors.black.withOpacity(0.15),
                blurRadius: level.isCurrent ? 12 : 8,
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.emoji_events_rounded,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
