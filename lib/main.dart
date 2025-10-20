import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final WeatherApiService _weatherApi = WeatherApiService();
  int _counter = 0;

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });

     try {
      // TODO handle location 
      final data = await _weatherApi.getWeather(
        latitude: 30.0444,
        longitude: 31.2357,
      );

      print('============== Weather Data ==============');
      print('Temperature: ${data.current?.temperature2m}${data.currentUnits?.temperature2m}');
      print('Feels like: ${data.current?.apparentTemperature} ${data.current?.apparentTemperature}');
      print('Humidity: ${data.daily?.temperature2mMax} ${data.dailyUnits?.temperature2mMax}');
      print('Wind Speed: ${data.current?.windSpeed10m} ${data.currentUnits?.windSpeed10m}');
      print('Weather Code: ${data.hourlyUnits?.temperature2m}  ${data.hourlyUnits?..temperature2m}');
      print('Is Day: ${data.current?.isDay}');
      print('==========================================');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
