import 'package:airport_test/entities/carrier/model.dart';
import 'package:airport_test/entities/destination/model.dart';

class Stop {

  bool? isTransfer;
  String? settlementStation;
  int? duration;
  bool? stationChange;
  String? newStation;


  Stop(
      {this.isTransfer,
        this.settlementStation,
        this.duration,
        this.stationChange,
        this.newStation});

  factory Stop.fromJson(Map<String, dynamic> json) {
    return Stop(
        isTransfer: json["is_transfer"],
        duration: json["duration"],
        stationChange: json["transfer_from"] != null && json["transfer_to"] != null
            ? Destination.fromJson(json["transfer_from"]).title != Destination.fromJson(json["transfer_to"]).title
            : null,
        settlementStation: json["transfer_from"] != null
            ? Destination.fromJson(json["transfer_from"]).title
            : null,
        newStation: json["transfer_to"] != null
            ? Destination.fromJson(json["transfer_to"]).title
            : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
