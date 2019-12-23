import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/entities/schedule_item.dart';
import 'package:devfest_mobile_app/screens/schedule_item_detail.dart';

class ScheduleItemCard extends StatelessWidget {
  final ScheduleItem item;

  ScheduleItemCard({this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
      child: Container(
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 10.0,
              spreadRadius: -8.0,
            ),
          ],
        ),
        child: Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScheduleItemDetailScreen(item: item),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.title,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                    child: Text(
                      item.language + " / " + item.hall,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
