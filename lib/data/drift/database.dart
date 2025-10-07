import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:micro_habits/core/failure/failure.dart';
import 'package:micro_habits/core/model/either.dart';
import 'package:micro_habits/data/drift/tables.dart';
import 'package:micro_habits/domain/entities/habit.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

/// Main database class using Drift.
@DriftDatabase(tables: [Habits])
class AppDataBase extends _$AppDataBase {
  AppDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<Either<Failure, List<Habit>>> getHabitsForDate(DateTime date) async {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final query = select(habits)
      ..where((h) => h.dueDate.equals(normalizedDate));
    final rows = await query.get();

    final habitsList = rows.map<Habit>(_habitFromRow).toList();

    return Either.right(habitsList);
  }

  Future<Either<Failure, void>> addHabit(Habit habit) async {
    await into(habits).insert(
      HabitsCompanion(
        id: Value(habit.id),
        title: Value(habit.title),
        completed: Value(habit.completed),
        dueDate: Value(habit.dueDate),
      ),
    );

    return Either.right(null);
  }

  Future<Either<Failure, void>> updateHabitCompletion(
      String id, bool completed,) async {
    await (update(habits)..where((h) => h.id.equals(id)))
        .write(HabitsCompanion(completed: Value(completed)));

    return Either.right(null);
  }

  Future<Either<Failure, void>> clearAllHabits() async {
    await delete(habits).go();

    return Either.right(null);
  }

  Stream<List<Habit>> watchHabitsForDate(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final query = select(habits)
      ..where((h) => h.dueDate.equals(normalizedDate));

    return query.watch().map((rows) => rows.map<Habit>(_habitFromRow).toList());
  }

// convert database row to a Habit entity.
  Habit _habitFromRow(HabitsTableData row) {
    return Habit(
      id: row.id,
      title: row.title,
      completed: row.completed,
      dueDate: row.dueDate,
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'micro_habits.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
