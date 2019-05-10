import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/topic.dart';
import 'package:devfest_mobile_app/entities/speaker.dart';

class Talk {
  final String name;
  final String firstSubtitle;
  final String secondSubtitle;
  final List<Topic> topics;
  final String description;
  final Speaker speaker;

  Talk({
    this.name,
    this.firstSubtitle,
    this.secondSubtitle,
    this.topics,
    @required this.description,
    @required this.speaker,
  });
}