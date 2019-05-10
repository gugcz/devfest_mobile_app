import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/entities/company.dart';

class Speaker {
  final AssetImage photo;
  final String name;
  final Company company;
  final String position;
  final String bio;

  Speaker({
    @required this.photo,
    @required this.name,
    @required this.company,
    @required this.position,
    @required this.bio,
  });
}