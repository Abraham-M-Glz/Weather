import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherController _controller = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Weather"),
            backgroundColor: Color.fromARGB(141, 0, 68, 255)),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(12.0),
          decoration: new BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(195, 0, 68, 255),
                  Color.fromARGB(141, 33, 91, 250)
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
                  "${_controller.data["name"]}",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(172, 255, 255, 255)),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        "${_controller.celsius.round()}°C",
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    Obx(
                      () => Image.network(
                        "https://openweathermap.org/img/w/${_controller.data["weather"][0]["icon"]}.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Obx(
                  () => Text(
                    "${_controller.data["weather"][0]["description"]}",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(172, 255, 255, 255)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
