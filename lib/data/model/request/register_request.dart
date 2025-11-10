// To parse this JSON data, do
//
//     final registerAuthRequest = registerAuthRequestFromJson(jsonString);

import 'dart:convert';

RegisterAuthRequest registerAuthRequestFromJson(String str) => RegisterAuthRequest.fromJson(json.decode(str));

String registerAuthRequestToJson(RegisterAuthRequest data) => json.encode(data.toJson());

class RegisterAuthRequest {
    final String name;
    final String email;
    final String password;
    final String phoneNumber;

    RegisterAuthRequest({
        required this.name,
        required this.email,
        required this.password,
        required this.phoneNumber,
    });

    factory RegisterAuthRequest.fromJson(Map<String, dynamic> json) => RegisterAuthRequest(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
    };
}
