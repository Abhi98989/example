import 'dart:convert';
Example2 example2FromJson(String str) => Example2.fromJson(json.decode(str));
String example2ToJson(Example2 data) => json.encode(data.toJson());

class Example2 {
    List<CoveredArea> coveredAreas;
    int status;
    String message;
    int nextPage;

    Example2({
        required this.coveredAreas,
        required this.status,
        required this.message,
        required this.nextPage,
    });

    factory Example2.fromJson(Map<String, dynamic> json) => Example2(
        coveredAreas: List<CoveredArea>.from(json["CoveredAreas"].map((x) => CoveredArea.fromJson(x))),
        status: json["status"],
        message: json["message"],
        nextPage: json["nextPage"],
    );

    Map<String, dynamic> toJson() => {
        "CoveredAreas": List<dynamic>.from(coveredAreas.map((x) => x.toJson())),
        "status": status,
        "message": message,
        "nextPage": nextPage,
    };
}

class CoveredArea {
    String areaCode;
    String area;
    String zipcode;
    City district;
    String addressLine1;
    String latLong;
    bool isRemote;
    City city;
    CityCode cityCode;

    CoveredArea({
        required this.areaCode,
        required this.area,
        required this.zipcode,
        required this.district,
        required this.addressLine1,
        required this.latLong,
        required this.isRemote,
        required this.city,
        required this.cityCode,
    });

    factory CoveredArea.fromJson(Map<String, dynamic> json) => CoveredArea(
        areaCode: json["AreaCode"],
        area: json["Area"],
        zipcode: json["Zipcode"],
        district: cityValues.map[json["District"]]!,
        addressLine1: json["AddressLine1"],
        latLong: json["LatLong"],
        isRemote: json["IsRemote"],
        city: cityValues.map[json["City"]]!,
        cityCode: cityCodeValues.map[json["CityCode"]]!,
    );

    Map<String, dynamic> toJson() => {
        "AreaCode": areaCode,
        "Area": area,
        "Zipcode": zipcode,
        "District": cityValues.reverse[district],
        "AddressLine1": addressLine1,
        "LatLong": latLong,
        "IsRemote": isRemote,
        "City": cityValues.reverse[city],
        "CityCode": cityCodeValues.reverse[cityCode],
    };
}

enum City {
    BAGLUNG
}

final cityValues = EnumValues({
    "Baglung": City.BAGLUNG
});

enum CityCode {
    CGB_0042
}

final cityCodeValues = EnumValues({
    "CGB-0042": CityCode.CGB_0042
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
