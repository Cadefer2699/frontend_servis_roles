

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:rolusuario/src/models/rol.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? name;
  String? lastname;
  String? email;
  String? phone;
  String? password;
  String? sessionToken;
  String? image;
  List<Rol>? roles = [];

  User({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.phone,
    this.password,
    this.sessionToken,
    this.image,
    this.roles
  });

  factory User.fromJson(Map<String, dynamic> json) {

    // Manejo de roles
    List<dynamic>? rolesData = json['roles'];

    List<Rol> convertedRoles = rolesData != null && rolesData is List
    ? rolesData.map((rolesJson) => Rol.fromJson(rolesJson)).toList()
    : [];

    return User(
      id: json["id"] is int ? json['id'].toString() : json["id"],
      name: json["name"],
      lastname: json["lastname"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
      sessionToken: json["session_token"],
      image: json["image"],
      roles: convertedRoles,
    ); 
  }

    //roles: json["roles"] == null ? [] : List<Rol>.from(json['roles'].map((model) => Rol.fromJson(model))) ?? [],
    /*si me devuelven null(campo_vacio) devuelveme un campo vacio ? []
    : Si no es el caso, creamos una lista del campo Rol .from(json[´roles´],
    queremos obtener los roles .map (es un metodo), despues de model, vamos
    a crear una función de flecha Rol.fromJson si viene nulo que me devuelva un
    conjunto vacio 
    */



  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "password": password,
    "session_token": sessionToken,
    "image": image,
    "roles": roles
  };
}
