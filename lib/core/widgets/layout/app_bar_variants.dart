import 'package:flutter/material.dart';
import 'custom_app_bar.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String hintText;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onSearchTap;
  final TextEditingController? controller;
  final bool autoFocus;
  final List<Widget>? actions;

  const SearchAppBar({
    super.key,
    this.hintText = 'Search...',
    this.onSearchChanged,
    this.onSearchTap,
    this.controller,
    this.autoFocus = false,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      titleWidget: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          controller: controller,
          autofocus: autoFocus,
          onChanged: onSearchChanged,
          onTap: onSearchTap,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search, size: 20),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ),
      type: AppBarType.secondary,
      elevation: 1,
      actions: actions,
    );
  }
}

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String userEmail;
  final String? imageUrl;
  final VoidCallback? onProfileTap;
  final List<Widget>? actions;

  const ProfileAppBar({
    super.key,
    required this.userName,
    required this.userEmail,
    this.imageUrl,
    this.onProfileTap,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      toolbarHeight: 80,
      titleWidget: GestureDetector(
        onTap: onProfileTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: imageUrl != null
                  ? NetworkImage(imageUrl!)
                  : const AssetImage('assets/images/default_avatar.png')
                      as ImageProvider,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    userEmail,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      type: AppBarType.secondary,
      actions: actions,
    );
  }
}

class TabbedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> tabs;
  final TabController? tabController;
  final List<Widget>? actions;

  const TabbedAppBar({
    super.key,
    required this.title,
    required this.tabs,
    this.tabController,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(104);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: title,
          actions: actions,
          type: AppBarType.primary,
        ),
        Container(
          height: 48,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: TabBar(
            controller: tabController,
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey[600],
            indicatorColor: Theme.of(context).primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
