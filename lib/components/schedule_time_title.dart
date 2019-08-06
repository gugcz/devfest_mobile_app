import 'package:flutter/material.dart';

class ScheduleTimeTitle extends StatelessWidget {
  final String hours;
  final String minutes;

  ScheduleTimeTitle({
    @required this.hours,
    @required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 4, 18, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.hours,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 36),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3, left: 4),
            child: Text(
              this.minutes,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
