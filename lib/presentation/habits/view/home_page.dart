import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_habits/core/theme/app_colors.dart';
import 'package:micro_habits/presentation/common_widgets/mh_button_nav.dart';
import 'package:micro_habits/presentation/habits/cubits/habit_list_cubit.dart';
import 'package:micro_habits/presentation/habits/view/widgets/calendar_strip.dart';
import 'package:micro_habits/presentation/habits/view/widgets/empty_habits.dart';
import 'package:micro_habits/presentation/habits/view/widgets/habits_card.dart';
import 'package:micro_habits/presentation/habits/view/widgets/header_section.dart';
import 'package:micro_habits/presentation/habits/view/widgets/motivation_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  int _currentNavIndex = 0;

  final List<String> _motivationalMessages = [
    'Start your day with water. One glass will energize you!',
    'Small steps lead to big changes. Keep going!',
    'You\'re building great habits. Stay consistent!',
    'Every day is a fresh start. Make it count!',
    'Progress, not perfection. You\'ve got this!',
  ];

  String get _todayMessage {
    return _motivationalMessages[
        DateTime.now().day % _motivationalMessages.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderSection(),
            CalendarStrip(
              selectedDate: _selectedDate,
              onDateSelected: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
            Expanded(
              child: BlocBuilder<HabitListCubit, HabitListState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF6FD89C),
                        ),
                      ),
                    );
                  }

                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: MotivationCard(
                          message: _todayMessage,
                        ),
                      ),
                      if (state.habits.isEmpty)
                        const SliverFillRemaining(
                          child: EmptyHabits(),
                        )
                      else
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final habit = state.habits[index];
                                return HabitsCard(
                                  habit: habit,
                                  onToggle: (completed) {
                                    context
                                        .read<HabitListCubit>()
                                        .toggleHabitCompletion(
                                          habit.id,
                                          completed,
                                        );
                                  },
                                );
                              },
                              childCount: state.habits.length,
                            ),
                          ),
                        ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 100),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: MhButtonNav(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          if (index == 2) {
            context.read<HabitListCubit>().addRandomHabit();
          } else {
            setState(() {
              _currentNavIndex = index;
            });
          }
        },
      ),
    );
  }
}
