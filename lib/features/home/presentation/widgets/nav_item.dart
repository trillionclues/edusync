import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glypha/core/themes/app_theme.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({super.key,
    required this.icon,
    required this.activeIcon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ?AppTheme.primaryOrange // Duolingo blue
        : AppTheme.lightOrange; // Lighter gray

    return InkWell(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(14),
        child: Icon(
          isActive ? activeIcon : icon,
          color: color,
          size: 32,
        ),
      ),
    );
  }
}