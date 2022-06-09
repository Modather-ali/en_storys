import 'package:enstorys/screens/stories.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "English Storys",
      home: Stories(),
      theme: ThemeData(fontFamily: "Merriweather"),
      routes: {
        "One": (context) => Stories(),
      },
    );
  }
}
