class DashboardOverviewModel {
    final List<OverviewList>? dashboardData;

    DashboardOverviewModel({
        this.dashboardData,
    });

    factory DashboardOverviewModel.fromJson(Map<String, dynamic> json) => DashboardOverviewModel(
        dashboardData: json["dashboard_data"] == null ? [] : List<OverviewList>.from(json["dashboard_data"]!.map((x) => OverviewList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dashboard_data": dashboardData == null ? [] : List<dynamic>.from(dashboardData!.map((x) => x.toJson())),
    };
}

class OverviewList {
    final String? value;
    final String? title;

    OverviewList({
        this.value,
        this.title,
    });

    factory OverviewList.fromJson(Map<String, dynamic> json) => OverviewList(
        value: json["value"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "title": title,
    };
}
