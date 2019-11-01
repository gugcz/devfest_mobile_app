import 'dart:convert';
import 'package:devfest_mobile_app/screens/loading_screen.dart';
import 'package:http/http.dart';
import 'package:devfest_mobile_app/config.dart';
import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/gug_logo.dart';
import 'package:devfest_mobile_app/entities/question.dart';

class QuestionScreen extends StatefulWidget {
  final int questionId;
  final String number;

  QuestionScreen({Key key, this.questionId, this.number}) : super(key: key);

  @override
  _QuestionScreenState createState() =>
      _QuestionScreenState(this.questionId, this.number);
}

class _QuestionScreenState extends State<QuestionScreen> {
  final int questionId;
  final String number;
  bool loading = true;
  Question question = Question(
      question: '', answer1: '', answer2: '', answer3: '', answer4: '');

  _QuestionScreenState(this.questionId, this.number);

  @override
  void initState() {
    super.initState();
    _loadQuestion();
  }

  _loadQuestion() async {
    var url =
        'https://us-central1-devfestcztest.cloudfunctions.net/loadQuestion';
    try {
      var response = await post(url, body: {
        'number': '1234',
        'questionId': '101',
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          question = new Question(
            question: data['data']['question']['question'],
            answer1: data['data']['question']['answer1'],
            answer2: data['data']['question']['answer2'],
            answer3: data['data']['question']['answer3'],
            answer4: data['data']['question']['answer4'],
          );
          loading = false;
        });
      } else {
        print("Server error");
      }
    } catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double itemWidth = 150;
    final double itemHeight = 75;

    return loading
        ? LoadingScreen()
        : Scaffold(
            backgroundColor: Config.colorPalette.shade500,
            body: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 100, 30, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          question.question,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        GridView.count(
                          crossAxisCount: 2,
                          padding: EdgeInsets.only(top: 40),
                          shrinkWrap: true,
                          childAspectRatio: (itemWidth / itemHeight),
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                              child: OutlineButton(
                                child: Text(
                                  question.answer1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                color: Config.colorPalette.shade50,
                                splashColor: Config.colorPalette.shade100,
                                highlightColor: Config.colorPalette.shade100,
                                onPressed: () {},
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(7.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: OutlineButton(
                                child: Text(
                                  question.answer2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                color: Config.colorPalette.shade50,
                                splashColor: Config.colorPalette.shade100,
                                highlightColor: Config.colorPalette.shade100,
                                onPressed: () {},
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(7.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                              child: OutlineButton(
                                child: Text(
                                  question.answer3,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                color: Config.colorPalette.shade50,
                                splashColor: Config.colorPalette.shade100,
                                highlightColor: Config.colorPalette.shade100,
                                onPressed: () {},
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(7.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: OutlineButton(
                                child: Text(
                                  question.answer4,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                color: Config.colorPalette.shade50,
                                splashColor: Config.colorPalette.shade100,
                                highlightColor: Config.colorPalette.shade100,
                                onPressed: () {},
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(7.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GUGLogo(),
                  ],
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
          );
  }
}
