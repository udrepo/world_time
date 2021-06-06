import 'dart:convert';

import 'package:flag/flag.dart';
import 'package:http/http.dart';

class WorldTime {
  String location;
  String time;
  String url;
  Flag flag;


  WorldTime({this.location, this.url, this.flag});

  Future getTimeData() async {
    Response response =
        await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));

    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(0, 3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    time = now.toString();
  }
}
