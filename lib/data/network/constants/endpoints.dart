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
  static final String getPosts = baseUrl + "/post";

  static final String getProfile = baseUrl + "/profile";

  static final String auth = baseUrl + "/auth";
  static final String login = auth + "/login";
  static final String register = auth + "/register";
  static final String registerDoctor = auth + "/register/doctor";
  static final String registerPharmacist = auth + "/register/pharmacist";
}