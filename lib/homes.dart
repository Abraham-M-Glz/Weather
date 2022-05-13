import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/controller.dart';

class Homes extends StatefulWidget {
  const Homes({Key? key}) : super(key: key);

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  WeatherController _controller = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Weather"),
            backgroundColor: Color.fromARGB(141, 0, 68, 255)),
        body: GetBuilder<WeatherController>(
          init: WeatherController(),
          initState: (_ctx) {},
          builder: (_ctx) {
            return _ctx.isLoading.isTrue
                ? Center(
                    child: Text('Loading...'),
                  )
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding: EdgeInsets.all(12.0),
                    decoration: new BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(141, 0, 68, 255),
                            Color.fromARGB(108, 33, 91, 250)
                          ],
                          stops: [
                            0.3,
                            0.7
                          ],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(
                          () => Text(
                            "${_ctx.data["name"]}",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(226, 255, 255, 255)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Text(
                                "${_ctx.celsius.round()}°C",
                                style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                            Obx(
                              () => Image.network(
                                "https://openweathermap.org/img/w/${_ctx.data["weather"][0]["icon"]}.png",
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Obx(
                          () => Text(
                            "${_ctx.data["weather"][0]["description"]}",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(226, 255, 255, 255)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.water_drop, color: Colors.white),
                            Obx(
                              () => Text(
                                "Humidity: ${_ctx.data["main"]["humidity"]}%",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(226, 255, 255, 255)),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.air,
                              color: Colors.white,
                            ),
                            Obx(
                              () => Text(
                                "Wind: ${_ctx.data["wind"]["speed"]} km/h",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(226, 255, 255, 255)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
