import 'dart:convert';

class GetBarberShopResponse {
    final bool success;
    final int code;
    final String message;
    final List<Datum> data;

    GetBarberShopResponse({
        required this.success,
        required this.code,
        required this.message,
        required this.data,
    });

    factory GetBarberShopResponse.fromRawJson(String str) => GetBarberShopResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetBarberShopResponse.fromJson(Map<String, dynamic> json) => GetBarberShopResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final String id;
    final String ownerId;
    final String name;
    final String address;
    final String city;
    final String phoneNumber;
    final String openingHours;
    final DateTime createdAt;
    final bool isActive;
    final List<Barber> barbers;

    Datum({
        required this.id,
        required this.ownerId,
        required this.name,
        required this.address,
        required this.city,
        required this.phoneNumber,
        required this.openingHours,
        required this.createdAt,
        required this.isActive,
        required this.barbers,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        ownerId: json["ownerId"],
        name: json["name"],
        address: json["address"],
        city: json["city"],
        phoneNumber: json["phone_number"],
        openingHours: json["opening_hours"],
        createdAt: DateTime.parse(json["created_at"]),
        isActive: json["isActive"],
        barbers: List<Barber>.from(json["barbers"].map((x) => Barber.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ownerId": ownerId,
        "name": name,
        "address": address,
        "city": city,
        "phone_number": phoneNumber,
        "opening_hours": openingHours,
        "created_at": createdAt.toIso8601String(),
        "isActive": isActive,
        "barbers": List<dynamic>.from(barbers.map((x) => x.toJson())),
    };
}

class Barber {
    final String id;
    final String userId;
    final String email;
    final String fullName;
    final dynamic phoneNumber;
    final dynamic profilePictureUrl;
    final DateTime updatedAt;
    final String barbershopId;
    final dynamic bio;
    final bool isVerified;
    final String averageRating;

    Barber({
        required this.id,
        required this.userId,
        required this.email,
        required this.fullName,
        required this.phoneNumber,
        required this.profilePictureUrl,
        required this.updatedAt,
        required this.barbershopId,
        required this.bio,
        required this.isVerified,
        required this.averageRating,
    });

    factory Barber.fromRawJson(String str) => Barber.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Barber.fromJson(Map<String, dynamic> json) => Barber(
        id: json["id"],
        userId: json["userId"],
        email: json["email"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        profilePictureUrl: json["profile_picture_url"],
        updatedAt: DateTime.parse(json["updated_at"]),
        barbershopId: json["barbershopId"],
        bio: json["bio"],
        isVerified: json["is_verified"],
        averageRating: json["average_rating"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "email": email,
        "full_name": fullName,
        "phone_number": phoneNumber,
        "profile_picture_url": profilePictureUrl,
        "updated_at": updatedAt.toIso8601String(),
        "barbershopId": barbershopId,
        "bio": bio,
        "is_verified": isVerified,
        "average_rating": averageRating,
    };
}
