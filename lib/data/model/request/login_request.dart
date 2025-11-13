// To parse this JSON data, do
//
//     final postLoginAuthRequest = postLoginAuthRequestFromJson(jsonString);

import 'dart:convert';

PostLoginAuthRequest postLoginAuthRequestFromJson(String str) => PostLoginAuthRequest.fromJson(json.decode(str));

String postLoginAuthRequestToJson(PostLoginAuthRequest data) => json.encode(data.toJson());

class PostLoginAuthRequest {
    final String email;
    final String password;

    PostLoginAuthRequest({
        required this.email,
        required this.password,
    });

    factory PostLoginAuthRequest.fromJson(Map<String, dynamic> json) => PostLoginAuthRequest(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
