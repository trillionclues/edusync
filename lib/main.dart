import 'package:edusync_hub/app/app.dart';
import 'package:edusync_hub/core/injection/injection_container.dart';
import 'package:edusync_hub/core/utilities/logger.dart';
import 'package:edusync_hub/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies();

  setupLogger();

  runApp(const ProviderScope(
    child: EduSyncApp(),
  ));
}
