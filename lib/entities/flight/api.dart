import 'dart:convert';
import 'package:airport_test/entities/flight/model.dart';
import 'package:airport_test/shared/api.dart';
import 'package:dio/dio.dart';

class GetFlightsParams {
  String? search;

  GetFlightsParams({this.search});
}

class FlightApi {
  static Future<List<Flight>> getFlights(GetFlightsParams params) async {
    try {
      var resp = await Api().client.get('/test_api.php');
      var body = jsonDecode(resp.data) as Map;

      List<Flight> flights = [];

      if (body['data']['segments'] != null) {
        for (var element in body['data']['segments']) {
          flights.add(Flight.fromJson(element));
        }
      }

      return flights;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
