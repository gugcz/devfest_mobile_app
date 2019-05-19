import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScheduleItem {
  final String title;
  final String time;
  final String language;
  final String hall;
  final String description;

  ScheduleItem({
    @required this.title,
    @required this.time,
    @required this.language,
    @required this.hall,
    this.description = ""
  });
}