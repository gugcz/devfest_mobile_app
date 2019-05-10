import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Speaker {
  final AssetImage photo;
  final String name;
  final String company;

  Speaker({
    @required this.photo,
    @required this.name,
    this.company
  });
}