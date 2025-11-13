// To parse this JSON data, do
//
//     final getDetailJobSeeker = getDetailJobSeekerFromJson(jsonString);

import 'dart:convert';

GetDetailJobSeeker getDetailJobSeekerFromJson(String str) => GetDetailJobSeeker.fromJson(json.decode(str));

String getDetailJobSeekerToJson(GetDetailJobSeeker data) => json.encode(data.toJson());

class GetDetailJobSeeker {
    final Meta meta;
    final Data data;
    final dynamic other;

    GetDetailJobSeeker({
        required this.meta,
        required this.data,
        required this.other,
    });

    factory GetDetailJobSeeker.fromJson(Map<String, dynamic> json) => GetDetailJobSeeker(
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
    final Pekerjaan pekerjaan;
    final Perusahaan perusahaan;

    Data({
        required this.pekerjaan,
        required this.perusahaan,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        pekerjaan: Pekerjaan.fromJson(json["pekerjaan"]),
        perusahaan: Perusahaan.fromJson(json["perusahaan"]),
    );

    Map<String, dynamic> toJson() => {
        "pekerjaan": pekerjaan.toJson(),
        "perusahaan": perusahaan.toJson(),
    };
}

class Pekerjaan {
    final String key;
    final String nama;
    final String lokasi;
    final int minimalGaji;
    final int maksimalGaji;
    final String tipe;
    final String kategori;
    final List<Skill> skill;
    final String minimalPendidikan;
    final String minimalPengalaman;
    final String workType;
    final String status;
    final String minimalUmur;
    final String deskripsi;
    final String createdAt;
    final String updatedAt;

    Pekerjaan({
        required this.key,
        required this.nama,
        required this.lokasi,
        required this.minimalGaji,
        required this.maksimalGaji,
        required this.tipe,
        required this.kategori,
        required this.skill,
        required this.minimalPendidikan,
        required this.minimalPengalaman,
        required this.workType,
        required this.status,
        required this.minimalUmur,
        required this.deskripsi,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Pekerjaan.fromJson(Map<String, dynamic> json) => Pekerjaan(
        key: json["key"],
        nama: json["nama"],
        lokasi: json["lokasi"],
        minimalGaji: json["minimalGaji"],
        maksimalGaji: json["maksimalGaji"],
        tipe: json["tipe"],
        kategori: json["kategori"],
        skill: List<Skill>.from(json["skill"].map((x) => Skill.fromJson(x))),
        minimalPendidikan: json["minimalPendidikan"],
        minimalPengalaman: json["minimalPengalaman"],
        workType: json["work_type"],
        status: json["status"],
        minimalUmur: json["minimalUmur"],
        deskripsi: json["deskripsi"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "nama": nama,
        "lokasi": lokasi,
        "minimalGaji": minimalGaji,
        "maksimalGaji": maksimalGaji,
        "tipe": tipe,
        "kategori": kategori,
        "skill": List<dynamic>.from(skill.map((x) => x.toJson())),
        "minimalPendidikan": minimalPendidikan,
        "minimalPengalaman": minimalPengalaman,
        "work_type": workType,
        "status": status,
        "minimalUmur": minimalUmur,
        "deskripsi": deskripsi,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class Skill {
    final int id;
    final String name;

    Skill({
        required this.id,
        required this.name,
    });

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Perusahaan {
    final String key;
    final String nama;
    final String logo;
    final String alamat;
    final String deskripsi;
    final String website;
    final String tahunBerdiri;
    final String jumlahKaryawan;

    Perusahaan({
        required this.key,
        required this.nama,
        required this.logo,
        required this.alamat,
        required this.deskripsi,
        required this.website,
        required this.tahunBerdiri,
        required this.jumlahKaryawan,
    });

    factory Perusahaan.fromJson(Map<String, dynamic> json) => Perusahaan(
        key: json["key"],
        nama: json["nama"],
        logo: json["logo"],
        alamat: json["alamat"],
        deskripsi: json["deskripsi"],
        website: json["website"],
        tahunBerdiri: json["tahunBerdiri"],
        jumlahKaryawan: json["jumlahKaryawan"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "nama": nama,
        "logo": logo,
        "alamat": alamat,
        "deskripsi": deskripsi,
        "website": website,
        "tahunBerdiri": tahunBerdiri,
        "jumlahKaryawan": jumlahKaryawan,
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
