import 'dart:convert';
Example1 example1FromJson(String str) => Example1.fromJson(json.decode(str));
String example1ToJson(Example1 data) => json.encode(data.toJson());

class Example1 {
    List<ServiceType> serviceTypes;
    int status;
    String message;
    int nextPage;

    Example1({
        required this.serviceTypes,
        required this.status,
        required this.message,
        required this.nextPage,
    });

    factory Example1.fromJson(Map<String, dynamic> json) => Example1(
        serviceTypes: List<ServiceType>.from(json["ServiceTypes"].map((x) => ServiceType.fromJson(x))),
        status: json["status"],
        message: json["message"],
        nextPage: json["nextPage"],
    );

    Map<String, dynamic> toJson() => {
        "ServiceTypes": List<dynamic>.from(serviceTypes.map((x) => x.toJson())),
        "status": status,
        "message": message,
        "nextPage": nextPage,
    };
}

class ServiceType {
    String customName;
    String name;
    DateTime assignedDate;

    ServiceType({
        required this.customName,
        required this.name,
        required this.assignedDate,
    });

    factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        customName: json["CustomName"],
        name: json["Name"],
        assignedDate: DateTime.parse(json["AssignedDate"]),
    );

    Map<String, dynamic> toJson() => {
        "CustomName": customName,
        "Name": name,
        "AssignedDate": "${assignedDate.year.toString().padLeft(4, '0')}-${assignedDate.month.toString().padLeft(2, '0')}-${assignedDate.day.toString().padLeft(2, '0')}",
    };
}
