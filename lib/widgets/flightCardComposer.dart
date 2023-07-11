import 'dart:math';

import 'package:airport_test/entities/flight/model.dart';
import 'package:airport_test/entities/flight/ui/flight.dart';
import 'package:airport_test/entities/stop/model.dart';
import 'package:airport_test/widgets/flightList.dart';
import 'package:flutter/material.dart';
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
    List<Flight>? transfersData = [];
    List<Stop>? stopData = [];

    var isComposed = flight.hasTransfers;

    if (isComposed==true){
      transfersData = flight.transfersData;
      stopData = flight.stopsData;
    }

    //main white bg container
    return SizedBox(
      width: width > 600 ? 600 : width,
      child: Container(
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
          child: Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    "Total Time : 1h 15m",
                      style: TextStyle(
                        color: Color(0xFF494949),
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(24),
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
                  ) : FlightList(flights: transfersData ?? [], stops: stopData ?? [],)
              )
            ],
          )
      ),
    );
  }
}