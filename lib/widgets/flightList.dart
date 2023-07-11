import 'dart:math';

import 'package:airport_test/entities/destination/model.dart';
import 'package:airport_test/entities/flight/model.dart';
import 'package:airport_test/entities/flight/ui/flight.dart';
import 'package:airport_test/entities/thread/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../entities/stop/model.dart';
import 'flightCardComposer.dart';


class FlightList extends StatelessWidget {
  final List<Flight> flights;
  final List<Stop> stops;

  const FlightList({Key? key, required this.flights, required this.stops}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: flights.isNotEmpty
          ? Expanded( // Wrap the ListView.builder with Expanded
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: flights.length,
          itemBuilder: (context, index) {

            Flight flight = flights[index];
            var rng = Random();
            var cities = flight.thread?.title?.split(" — ");

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  FlightCard(
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
                  ),
                  Container(
                    child: index != flights.length - 1 ? Container(
                      child: Column(
                        children: [
                          SizedBox(height: 32,),
                          SvgPicture.asset(
                            'assets/icons/divider.svg', // Replace this with the path to your SVG image
                            semanticsLabel: 'SVG Image',
                            width: MediaQuery.sizeOf(context).width,
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 12, bottom: 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/stopwatch.svg', // Replace this with the path to your SVG image
                                    semanticsLabel: 'SVG Image',
                                  ),
                                  SizedBox(width: 9,),
                                  Text(
                                    'Stop at ${stops[index].settlementStation}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 9),
                                  Text(
                                    '${stops[index].duration!.toInt() ~/ 3600} hr ${(stops[index].duration!.toInt() % 3600) ~/ 60} min layover',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/divider.svg', // Replace this with the path to your SVG image
                            semanticsLabel: 'SVG Image',
                            width: MediaQuery.sizeOf(context).width,
                          ),
                        ],
                      ),
                    ) : null,
                  )

                ],
              )
            );
          },
        ),
      )
          : null,
    );
  }
}