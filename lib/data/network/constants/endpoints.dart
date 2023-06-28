import 'package:farmacare/constants/environment.dart';

class Endpoints {
  Endpoints._();

  static const String testUrl = "https://jsonplaceholder.typicode.com/posts";

  // base url
  static final String baseUrl = Environment.asclepiusURL;

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static final String getPosts = baseUrl + "/post";

  static final String getProfile = baseUrl + "/profile";

  // auth endpoints
  static final String auth = baseUrl + "/auth";
  static final String login = auth + "/login";
  static final String logout = auth + "/logout";
  static final String register = auth + "/register";
  static final String registerDoctor = auth + "/register/doctor";
  static final String registerPharmacist = auth + "/register/pharmacist";

  // user endpoints
  static final String profile = baseUrl + "/profile";
}