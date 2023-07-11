import 'package:airport_test/entities/carrier/model.dart';

class Thread {
  String? number;
  String? title;
  String? shortTitle;
  Carrier? carrier;
  String? vehicle;
  String? transportType;
  String? uid;
  String? threadMethodLink;
  String? airportLogo;

  Thread(
      {this.number,
      this.title,
      this.shortTitle,
      this.carrier,
      this.vehicle,
      this.transportType,
      this.uid,
      this.threadMethodLink,
      this.airportLogo});

  factory Thread.fromJson(Map<String, dynamic> json) {
    return Thread(
        number: json['number'],
        title: json['title'],
        shortTitle: json['short_title'],
        vehicle: json['vehicle'],
        transportType: json['transport_type'],
        uid: json['uid'],
        threadMethodLink: json['thread_method_link'],
        carrier:
            json['carrier'] != null ? Carrier.fromJson(json['carrier']) : null
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
