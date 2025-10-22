import 'package:edusync_hub/core/widgets/layout/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appBarProvider =
    StateNotifierProvider<AppBarNotifier, AppBarState>((ref) {
  return AppBarNotifier();
});

class AppBarState {
  final bool showAppBar;
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final AppBarType type;

  const AppBarState({
    this.showAppBar = true,
    this.title = '',
    this.showBackButton = true,
    this.actions,
    this.type = AppBarType.primary,
  });

  AppBarState copyWith({
    bool? showAppBar,
    String? title,
    bool? showBackButton,
    List<Widget>? actions,
    AppBarType? type,
  }) {
    return AppBarState(
      showAppBar: showAppBar ?? this.showAppBar,
      title: title ?? this.title,
      showBackButton: showBackButton ?? this.showBackButton,
      actions: actions ?? this.actions,
      type: type ?? this.type,
    );
  }
}

class AppBarNotifier extends StateNotifier<AppBarState> {
  AppBarNotifier() : super(const AppBarState());

  void updateAppBar({
    bool? showAppBar,
    String? title,
    bool? showBackButton,
    List<Widget>? actions,
    AppBarType? type,
  }) {
    state = state.copyWith(
      showAppBar: showAppBar,
      title: title,
      showBackButton: showBackButton,
      actions: actions,
      type: type,
    );
  }

  void hideAppBar() {
    state = state.copyWith(showAppBar: false);
  }

  void showAppBar({String title = ''}) {
    state = state.copyWith(showAppBar: true, title: title);
  }

  void clearActions() {
    state = state.copyWith(actions: null);
  }

  void reset() {
    state = const AppBarState();
  }
}
