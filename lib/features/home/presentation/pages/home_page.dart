import 'package:edusync_hub/core/providers/app_bar_provider.dart';
import 'package:edusync_hub/core/widgets/layout/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static const route = '/home';

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appBarState = ref.watch(appBarProvider);

    return Scaffold(
      appBar: appBarState.showAppBar
          ? CustomAppBar(
              title: appBarState.title,
              showBackButton: appBarState.showBackButton,
              actions: appBarState.actions,
              type: appBarState.type,
            )
          : null,
      body: const _HomeContent(),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Home Page!',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
