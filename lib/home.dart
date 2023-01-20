import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var temp;
  Future getWeather() async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=maxcanu&appid=05b371e0a2c7dbac872802cefcf1fd5f&units=metric");
    http.Response response = await http.get(url);
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            temp != null ? temp.toString() : "Buscando",
          ),
        ),
      ),
    );
  }
}
