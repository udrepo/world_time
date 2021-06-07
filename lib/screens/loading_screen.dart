import 'dart:convert';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String text = 'loading';

  void setupTime() async{
    WorldTime berlin = WorldTime(location: 'Berlin', flag: Flag('DE'), url: 'Europe/Berlin');
    await berlin.getTimeData();
    print(berlin.time);
   Navigator.pushReplacementNamed(context, '/home', arguments: {
     'location' : berlin.location,
     'flag' : berlin.flag,
     'time' : berlin.time,
     'isDayTime' : berlin.isDayTime
   });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
