// state for habit list
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_habits/data/repositories/habit_repository.dart';
import 'package:micro_habits/domain/entities/habit.dart';

class HabitListState {
  const HabitListState({
    this.habits = const [],
    this.isLoading = false,
  });

  final List<Habit> habits;
  final bool isLoading;

  HabitListState copyWith({
    List<Habit>? habits,
    bool? isLoading,
  }) {
    return HabitListState(
      habits: habits ?? this.habits,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// initialize and manage habit list state
class HabitListCubit extends Cubit<HabitListState> {
  HabitListCubit({
    required HabitRepository habitRepository,
  }) : _habitRepository = habitRepository, super(const HabitListState()) {
    _init();
  }

  final HabitRepository _habitRepository;
  StreamSubscription<List<Habit>>? _habitsSubscription;

  void _init() {
    emit(state.copyWith(isLoading: true));

    _habitsSubscription = _habitRepository.watchTodaysHabits().listen(
          (habits) {
        emit(state.copyWith(habits: habits, isLoading: false));
      },
      onError: (error) {
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  Future<void> addRandomHabit() async {
    try {
      await _habitRepository.addRandomHabitForToday();
    } catch (e) {
      // Handle error if needed or fail silently
    }
  }

  Future<void> toggleHabitCompletion(String habitId, bool completed) async {
    try {
      await _habitRepository.updateHabitCompletion(habitId, completed);
    } catch (e) {
      // Handle error if needed or fail silently
    }
  }

  @override
  Future<void> close() {
    _habitsSubscription?.cancel();
    return super.close();
  }
}
