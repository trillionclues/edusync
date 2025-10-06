import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:micro_habits/data/drift/database.dart';
import 'package:micro_habits/data/repositories/habit_repository.dart';

class Bootstrap {
  /// Initialize all app deeps.
  static Future<HabitRepository> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();
    final prefsBox = await Hive.openBox('preferences');

    final database = AppDatabase();

    final habitRepository = HabitRepository(
      database: database,
      prefsBox: prefsBox,
    );

    return habitRepository;
  }
}