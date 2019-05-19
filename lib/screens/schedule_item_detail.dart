import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/entities/schedule_item.dart';

class ScheduleItemDetailScreen extends StatelessWidget {
  final ScheduleItem item;

  ScheduleItemDetailScreen({
    Key key,
    @required this.item,
  }) : super(key: key);

  Widget _scheduleItemTitle() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Text(
        item.title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
      ),
    );
  }

  Widget _firstSubtitle() {
    return Text(
      item.time +
          " / " +
          item.language +
          " / " +
          item.hall,
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
    );
  }

  Widget _description() {
    if (item.description.isNotEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 16),
        child: Text(
          item.description,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(item.title),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _scheduleItemTitle(),
                    _firstSubtitle(),
                    _description(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
