import 'package:flutter/foundation.dart';

class AppModel extends ChangeNotifier {
  String _badgeNumber;
  int _totalScore;
  int _actualScore;

  String getBadgeNumber() {
    return _badgeNumber;
  }

  void setBadgeNumber(String badgeNumber) {
    _badgeNumber = badgeNumber;
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