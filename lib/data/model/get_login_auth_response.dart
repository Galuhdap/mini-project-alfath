// To parse this JSON data, do
//
//     final getLoginAuthResponse = getLoginAuthResponseFromJson(jsonString);

import 'dart:convert';

GetLoginAuthResponse getLoginAuthResponseFromJson(String str) => GetLoginAuthResponse.fromJson(json.decode(str));

String getLoginAuthResponseToJson(GetLoginAuthResponse data) => json.encode(data.toJson());

class GetLoginAuthResponse {
    final Meta meta;
    final Data data;

    GetLoginAuthResponse({
        required this.meta,
        required this.data,
    });

    factory GetLoginAuthResponse.fromJson(Map<String, dynamic> json) => GetLoginAuthResponse(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
    };
}

class Data {
    final String token;
    final User user;
    final int lokerNasional;
    final int lokerInternasional;
    final int expiresIn;
    final KelengkapanJobseeker kelengkapanJobseeker;

    Data({
        required this.token,
        required this.user,
        required this.lokerNasional,
        required this.lokerInternasional,
        required this.expiresIn,
        required this.kelengkapanJobseeker,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
        lokerNasional: json["lokerNasional"],
        lokerInternasional: json["lokerInternasional"],
        expiresIn: json["expires_in"],
        kelengkapanJobseeker: KelengkapanJobseeker.fromJson(json["kelengkapanJobseeker"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
        "lokerNasional": lokerNasional,
        "lokerInternasional": lokerInternasional,
        "expires_in": expiresIn,
        "kelengkapanJobseeker": kelengkapanJobseeker.toJson(),
    };
}

class KelengkapanJobseeker {
    final Kelengkapan kelengkapan;
    final bool canApply;
    final GroupScores groupScores;
    final Details details;

    KelengkapanJobseeker({
        required this.kelengkapan,
        required this.canApply,
        required this.groupScores,
        required this.details,
    });

    factory KelengkapanJobseeker.fromJson(Map<String, dynamic> json) => KelengkapanJobseeker(
        kelengkapan: Kelengkapan.fromJson(json["kelengkapan"]),
        canApply: json["can_apply"],
        groupScores: GroupScores.fromJson(json["group_scores"]),
        details: Details.fromJson(json["details"]),
    );

    Map<String, dynamic> toJson() => {
        "kelengkapan": kelengkapan.toJson(),
        "can_apply": canApply,
        "group_scores": groupScores.toJson(),
        "details": details.toJson(),
    };
}

class Details {
    final bool fotoProfile;
    final bool alamat;
    final bool tanggalLahir;
    final bool phoneVerifiedAt;
    final bool pengalamans;
    final bool pendidikans;
    final bool organisasis;
    final bool userSkills;
    final bool cv;

    Details({
        required this.fotoProfile,
        required this.alamat,
        required this.tanggalLahir,
        required this.phoneVerifiedAt,
        required this.pengalamans,
        required this.pendidikans,
        required this.organisasis,
        required this.userSkills,
        required this.cv,
    });

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        fotoProfile: json["fotoProfile"],
        alamat: json["alamat"],
        tanggalLahir: json["tanggalLahir"],
        phoneVerifiedAt: json["phone_verified_at"],
        pengalamans: json["pengalamans"],
        pendidikans: json["pendidikans"],
        organisasis: json["organisasis"],
        userSkills: json["user_skills"],
        cv: json["cv"],
    );

    Map<String, dynamic> toJson() => {
        "fotoProfile": fotoProfile,
        "alamat": alamat,
        "tanggalLahir": tanggalLahir,
        "phone_verified_at": phoneVerifiedAt,
        "pengalamans": pengalamans,
        "pendidikans": pendidikans,
        "organisasis": organisasis,
        "user_skills": userSkills,
        "cv": cv,
    };
}

class GroupScores {
    final bool informasiPribadi;
    final bool dataRiwayat;
    final bool skill;
    final bool cv;

    GroupScores({
        required this.informasiPribadi,
        required this.dataRiwayat,
        required this.skill,
        required this.cv,
    });

    factory GroupScores.fromJson(Map<String, dynamic> json) => GroupScores(
        informasiPribadi: json["informasi_pribadi"],
        dataRiwayat: json["data_riwayat"],
        skill: json["skill"],
        cv: json["cv"],
    );

    Map<String, dynamic> toJson() => {
        "informasi_pribadi": informasiPribadi,
        "data_riwayat": dataRiwayat,
        "skill": skill,
        "cv": cv,
    };
}

class Kelengkapan {
    final int terpenuhi;
    final int total;

    Kelengkapan({
        required this.terpenuhi,
        required this.total,
    });

    factory Kelengkapan.fromJson(Map<String, dynamic> json) => Kelengkapan(
        terpenuhi: json["terpenuhi"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "terpenuhi": terpenuhi,
        "total": total,
    };
}

class User {
    final int id;
    final dynamic googleId;
    final String keyUser;
    final String name;
    final String email;
    final String phoneNumber;
    final String fotoProfile;
    final dynamic alamat;
    final dynamic tanggalLahir;
    final dynamic emailVerifiedAt;
    final dynamic phoneVerifiedAt;
    final String emailVerificationToken;
    final dynamic phoneVerificationToken;
    final DateTime createdAt;
    final DateTime updatedAt;
    final List<Role> roles;

    User({
        required this.id,
        required this.googleId,
        required this.keyUser,
        required this.name,
        required this.email,
        required this.phoneNumber,
        required this.fotoProfile,
        required this.alamat,
        required this.tanggalLahir,
        required this.emailVerifiedAt,
        required this.phoneVerifiedAt,
        required this.emailVerificationToken,
        required this.phoneVerificationToken,
        required this.createdAt,
        required this.updatedAt,
        required this.roles,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        googleId: json["google_id"],
        keyUser: json["keyUser"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        fotoProfile: json["fotoProfile"],
        alamat: json["alamat"],
        tanggalLahir: json["tanggalLahir"],
        emailVerifiedAt: json["email_verified_at"],
        phoneVerifiedAt: json["phone_verified_at"],
        emailVerificationToken: json["email_verification_token"],
        phoneVerificationToken: json["phone_verification_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "google_id": googleId,
        "keyUser": keyUser,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "fotoProfile": fotoProfile,
        "alamat": alamat,
        "tanggalLahir": tanggalLahir,
        "email_verified_at": emailVerifiedAt,
        "phone_verified_at": phoneVerifiedAt,
        "email_verification_token": emailVerificationToken,
        "phone_verification_token": phoneVerificationToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
    };
}

class Role {
    final int id;
    final String name;
    final String guardName;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Pivot pivot;

    Role({
        required this.id,
        required this.name,
        required this.guardName,
        required this.createdAt,
        required this.updatedAt,
        required this.pivot,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        guardName: json["guard_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guard_name": guardName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
    };
}

class Pivot {
    final int modelId;
    final int roleId;
    final String modelType;

    Pivot({
        required this.modelId,
        required this.roleId,
        required this.modelType,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        modelId: json["model_id"],
        roleId: json["role_id"],
        modelType: json["model_type"],
    );

    Map<String, dynamic> toJson() => {
        "model_id": modelId,
        "role_id": roleId,
        "model_type": modelType,
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
