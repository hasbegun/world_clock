import 'package:flutter/material.dart';
import "package:world_time/pages/choose_location.dart";
import "package:world_time/pages/home.dart";
import "package:world_time/pages/loading.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context)=> ChooseLocation(),
      },
    );
  }
}
