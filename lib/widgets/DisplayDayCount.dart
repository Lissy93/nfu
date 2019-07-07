import 'package:flutter/material.dart';

Widget displayDayCount(BuildContext context) {
  return Container(
      color: Colors.pinkAccent,
      margin: new EdgeInsets.only(bottom: 10),
      padding: new EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
            'Smoke Free for',
            style: Theme.of(context).textTheme.subhead,
          ),
          Text(
              '14 Days',
              style: Theme.of(context).textTheme.title
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.volume_up),
                tooltip: 'Increase volume by 10',
                onPressed: () {
                  
                },
              ),
              Text('Volume')
            ],
          ),
        ],
      ),
  );
}