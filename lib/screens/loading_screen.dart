import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '520d22fc8fe657078523a94c02959426';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
    late double latitude;
    late double longitude;

    @override
    void initState() {
       super.initState();
       getLocation();
    }

    void getData() async {
      var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) { // se a requisição foi feita com sucesso
        var data = response.body;
        var jsonData = jsonDecode(data);
        var cityName = jsonData['name'];
        var temperature = jsonData['main']['temp'];
        var weatherCondition = jsonData['weather'][0]['id'];
        print(data);  // imprima o resultado
        print('cidade: $cityName, temperatura: $temperature, condição: $weatherCondition');
      } else {
        print(response.statusCode);  // senão, imprima o código de erro
      }
    }

    Future<void> getLocation() async {
      Location location = Location();
      location.getCurrentLocation();

      latitude = location.latitude!;
      longitude = location.longitude!;

      getData();
    }


    @override
    Widget build(BuildContext context) {
      getData();
      return Scaffold(
      );
    }
}
