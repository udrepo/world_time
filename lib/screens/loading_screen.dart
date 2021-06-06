import 'dart:convert';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
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
    setState(() {
      text = berlin.time;
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
      body: SafeArea(child: Text(text)),
    );
  }
}
