import 'dart:math';

import 'package:airport_test/entities/flight/model.dart';
import 'package:airport_test/entities/flight/ui/flight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';


class FlightCardComposer extends StatelessWidget {

  final Flight flight;

  String getTotalTime(String time1, String time2) {
    DateTime dateTime1 = DateTime.parse(time1);
    DateTime dateTime2 = DateTime.parse(time2);
    Duration difference = dateTime2.difference(dateTime1);
    String formattedDifference = "${difference.inHours.toString().padLeft(2, '0')}h ${(difference.inMinutes % 60).toString().padLeft(2, '0')}m";
    return formattedDifference;
  }

  String formatTime(String time) {
    DateTime dateTime = DateTime.parse(time);
    String formattedTime = DateFormat('hh:mm').format(dateTime);
    return formattedTime;
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }

  const FlightCardComposer({super.key, required this.flight});
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var rng = Random();
    var cities = flight.thread?.title?.split(" — ");
    var isComposed = flight.hasTransfers;

    //main white bg container
    return Container(
      width: width,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        shadows: const [
          BoxShadow(
            color: Color(0x26828282),
            blurRadius: 28,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        child: isComposed == false ? FlightCard(
          totalTime: getTotalTime(flight.departure.toString(), flight.arrival.toString()),
          departureTime: formatTime(flight.departure.toString()),
          departureDate: formatDate(flight.departure.toString()),
          departureCity: cities?[0] ?? "",
          departureAirport: flight.from!.title.toString(),
          arrivalTime: formatTime(flight.arrival.toString()),
          arrivalDate: formatDate(flight.arrival.toString()),
          arrivalCity: cities?[1] ?? "",
          arrivalAirport: flight.to!.title.toString(),
          flightCost: "\$${rng.nextInt(100) * 10 + 100}",
          logo: flight.thread?.carrier?.logoSvg ?? "",
        ) : null,
        padding: EdgeInsets.all(24),
      )
    );
  }
}