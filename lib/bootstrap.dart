import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:micro_habits/core/failure/failure.dart';
import 'package:micro_habits/core/model/either.dart';
import 'package:micro_habits/data/drift/database.dart';
import 'package:micro_habits/data/repositories/auth_repository.dart';
import 'package:micro_habits/data/repositories/habit_repository.dart';
import 'package:micro_habits/firebase_options.dart';

class AppDependencies {
  /// create all app deps
  const AppDependencies({
    required this.habitRepository,
    required this.authRepository,
  });

  final HabitRepository habitRepository;
  final AuthRepository authRepository;
}

/// initialize all app deps
class Bootstrap {
  static Future<Either<Failure, AppDependencies>> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      debugPrint('Firebase initialization failed: $e');
      debugPrint('App will run in offline-only mode');
    }

    await Hive.initFlutter();
    final prefsBox = await Hive.openBox<dynamic>('preferences');
    final database = AppDataBase();

    final habitRepository =
        HabitRepository(database: database, prefsBox: prefsBox);

    final authRepository = AuthRepository();

    return Either.right(AppDependencies(
        habitRepository: habitRepository, authRepository: authRepository,),);
  }
}
