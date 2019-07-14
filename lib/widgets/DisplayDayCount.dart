import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import '../models/DayCountModel.dart';
import '../util/Helpers.dart';


Widget displayDayCount(BuildContext context, DayCount dayCountData) {
  var _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
//  var _foldingCellKey = new Key(dayCountData.id.toString());
  return GestureDetector(
      onTap: () {
        _foldingCellKey?.currentState?.toggleFold();
      },
    child: Container(
//      color: Colors.pinkAccent,
      margin: new EdgeInsets.only(bottom: 10),
      padding: new EdgeInsets.all(10.0),
      child:
          SimpleFoldingCell(
          key: _foldingCellKey,
          frontWidget: _buildFrontWidget(context),
          innerTopWidget: _buildInnerTopWidget(context),
          innerBottomWidget: _buildOptionsButtonRowWidget(),
          cellSize: Size(MediaQuery.of(context).size.width, 125),
          padding: EdgeInsets.all(15),
          animationDuration: Duration(milliseconds: 300),
          borderRadius: 5,
//          onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
          onOpen: () => print('cell opened'),
          onClose: () => print('cell closed')
        ),
    )
  );
}

Widget _buildFrontWidget(context) {
  return Container(
      color: Color(0xff6200ED),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      _buildDateDisplayWidget(context, false),
        ],
      ));
}

Widget _buildInnerTopWidget(context) {
  return Container(
      color: Color(0xff8A28FF),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildDateDisplayWidget(context, true),
        ],
      ));
}

Widget _buildDateDisplayWidget(context, bool open) {
  return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      child:
        Column(
          children: <Widget>[
            Text(
              'Smoke Free'+(open ? ' Since': ' For '),
            style: TextStyle(
                color: Colors.deepPurple[100],
                fontFamily: 'OpenSans',
                fontSize: 24,
            ),
          ),
            Text(
              open? makeReadableDateFromDate(2001) : makeDayCountFromDate(2001).toString()+" Days",
              style: TextStyle(
                color: Colors.deepPurple[100],
                fontFamily: 'OpenSans',
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
          ),Text(
              open? 'Tap to hide Options': 'Tap for more Options',
              style: TextStyle(
                color: Colors.deepPurple[300],
                fontFamily: 'OpenSans',
                fontSize: 14,
              ),
          ),
    ],
  ),
  );
}

Widget _buildOptionsButtonWidget(String text, IconData icon) {
  return FlatButton(
    onPressed: () => {},
    color: Colors.pink[700],
    padding: EdgeInsets.all(10.0),
    child: Row( // Replace with a Row for horizontal icon + text
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),

        )
      ],
    ),
  );
}

Widget _buildOptionsButtonRowWidget() {
  return Container(
    color: Colors.blueGrey[100],
    alignment: Alignment.bottomCenter,
    child: Row(
//      color: Colors.cyanAccent,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildOptionsButtonWidget('Edit', Icons.edit),
        _buildOptionsButtonWidget('Reset', Icons.update),
        _buildOptionsButtonWidget('Delete', Icons.delete),
      ],
    )
  );
}
