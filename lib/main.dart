
/// This file is the main app entry point

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
        primarySwatch: Colors.cyan,
      ),
      home: NfuHome(context, title: 'Not Fucking Up | Day Count View'),
    );
  }
}

/// Licensed Under MIT, (C) 2019 Alicia Sykes <as@mail.as93.net>

