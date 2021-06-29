// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.userId,
    this.name,
    this.email,
    this.username,
    this.password,
    this.passwordRepeat,
    this.accessToken,
  });

  int userId;
  String name;
  String email;
  String username;
  String password;
  String passwordRepeat;
  String accessToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["ID"] == null ? null : json["ID"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    username: json["username"] == null ? null : json["username"],
    password: json["password"] == null ? null : json["password"],
    passwordRepeat: json["passwordRepeat"] == null ? null : json["passwordRepeat"],
    accessToken: json["accessToken"] == null ? null : json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "ID": userId == null ? null : userId,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "username": username == null ? null : username,
    "password": password == null ? null : password,
    "passwordRepeat": passwordRepeat == null ? null : passwordRepeat,
    "accessToken": accessToken == null ? null : accessToken,
  };
}