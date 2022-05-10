import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GeoController extends GetxController {
  var request = {}.obs as Map<dynamic, dynamic>;
  var mykey = "fe07e996a581f3a77eb536951944038b";
  geolocation(location) async {
    var response = await http.get(
        Uri.parse("http://api.positionstack.com/v1/forward?access_key=" +
            mykey +
            "&query=" +
            location),
        headers: {"Accept": "application/json"});

    request = json.decode(response.body);
    var latitude = request["data"][0]["latitude"];
    var longitude = request["data"][0]["longitude"];
    print(request["data"][0]["latitude"]);
    print(request["data"][0]["longitude"]);

    return "Succes!";
  }
}

class Whether extends GetxController {
  var data = {}.obs as Map<dynamic, dynamic>;
  var whetherKey = "665ddb5a98c76560285d8bec97acf997";
  currentWhether(lat, long) async {
    var response = await http.get(
        Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=" +
            lat +
            "&lon=" +
            long +
            "&appid=" +
            whetherKey),
        headers: {"Accept": "application/json"});

    data = json.decode(response.body);
    var latitude = data["data"][0]["latitude"];
    var longitude = data["data"][0]["longitude"];
    print(data["wheater"]);
    print(data["wheater"]);

    return "Succes!";
  }
}
