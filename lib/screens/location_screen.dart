import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: Flag('gb')),
    WorldTime(url: 'Asia/Almaty', location: 'Almaty', flag: Flag('kz')),
    WorldTime(url: 'Asia/Aqtau', location: 'Aqtau', flag: Flag('kz')),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: Flag('gr')),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: Flag('eg')),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: Flag('us')),
    WorldTime(url: 'America/New_York', location: 'New York', flag: Flag('us')),
    WorldTime(url: 'America/Los_Angeles ', location: 'LA', flag: Flag('us')),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: Flag('kr')),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: Flag('id')),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTimeData();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("Choose a location"),
          elevation: 0,
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  child: ClipOval(
                    child: locations[index].flag,
                  ),

                ),

              ),
            ),
          );
        },
          itemCount: locations.length,)
    );
  }
}
