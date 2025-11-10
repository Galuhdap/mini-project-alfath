// To parse this JSON data, do
//
//     final checkEmailResponse = checkEmailResponseFromJson(jsonString);

import 'dart:convert';

CheckEmailResponse checkEmailResponseFromJson(String str) => CheckEmailResponse.fromJson(json.decode(str));

String checkEmailResponseToJson(CheckEmailResponse data) => json.encode(data.toJson());

class CheckEmailResponse {
    final Meta meta;
    final Data data;
    final dynamic other;

    CheckEmailResponse({
        required this.meta,
        required this.data,
        required this.other,
    });

    factory CheckEmailResponse.fromJson(Map<String, dynamic> json) => CheckEmailResponse(
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
    final bool isRegistered;

    Data({
        required this.isRegistered,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        isRegistered: json["is_registered"],
    );

    Map<String, dynamic> toJson() => {
        "is_registered": isRegistered,
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
