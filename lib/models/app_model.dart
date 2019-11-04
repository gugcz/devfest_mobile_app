import 'package:flutter/foundation.dart';

class AppModel extends ChangeNotifier {
  String _uid;
  int _totalScore;
  int _actualScore;

  String getUID() {
    return _uid;
  }

  void setUID(String uid) {
    _uid = uid;
  }

  int getTotalScore() {
    return _totalScore;
  }

  void setTotalScore(int totalScore) {
    _totalScore = totalScore;
  }

  int getActualScore() {
    return _actualScore;
  }

  void setActualScore(int actualScore) {
    _actualScore = actualScore;
  }
}