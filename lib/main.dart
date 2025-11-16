import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glypha/app/app.dart';
import 'package:glypha/core/injection/injection_container.dart';
import 'package:glypha/core/utilities/logger.dart';
import 'package:glypha/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies();

  setupLogger();

  runApp(const ProviderScope(
    child: GlyphaApp(),
  ));
}
