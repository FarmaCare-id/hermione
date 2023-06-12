import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:farmacare/constants/environment.dart';

class Endpoints {
  Endpoints._();

  

  // base url
  static final String baseUrl = Environment.asclepiusURL;

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static final String getPosts = baseUrl + "/posts";
}