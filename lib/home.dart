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
            title: const Text("Weater"),
            backgroundColor: Color.fromARGB(141, 0, 68, 255)),
        body: ListView(children: [
          Icon(Icons.wb_cloudy),
          Container(
            child: Obx(
              () => Text("${_controller.data["id"]}"),
            ),
          )
        ]),
      ),
    );
  }
}
