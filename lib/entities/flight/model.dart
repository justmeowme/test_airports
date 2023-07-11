import 'package:airport_test/entities/destination/model.dart';
import 'package:airport_test/entities/thread/model.dart';

class Flight {
  String? arrival;
  Destination? from;
  Thread? thread;
  String? departurePlatform;
  String? departure;
  String? stops;
  String? departureTerminal;
  Destination? to;
  bool? hasTransfers;
  TicketsInfo? ticketsInfo;
  int? duration;
  String? arrivalTerminal;
  String? startDate;
  String? arrivalPlatform;


  Destination? departureFrom;
  Destination? arrivalTo;
  List<String>? transportTypes;


  Flight({
    this.thread,
    this.from,
    this.to,
    this.departurePlatform,
    this.arrivalPlatform,
    this.departureTerminal,
    this.arrivalTerminal,
    this.stops,
    this.duration,
    this.startDate,
    this.departure,
    this.arrival,
    this.hasTransfers,
    this.ticketsInfo,
    this.departureFrom,
    this.arrivalTo,
    this.transportTypes,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      thread: json['thread'] != null ? Thread.fromJson(json['thread']) : null,
      from: json['from'] != null ? Destination.fromJson(json['from']) : null,
      to: json['to'] != null ? Destination.fromJson(json['to']) : null,
      departurePlatform: json['departure_platform'],
      arrivalPlatform: json['arrival_platform'],
      departureTerminal: json['departure_terminal'],
      arrivalTerminal: json['arrival_terminal'],
      stops: json['stops'],
      duration: json['duration'],
      startDate: json['start_date'],
      departure: json['departure'],
      arrival: json['arrival'],
      hasTransfers: json['has_transfers'],
      ticketsInfo: json['tickets_info'] != null
          ? TicketsInfo.fromJson(json['tickets_info'])
          : null,
      departureFrom: json['departure_from'] != null
          ? Destination.fromJson(json['departure_from'])
          : null,
      arrivalTo: json['arrival_to'] != null
          ? Destination.fromJson(json['arrival_to'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}

class TicketsInfo {
  bool? etMarker;
  List<Null>? places;

  TicketsInfo({this.etMarker, this.places});

  factory TicketsInfo.fromJson(Map<String, dynamic> json) {
    return TicketsInfo(etMarker: json['et_marker']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
