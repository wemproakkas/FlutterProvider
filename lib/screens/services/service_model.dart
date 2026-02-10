class ServicesModel {
    final List<ServiceList>? serviceList;

    ServicesModel({
        this.serviceList,
    });

    factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        serviceList: json["service_list"] == null ? [] : List<ServiceList>.from(json["service_list"]!.map((x) => ServiceList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "service_list": serviceList == null ? [] : List<dynamic>.from(serviceList!.map((x) => x.toJson())),
    };
}

class ServiceList {
    final int? id;
    final String? serviceTitle;
    final String? categoryTitle;
    final String? serviceDetails;
    final int? serviceRank;
    final DateTime? created;
    final String? image;

    ServiceList({
        this.id,
        this.serviceTitle,
        this.categoryTitle,
        this.serviceDetails,
        this.serviceRank,
        this.created,
        this.image,
    });

    factory ServiceList.fromJson(Map<String, dynamic> json) => ServiceList(
        id: json["id"],
        categoryTitle: json["category_title"],
        serviceTitle: json["service_title"],
        serviceDetails: json["service_details"],
        serviceRank: json["service_rank"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_title": categoryTitle,
        "service_title": serviceTitle,
        "service_details": serviceDetails,
        "service_rank": serviceRank,
        "created": created?.toIso8601String(),
        "image": image,
    };

  void operator [](String other) {}
}
