import 'package:flutter/material.dart';
import 'package:world_time/screens/home_screen.dart';
import 'package:world_time/screens/loading_screen.dart';
import 'package:world_time/screens/location_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
       // '/' : (context) => LoadingScreen(),
        '/home' : (context) => HomeScreen(),
        '/location' : (context) => LocationScreen()
      },
    );
  }
}
