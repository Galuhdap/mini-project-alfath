// To parse this JSON data, do
//
//     final sendOtpVerificationResponse = sendOtpVerificationResponseFromJson(jsonString);

import 'dart:convert';

SendOtpVerificationResponse sendOtpVerificationResponseFromJson(String str) => SendOtpVerificationResponse.fromJson(json.decode(str));

String sendOtpVerificationResponseToJson(SendOtpVerificationResponse data) => json.encode(data.toJson());

class SendOtpVerificationResponse {
    final Meta meta;
    final List<dynamic> data;
    final dynamic other;

    SendOtpVerificationResponse({
        required this.meta,
        required this.data,
        required this.other,
    });

    factory SendOtpVerificationResponse.fromJson(Map<String, dynamic> json) => SendOtpVerificationResponse(
        meta: Meta.fromJson(json["meta"]),
        data: List<dynamic>.from(json["data"].map((x) => x)),
        other: json["other"],
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x)),
        "other": other,
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
