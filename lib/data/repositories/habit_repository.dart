import 'package:hive/hive.dart';
import 'package:micro_habits/core/failure/failure.dart';
import 'package:micro_habits/core/model/either.dart';
import 'package:micro_habits/data/drift/database.dart';
import 'package:micro_habits/data/sources/local_generator.dart';
import 'package:micro_habits/domain/entities/habit.dart';
import 'package:uuid/uuid.dart';

/// handle habit data ops with Drift & Hive
class HabitRepository {
  HabitRepository({
    required AppDataBase database,
    required Box<dynamic> prefsBox,
  })  : _database = database,
        _prefsBox = prefsBox;

  final AppDataBase _database;
  final Box<dynamic> _prefsBox;
  static const _uuid = Uuid();
  static const String _wakeUpHourKey = 'wake_up_hour';

  Future<Either<Failure, List<Habit>>> getTodaysHabits() async {
    final today = DateTime.now();
    return _database.getHabitsForDate(today);
  }

  Stream<List<Habit>> watchTodaysHabits() {
    final today = DateTime.now();
    return _database.watchHabitsForDate(today);
  }

  Future<Either<Failure, void>> addRandomHabitForToday() async {
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);

    final habit = Habit(
      id: _uuid.v4(),
      title: LocalHabitGenerator.generateRandomHabitTitle(),
      completed: false,
      dueDate: normalizedToday,
    );

    await _database.addHabit(habit);
    return Either.right(null);
  }

  Future<Either<Failure, void>> updateHabitCompletion(
      String habitId, bool completed,) async {
    await _database.updateHabitCompletion(habitId, completed);
    return Either.right(null);
  }

  // get user's wake-up hour preference
  int getWakeUpHour() {
    return _prefsBox.get(_wakeUpHourKey, defaultValue: 7) as int;
  }

  // set user's wake-up hour preference
  Future<void> setWakeUpHour(int hour) async {
    await _prefsBox.put(_wakeUpHourKey, hour);
  }

  // clears all habits
  Future<void> clearAllHabits() async {
    await _database.clearAllHabits();
  }
}
