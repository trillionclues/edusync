import 'package:edusync_hub/core/providers/app_bar_provider.dart';
import 'package:edusync_hub/core/widgets/layout/custom_app_bar.dart';
import 'package:edusync_hub/core/widgets/layout/custom_bottom_navigation.dart';
import 'package:edusync_hub/features/auth/presentation/provider/auth_notifier.dart';
import 'package:edusync_hub/features/auth/presentation/provider/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  static const route = '/home';

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const _HomeContent(),
    const _ClassesContent(),
    const _MessagesContent(),
    const _ProfileContent(),
  ];

  @override
  Widget build(BuildContext context) {
    final appBarState = ref.watch(appBarProvider);
    final authState = ref.watch(authRepositoryProvider);

    return Scaffold(
      appBar: CustomAppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.grid_view_rounded),
            onPressed: () {
              // Menu action
            },
          ),
        ),
        titleWidget: Row(
          children: [
            Text(
              'Today\'s Class',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.orange[100],
            child: Icon(
              Icons.person,
              size: 20,
              color: Colors.orange[700],
            ),
          ),
          const SizedBox(width: 8),
        ],
        type: AppBarType.secondary,
        showBackButton: false,
        automaticallyImplyLeading: false,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// Placeholder content widgets
class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today's classes section
            Text(
              'Today\'s Class',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Placeholder for class cards
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text('Class Card - Build later'),
              ),
            ),
            const SizedBox(height: 16),

            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text('Class Card - Build later'),
              ),
            ),
            const SizedBox(height: 24),

            // Class schedule section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Class Schedule',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Feb 2023'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Placeholder for schedule
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text('Schedule - Build later'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClassesContent extends StatelessWidget {
  const _ClassesContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Classes Page',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class _MessagesContent extends StatelessWidget {
  const _MessagesContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Messages Page',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Page',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}