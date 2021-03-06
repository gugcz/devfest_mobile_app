import 'package:devfest_mobile_app/screens/correct_answer_screen.dart';
import 'package:devfest_mobile_app/screens/wrong_answer_screen.dart';
import 'package:devfest_mobile_app/screens/water_only_screen.dart';
import 'package:devfest_mobile_app/screens/loading_screen.dart';
import 'package:devfest_mobile_app/config.dart';
import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/gug_logo.dart';
import 'package:devfest_mobile_app/entities/question.dart';
import 'package:devfest_mobile_app/models/app_model.dart';
import 'package:provider/provider.dart';
import 'package:cloud_functions/cloud_functions.dart';

class QuestionScreen extends StatefulWidget {
  final String questionId;

  QuestionScreen({Key key, this.questionId}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState(this.questionId);
}

class _QuestionScreenState extends State<QuestionScreen> {
  final String questionId;
  bool loading = true;
  Question question = Question(
      question: 'Which genre does cyberpunk belong to?', answer1: 'Fantasy', answer2: 'Sci-Fi', answer3: 'Psychological thriller', answer4: 'Comedy');

  _QuestionScreenState(this.questionId);

  @override
  void initState() {
    super.initState();
    _loadQuestion();
  }

  _loadQuestion() async {
    try {
      final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
        functionName: 'loadQuestion',
      );

      HttpsCallableResult resp = await callable.call(<String, dynamic>{
        'number': Provider.of<AppModel>(context, listen: false).getUID(),
        'questionId': this.questionId,
      });

      print(resp.data['type']);
      print('type');

      if (resp.data['type'] == 'question') {
        setState(() {
          question = new Question(
            question: resp.data['question']['question'],
            answer1: resp.data['question']['answer1'],
            answer2: resp.data['question']['answer2'],
            answer3: resp.data['question']['answer3'],
            answer4: resp.data['question']['answer4'],
          );
          loading = false;
        });
      } else if (resp.data['type'] == 'pointsOnly') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WaterOnlyScreen(pointsEarned: resp.data['pointsEarned']),
          ),
        );
      }
    } catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double itemWidth = 150;
    final double itemHeight = 85;

    return loading
        ? LoadingScreen()
        : Scaffold(
            backgroundColor: Config.colorPalette.shade500,
            body: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 120, 30, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      question.question,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        childAspectRatio: (itemWidth / itemHeight),
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: OutlineButton(
                              child: Text(
                                question.answer1,
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Config.colorPalette.shade50,
                              splashColor: Config.colorPalette.shade100,
                              highlightColor: Config.colorPalette.shade100,
                              onPressed: () {
                                _sendAnswer(1);
                              },
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
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Config.colorPalette.shade50,
                              splashColor: Config.colorPalette.shade100,
                              highlightColor: Config.colorPalette.shade100,
                              onPressed: () {
                                _sendAnswer(2);
                              },
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
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Config.colorPalette.shade50,
                              splashColor: Config.colorPalette.shade100,
                              highlightColor: Config.colorPalette.shade100,
                              onPressed: () {
                                _sendAnswer(3);
                              },
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
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Config.colorPalette.shade50,
                              splashColor: Config.colorPalette.shade100,
                              highlightColor: Config.colorPalette.shade100,
                              onPressed: () {
                                _sendAnswer(4);
                              },
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
                    ),
                    GUGLogo(),
                  ],
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
          );
  }

  _sendAnswer(int answer) async {
    setState(() {
      loading = true;
    });

    try {
      final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
        functionName: 'answerQuestion',
      );

      dynamic resp = await callable.call(<String, dynamic>{
        'number': Provider.of<AppModel>(context, listen: false).getUID(),
        'questionId': this.questionId,
        'answer': answer.toString()
      });

      if (resp.data['type'] == 'correctAnswer') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CorrectAnswerScreen(
              pointsEarned: resp.data['pointsEarned'],
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WrongAnswerScreen(),
          ),
        );
      }
    } catch (exception) {
      print(exception);
      setState(() {
        loading = false;
      });
    }
  }
}
