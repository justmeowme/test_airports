class Destination {
  String? type;
  String? title;
  String? shortTitle;
  String? popularTitle;
  String? code;
  String? stationType;
  String? stationTypeName;
  String? transportType;

  Destination(
      {this.type,
      this.title,
      this.shortTitle,
      this.popularTitle,
      this.stationType,
      this.stationTypeName,
      this.transportType,
      this.code});

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
        type: json['type'],
        title: json['title'],
        shortTitle: json['short_title'],
        popularTitle: json['popular_title'],
        stationType: json['station_type'],
        stationTypeName: json['station_type_name'],
        transportType: json['transport_type'],
        code: json['code']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}
