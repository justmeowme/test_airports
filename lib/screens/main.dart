import 'dart:math';

import 'package:airport_test/entities/flight/api.dart';
import 'package:airport_test/entities/flight/model.dart';
import 'package:airport_test/entities/flight/ui/flight.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/flightCardComposer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  String search = "";
  late List<Flight> flights = [];

  void getFlights(GetFlightsParams flightsParams) async {
    var data = await FlightApi.getFlights(flightsParams);
    setState(() {
      flights = data;
    });
    print("data init");
  }

  void searchChanged(String value) {
    getFlights(GetFlightsParams(search: value));
  }

  @override
  void initState() {
    getFlights(GetFlightsParams());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("here data");
    var rng = Random();

    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Center(
        child: flights.length != 0 ? ListView.builder(
          itemCount: flights.length,
          itemBuilder: (context, index) {

            return Padding(
              child: FlightCardComposer(flight: flights[index]),
              padding: EdgeInsets.all(20),
            );
          },
        ) : null

      ),
    );
  }
}
