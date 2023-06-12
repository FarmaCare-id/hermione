part 'role.dart';

class User {
  // TODO: add user login type & fix nullable attribute
  int? id;
  int? email;
  String? fullName;
  String? hashedPassword;
  Role? role;
  // LoginType userLoginType
  int? weight;
  int? height;
  int? age;

  // only medical assistant
  String? noSip;
  String? noSipa;
  String? specialist;
  String? title;

  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  User({
    this.id,
    this.email,
    this.fullName,
    this.hashedPassword,
    this.role,
    this.weight,
    this.height,
    this.age,
    this.noSip,
    this.noSipa,
    this.specialist,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["data"]["id"],
        email: json["data"]["email"],
        fullName: json["data"]["fullName"],
        hashedPassword: json["data"]["hashedPassword"],
        // role: Role.fromMap(json["data"]["role"]),
        weight: json["data"]["weight"],
        height: json["data"]["height"],
        age: json["data"]["age"],
        noSip: json["data"]["noSip"],
        noSipa: json["data"]["noSipa"],
        specialist: json["data"]["specialist"],
        title: json["data"]["title"],
        createdAt: DateTime.parse(json["data"]["createdAt"]),
        updatedAt: DateTime.parse(json["data"]["updatedAt"]),
        deletedAt: DateTime.parse(json["data"]["deletedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "fullName": fullName,
        "hashedPassword": hashedPassword,
        // "role": role!.toMap(),
        "weight": weight,
        "height": height,
        "age": age,
        "noSip": noSip,
        "noSipa": noSipa,
        "specialist": specialist,
        "title": title,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "deletedAt": deletedAt!.toIso8601String(),
      };
}
