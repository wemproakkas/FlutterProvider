class RecommandedServiceModel {
    final List<ServiceData>? serviceData;

    RecommandedServiceModel({
        this.serviceData,
    });

    factory RecommandedServiceModel.fromJson(Map<String, dynamic> json) => RecommandedServiceModel(
        serviceData: json["service_data"] == null ? [] : List<ServiceData>.from(json["service_data"]!.map((x) => ServiceData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "service_data": serviceData == null ? [] : List<dynamic>.from(serviceData!.map((x) => x.toJson())),
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
        categoryTitle: json["categoryTitle"],
        serviceTitle: json["serviceTitle"],
        serviceDetails: json["serviceDetails"],
        price: json["price"],
        rank: json["rank"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "categoryTitle": categoryTitle,
        "serviceTitle": serviceTitle,
        "serviceDetails": serviceDetails,
        "price": price,
        "rank": rank,
        "image": image,
    };
}
