import 'package:flutter/material.dart';
import 'package:micro_habits/core/theme/app_colors.dart';
import 'package:micro_habits/domain/entities/habit.dart';

class HabitsCard extends StatelessWidget {
  const HabitsCard({
    required this.habit,
    required this.onToggle,
    super.key,
  });

  final Habit habit;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: habit.completed
            ? const Color(0xFF6FD89C).withOpacity(0.15)
            : Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: habit.completed ? AppColors.primary : Colors.grey.shade400,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  habit.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2D2D2D),
                    decoration:
                        habit.completed ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  _timeLabel(habit.dueDate),
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => onToggle(!habit.completed),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: habit.completed ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: habit.completed
                      ? AppColors.primary
                      : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: habit.completed
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  String _timeLabel(DateTime date) {
    final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
    final suffix = date.hour >= 12 ? 'PM' : 'AM';
    return 'Due $hour:${date.minute.toString().padLeft(2, '0')} $suffix';
  }
}
