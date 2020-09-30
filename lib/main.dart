import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationApp(),
    );
  }
}

class LocationApp extends StatefulWidget {
  @override
  _LocationAppState createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  var _locationMessage = "";
  void _getCurrentLocation() async {
    final postion = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final lastPosition = await Geolocator().getLastKnownPosition();
    print("last Position = ${lastPosition}");
    setState(() {
      _locationMessage = "${postion.latitude} , ${postion.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location service"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${_locationMessage}"),
          Center(
            child: RaisedButton(
              onPressed: () {
                _getCurrentLocation();
              },
              child: Text("get location"),
            ),
          ),
        ],
      ),
    );
  }
}
