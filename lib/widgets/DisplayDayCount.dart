import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import '../models/DayCountModel.dart';
import '../util/Database.dart';
import '../util/Helpers.dart';

DayCount dayCount;

Widget displayDayCount(BuildContext context, DayCount dayCountData) {
  dayCount = dayCountData;
  var _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
//  var _foldingCellKey = new Key(dayCountData.id.toString());
  return GestureDetector(
      onTap: () {
        _foldingCellKey?.currentState?.toggleFold();
      },
    child: Container(
      padding: new EdgeInsets.all(5),
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
          onOpen: () => print('cell opened'+dayCount.id.toString()),
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
              dayCount.title+(open ? ' Since': ' For '),
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

Widget _buildOptionsButtonWidget(String text, IconData icon, Function action) {
  return FlatButton(
    onPressed: action,
    color: Color(0xff8A28FF),
    padding: EdgeInsets.all(10.0),
    child: Row( // Replace with a Row for horizontal icon + text
      children: <Widget>[
        Icon(
          icon,
          color: Colors.deepPurple[100],
        ),
        Text(
          text,
          style: TextStyle(color: Colors.deepPurple[100]),

        )
      ],
    ),
  );
}

Widget _buildOptionsButtonRowWidget() {
  return Container(
    color: Colors.blueGrey[100],
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildOptionsButtonWidget('Edit', Icons.edit, openEdit),
        _buildOptionsButtonWidget('Reset', Icons.update, resetDays),
        _buildOptionsButtonWidget('Delete', Icons.delete, deleteItem),
      ],
    )
  );
}


deleteItem(){
  DBProvider.db.deleteDayCount(0);
////          DayCount rnd = testDayCounts[math.Random().nextInt(testDayCounts.length)];
////          await DBProvider.db.insertDayCount(rnd);
//          setState(() {});
}

openEdit() {
  print('Open Edit Tapped');
}

resetDays() {

}
