import 'package:glypha/core/injection/injection_container.dart';
import 'package:logger/logger.dart';

Logger get log => getIt<Logger>();

void setupLogger() {
  getIt.registerLazySingleton<Logger>(
    () => Logger(
      printer: PrettyPrinter(
        methodCount: 1,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: false,
      ),
    ),
  );
}
