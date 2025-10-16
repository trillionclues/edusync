import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:micro_habits/core/theme/app_colors.dart';

class CalendarStrip extends StatelessWidget {
  const CalendarStrip({super.key, this.selectedDate, this.onDateSelected});

  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateSelected;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final selected = selectedDate ?? today;

    // Generate 7 days (3 before, today, 3 after)
    final dates = List.generate(10, (index) {
      return today.subtract(Duration(days: 5 - index));
    });

    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: dates.length,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (context, index) {
            final date = dates[index];
            final isSelected = date.day == selected.day &&
                date.month == selected.month &&
                date.year == selected.year;
            final isToday = date.day == today.day &&
                date.month == today.month &&
                date.year == today.year;

            return _DateItem(
              date: date,
              isSelected: isSelected,
              isToday: isToday,
              onTap: () => onDateSelected?.call(date),
            );
          }),
    );
  }
}

class _DateItem extends StatelessWidget {
  const _DateItem(
      {required this.date,
      required this.isSelected,
      required this.isToday,
      required this.onTap});

  final DateTime date;
  final bool isSelected;
  final bool isToday;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dayTextColor = isSelected
        ? Colors.white
        : isToday
            ? const Color(0xFF4E55E0)
            : const Color(0xFF2D2D2D);

    final bgColor = isSelected
        ? AppColors.primary
        : isToday
            ? const Color(0xFF4E55E0).withOpacity(0.1)
            : const Color(0xFFF3F6ED);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        width: 40,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF4E55E0).withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: dayTextColor.withOpacity(0.7),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              child: Text(
                DateFormat('E').format(date).substring(0, 2).toUpperCase(),
              ),
            ),
            const SizedBox(height: 6),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF2D2D2D),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              child: Text(
                date.day.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
