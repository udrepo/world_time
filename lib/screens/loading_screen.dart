import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

getData() async{

  Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

Map data = jsonDecode(response.body);

  print(data);
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading"),

    );
  }
}
