import 'package:flutter/foundation.dart';

class UIDModel extends ChangeNotifier {
  String _uid;

  String getUID() {
    return _uid;
  }

  void setUID(String uid) {
    _uid = uid;
  }
}