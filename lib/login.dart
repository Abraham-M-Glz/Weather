import 'package:flutter/material.dart';
import 'package:itktask/controllers/controller.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'homes.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  WeatherController _controller = Get.put(WeatherController());
  TextEditingController _cityCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Wheater"),
            backgroundColor: Color.fromARGB(141, 0, 68, 255)),
        body: ListView(
          children: [
            Container(
              height: 300,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Type your city",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(141, 0, 68, 255),
                          fontWeight: FontWeight.bold)),
                  TextField(
                      controller: _cityCtrl,
                      decoration: const InputDecoration(
                        labelText: "¿What is your city?",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _controller.geolocation(_cityCtrl.text);
                        Get.to(Homes());
                      },
                      child: Text("find", style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(141, 0, 68, 255),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
