import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Choose a location"),
        elevation: 0,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
