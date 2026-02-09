class DashboardSliderModel {
    final List<SliderList>? sliderList;

    DashboardSliderModel({
        this.sliderList,
    });

    factory DashboardSliderModel.fromJson(Map<String, dynamic> json) => DashboardSliderModel(
        sliderList: json["slider_list"] == null ? [] : List<SliderList>.from(json["slider_list"]!.map((x) => SliderList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "slider_list": sliderList == null ? [] : List<dynamic>.from(sliderList!.map((x) => x.toJson())),
    };
}

class SliderList {
    final String? title;
    final String? image;
    final int? rank;

    SliderList({
        this.title,
        this.image,
        this.rank,
    });

    factory SliderList.fromJson(Map<String, dynamic> json) => SliderList(
        title: json["title"],
        image: json["image"],
        rank: json["rank"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "rank": rank,
    };
}
