import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    Color bgcolor = data['isDayTime'] ? Colors.lightBlueAccent : Colors.black45;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(
          children: [
            FlatButton.icon(
              onPressed: () async{
               dynamic result = await Navigator.pushNamed(
                  context,
                  '/location',
                );
               setState(() {
                 data = {
                   'location': result.location,
                   'flag': result.flag,
                   'time': result.time,
                   'isDayTime': result.isDayTime
                 };
               });
              },
              icon: Icon(Icons.location_pin),
              label: Text("Location page"),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: TextStyle(fontSize: 20, letterSpacing: 2),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(data['time'],
            style: TextStyle(
              fontSize: 49
            ),
            ),
          ],
        ),
      )),
    );
  }
}
