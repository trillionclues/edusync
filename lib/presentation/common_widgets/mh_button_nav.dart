import 'package:flutter/material.dart';
import 'package:micro_habits/core/theme/app_colors.dart';

class MhButtonNav extends StatelessWidget {
  const MhButtonNav({
    required this.currentIndex, required this.onTap, super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () => onTap(2),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    '+ New habit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          GestureDetector(
            onTap: () => onTap(1),
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.pause_rounded,
                size: 28,
                color: currentIndex == 1
                    ? AppColors.primary
                    : Colors.white.withOpacity(0.8),
              ),
            ),
          ),

          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => onTap(0),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.settings_rounded,
                size: 26,
                color: currentIndex == 0
                    ? AppColors.primary
                    : Colors.white.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
