import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'location_screen.dart';
import '../services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '520d22fc8fe657078523a94c02959426';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
    @override
    void initState() {
       super.initState();
       getData();
    }

    void pushToLocationScreen(dynamic weatherData) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(localWeatherData: weatherData);
      }));
    }

    void getData() async {
      var weatherData = await WeatherModel().getLocationWeather();
      pushToLocationScreen(weatherData);
    }

    @override
    Widget build(BuildContext context) {
      return const Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      );
    }

}
