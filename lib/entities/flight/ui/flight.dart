import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';


class FlightCard extends StatelessWidget {

  final String totalTime;
  final String departureTime;
  final String departureDate;
  final String departureCity;
  final String departureAirport;
  final String arrivalTime;
  final String arrivalDate;
  final String arrivalCity;
  final String arrivalAirport;
  final String flightCost;
  final String logo;

  const FlightCard({super.key, required this.totalTime, required this.departureTime, required this.departureDate, required this.departureCity, required this.departureAirport, required this.arrivalTime, required this.arrivalDate, required this.arrivalCity, required this.arrivalAirport, required this.flightCost, required this.logo});
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    //var ticketWidth = width - 40;

    //main white bg container
    return SizedBox(
      width: width > 600 ? 600 : width,
      child: Container(
        //width: width > 1000 ? 1000 : width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            //row with other ticket info
            Row(
              children: [
                //logo
                Center(
                  child: SvgPicture.network(
                    logo, // Replace this with the path to your SVG image
                    semanticsLabel: 'SVG Image',
                  ),
                ),
                const Spacer(),

                //departure
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      departureTime,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      departureDate,
                      style: TextStyle(
                        color: Color(0xFF494949),
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      departureCity,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      departureAirport,
                      style: const TextStyle(
                        color: Color(0xFF494949),
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                //flight time
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/planeIcon.svg', // Replace this with the path to your SVG image
                        semanticsLabel: 'SVG Image',
                      ),

                      const SizedBox(width: 3),
                      Text(
                        totalTime,
                        style: const TextStyle(
                          color: Color(0xFF606060),
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),

                //arrival
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      arrivalTime,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      arrivalDate,
                      style: TextStyle(
                        color: Color(0xFF494949),
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      arrivalCity,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      arrivalAirport,
                      style: const TextStyle(
                        color: Color(0xFF494949),
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Spacer(),

                //cost
                Center(
                  child: Text(
                    flightCost,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}