import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppBarType {
  primary,
  secondary,
  transparent,
  gradient,
}

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final Widget? leading;
  final double elevation;
  final bool centerTitle;
  final double toolbarHeight;
  final AppBarType type;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Widget? flexibleSpace;
  final double titleSpacing;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    this.title = '',
    this.titleWidget,
    this.showBackButton = true,
    this.onBackPressed,
    this.actions,
    this.leading,
    this.elevation = 0,
    this.centerTitle = false,
    this.toolbarHeight = 56,
    this.type = AppBarType.primary,
    this.backgroundColor,
    this.gradient,
    this.flexibleSpace,
    this.titleSpacing = 0,
    this.automaticallyImplyLeading = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = _getAppBarColors(theme);

    return AppBar(
      backgroundColor: colors.backgroundColor,
      foregroundColor: colors.foregroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: _buildLeading(context),
      title: _buildTitle(),
      actions: _buildActions(),
      flexibleSpace: flexibleSpace ?? _buildFlexibleSpace(colors),
      titleSpacing: titleSpacing,
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (leading != null) return leading;

    if (showBackButton && Navigator.of(context).canPop()) {
      return _buildBackButton(context);
    }

    return null;
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
      onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(),
    );
  }

  Widget _buildTitle() {
    if (titleWidget != null) return titleWidget!;

    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: _getTitleColor(),
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  List<Widget>? _buildActions() {
    if (actions == null) return null;

    return [
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Row(
          children: actions!,
        ),
      ),
    ];
  }

  Widget? _buildFlexibleSpace(_AppBarColors colors) {
    if (gradient != null) {
      return Container(
        decoration: BoxDecoration(gradient: gradient),
      );
    }
    return null;
  }

  Color _getTitleColor() {
    switch (type) {
      case AppBarType.transparent:
        return Colors.white;
      case AppBarType.gradient:
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  _AppBarColors _getAppBarColors(ThemeData theme) {
    switch (type) {
      case AppBarType.primary:
        return _AppBarColors(
          backgroundColor: backgroundColor ?? theme.primaryColor,
          foregroundColor: Colors.white,
        );
      case AppBarType.secondary:
        return _AppBarColors(
          backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
          foregroundColor: theme.colorScheme.onBackground,
        );
      case AppBarType.transparent:
        return _AppBarColors(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        );
      case AppBarType.gradient:
        return _AppBarColors(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        );
    }
  }
}

class _AppBarColors {
  final Color backgroundColor;
  final Color foregroundColor;

  _AppBarColors({
    required this.backgroundColor,
    required this.foregroundColor,
  });
}