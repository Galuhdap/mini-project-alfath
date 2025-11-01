import 'dart:convert';

GetJobSeeker getJobSeekerFromJson(String str) => GetJobSeeker.fromJson(json.decode(str));

String getJobSeekerToJson(GetJobSeeker data) => json.encode(data.toJson());

class GetJobSeeker {
    final Meta meta;
    final dynamic permission;
    final List<Datum> data;
    final dynamic other;

    GetJobSeeker({
        required this.meta,
        required this.permission,
        required this.data,
        required this.other,
    });

    factory GetJobSeeker.fromJson(Map<String, dynamic> json) => GetJobSeeker(
        meta: Meta.fromJson(json["meta"]),
        permission: json["permission"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        other: json["other"],
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "permission": permission,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "other": other,
    };
}

class Datum {
    final Pekerjaan pekerjaan;
    final Perusahaan perusahaan;

    Datum({
        required this.pekerjaan,
        required this.perusahaan,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    final Jenis jenis;
    final String lokasi;
    final int minimalGaji;
    final int maksimalGaji;
    final String tipe;
    final WorkType workType;
    final String kategori;
    final String minimalPendidikan;
    final String minimalPengalaman;
    final String minimalUmur;
    final String createdAt;
    final AtedAt updatedAt;
    final bool isApply;

    Pekerjaan({
        required this.key,
        required this.nama,
        required this.jenis,
        required this.lokasi,
        required this.minimalGaji,
        required this.maksimalGaji,
        required this.tipe,
        required this.workType,
        required this.kategori,
        required this.minimalPendidikan,
        required this.minimalPengalaman,
        required this.minimalUmur,
        required this.createdAt,
        required this.updatedAt,
        required this.isApply,
    });

    factory Pekerjaan.fromJson(Map<String, dynamic> json) => Pekerjaan(
        key: json["key"],
        nama: json["nama"],
        jenis: jenisValues.map[json["jenis"]]!,
        lokasi: json["lokasi"],
        minimalGaji: json["minimalGaji"],
        maksimalGaji: json["maksimalGaji"],
        tipe: json["tipe"],
        workType: workTypeValues.map[json["work_type"]]!,
        kategori: json["kategori"],
        minimalPendidikan: json["minimalPendidikan"],
        minimalPengalaman: json["minimalPengalaman"],
        minimalUmur: json["minimalUmur"],
        createdAt: json["created_at"],
        updatedAt: atedAtValues.map[json["updated_at"]]!,
        isApply: json["isApply"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "nama": nama,
        "jenis": jenisValues.reverse[jenis],
        "lokasi": lokasiValues.reverse[lokasi],
        "minimalGaji": minimalGaji,
        "maksimalGaji": maksimalGaji,
        "tipe": tipe,
        "work_type": workTypeValues.reverse[workType],
        "kategori": kategori,
        "minimalPendidikan": minimalPendidikan,
        "minimalPengalaman": minimalPengalaman,
        "minimalUmur": minimalUmur,
        "created_at": atedAtValues.reverse[createdAt],
        "updated_at": atedAtValues.reverse[updatedAt],
        "isApply": isApply,
    };
}

enum AtedAt {
    THE_15102025
}

final atedAtValues = EnumValues({
    "15/10/2025": AtedAt.THE_15102025
});

enum Jenis {
    NASIONAL
}

final jenisValues = EnumValues({
    "Nasional": Jenis.NASIONAL
});

enum Lokasi {
    BLIMBING_MALANG_JAWA_TIMUR
}

final lokasiValues = EnumValues({
    "Blimbing, Malang, Jawa Timur": Lokasi.BLIMBING_MALANG_JAWA_TIMUR
});

enum WorkType {
    HYBRID,
    WFH,
    WFO
}

final workTypeValues = EnumValues({
    "Hybrid": WorkType.HYBRID,
    "WFH": WorkType.WFH,
    "WFO": WorkType.WFO
});

class Perusahaan {
    final String key;
    final String nama;
    final String logo;

    Perusahaan({
        required this.key,
        required this.nama,
        required this.logo,
    });

    factory Perusahaan.fromJson(Map<String, dynamic> json) => Perusahaan(
        key: json["key"],
        nama: json["nama"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "nama": nama,
        "logo": logo,
    };
}

class Meta {
  final int? currentPage;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  Meta({
    this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"] as int?,
        firstPageUrl: json["first_page_url"] as String?,
        from: json["from"] as int?,
        lastPage: json["last_page"] as int?,
        lastPageUrl: json["last_page_url"] as String?,
        nextPageUrl: json["next_page_url"] as String?,
        path: json["path"] as String?,
        perPage: json["per_page"] is String
            ? int.tryParse(json["per_page"])
            : json["per_page"] as int?,
        prevPageUrl: json["prev_page_url"] as String?,
        to: json["to"] as int?,
        total: json["total"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
