import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
  ignoreUnregisteredTypes: [Dio],
)
Future<void> configureDependencies() async {
  await _registerManualDependencies();
  $initGetIt(getIt);
}

Future<void> _registerManualDependencies() async {
  getIt.registerLazySingleton<Dio>(() => Dio()
    ..options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    )
    ..interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    )));

  getIt.registerLazySingleton<firebase_auth.FirebaseAuth>(
      () => firebase_auth.FirebaseAuth.instance);

  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  getIt.registerLazySingleton<GoogleSignIn>(
    () => GoogleSignIn(),
  );
}
