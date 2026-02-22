class ServiceDetailsModel {
    final ServiceData? serviceData;

    ServiceDetailsModel({
        this.serviceData,
    });

    factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) => ServiceDetailsModel(
        serviceData: json["service_data"] == null ? null : ServiceData.fromJson(json["service_data"]),
    );

    Map<String, dynamic> toJson() => {
        "service_data": serviceData?.toJson(),
    };
}

class ServiceData {
    final int? id;
    final String? categoryTitle;
    final String? serviceTitle;
    final String? serviceDetails;
    final int? price;
    final int? rank;
    final String? image;

    ServiceData({
        this.id,
        this.categoryTitle,
        this.serviceTitle,
        this.serviceDetails,
        this.price,
        this.rank,
        this.image,
    });

    factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        id: json["id"],
        categoryTitle: json["category_title"],
        serviceTitle: json["service_title"],
        serviceDetails: json["service_details"],
        price: json["price"],
        rank: json["rank"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_title": categoryTitle,
        "service_title": serviceTitle,
        "service_details": serviceDetails,
        "price": price,
        "rank": rank,
        "image": image,
    };
}
