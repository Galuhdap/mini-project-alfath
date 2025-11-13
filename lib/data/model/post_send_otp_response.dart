// To parse this JSON data, do
//
//     final sendOtpResponse = sendOtpResponseFromJson(jsonString);

import 'dart:convert';

SendOtpResponse sendOtpResponseFromJson(String str) => SendOtpResponse.fromJson(json.decode(str));

String sendOtpResponseToJson(SendOtpResponse data) => json.encode(data.toJson());

class SendOtpResponse {
    final Meta meta;
    final Data data;
    final dynamic other;

    SendOtpResponse({
        required this.meta,
        required this.data,
        required this.other,
    });

    factory SendOtpResponse.fromJson(Map<String, dynamic> json) => SendOtpResponse(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
        other: json["other"],
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
        "other": other,
    };
}

class Data {
    final String name;
    final String telepon;
    final String token;

    Data({
        required this.name,
        required this.telepon,
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        telepon: json["telepon"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "telepon": telepon,
        "token": token,
    };
}

class Meta {
    final int statusCode;
    final String message;

    Meta({
        required this.statusCode,
        required this.message,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        statusCode: json["status_code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
    };
}
