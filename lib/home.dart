import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Wheater"),
            backgroundColor: Color.fromARGB(141, 0, 68, 255)),
        body: ListView(children: [Container(), Icon(Icons.wb_cloudy)]),
      ),
    );
  }
}
