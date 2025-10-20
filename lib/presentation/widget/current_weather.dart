import 'package:flutter/material.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({
    super.key,
    required this.temperature,
    required this.weatherIcon,
    required this.weatherMessage,
    this.maxTemp = 0.0,
    this.minTemp = 0.0,
  });

  final double temperature;
  final int weatherIcon;
  final String weatherMessage;
  final double maxTemp;
  final double minTemp;

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // SliverToBoxAdapter(
        Container(
          height: 50,
          width: 50,
          color: Colors.lightBlueAccent,
          alignment: Alignment.center,
          // ),
        ),
        // Image(
        //   image: AssetImage('assets/images/my_image.png'),
        //   width: 200, // Optional: set width
        //   height: 150, // Optional: set height
        //   fit: BoxFit.cover, // Optional: set fit
        // )
        Column(
          children: [
            Text(
              '${widget.temperature}°C',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(widget.weatherMessage, style: TextStyle(fontSize: 16)),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Max: ${widget.maxTemp}°C'),
                  SizedBox(width: 20),
                  Text('Min: ${widget.minTemp}°C'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
