import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  Environment._();

  // splash screen assets
  static const String fileName = ".env";

  // login screen assets
  static final String asclepiusURL = dotenv.env['FIBER_ASCLEPIUS'] ?? '';

}