part of 'user.dart';

class Role {
  Role._();

  static const String user = "user";
  static const String doctor = "doctor";
  static const String pharmacist = "pharmacist";

  static fromMap(json) {
    if (json == user) {
      return Role.user;
    } else if (json == doctor) {
      return Role.doctor;
    } else if (json == pharmacist) {
      return Role.pharmacist;
    } else {
      return Role.user;
    }
  }
}
