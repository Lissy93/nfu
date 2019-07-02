import 'package:flutter/material.dart';

Widget helloWidget(BuildContext context) {
  return Text(
    'Hello World!',
    style: Theme.of(context).textTheme.display1,
  );
}