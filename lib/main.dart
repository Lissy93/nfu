import 'package:flutter/material.dart';
import 'screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day Counter',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: MyHomePage(context, title: 'Flutter Demo Home Page'),
    );
  }
}

