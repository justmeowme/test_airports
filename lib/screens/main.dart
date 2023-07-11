import 'dart:math';

import 'package:airport_test/entities/flight/api.dart';
import 'package:airport_test/entities/flight/model.dart';
import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width > 600 ? 600 : MediaQuery.sizeOf(context).width,
          child: Center(
              child: flights.isNotEmpty ? ListView.builder(
                itemCount: flights.length,
                itemBuilder: (context, index) {

                  return Padding(
                    padding: const EdgeInsets.all(9),
                    child: FlightCardComposer(flight: flights[index]),
                  );
                },
              ) : null

          ),
        ),
      )
    );
  }
}
