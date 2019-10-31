import 'package:devfest_mobile_app/config.dart';
import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/gug_logo.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double itemWidth = 150;
    final double itemHeight = 65;

    return Scaffold(
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
                    "Question Question Question Question Question Question Question?",
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
                            "Login",
                            style: TextStyle(color: Colors.white),
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
                            "Login",
                            style: TextStyle(color: Colors.white),
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
                            "Login",
                            style: TextStyle(color: Colors.white),
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
                            "Login",
                            style: TextStyle(color: Colors.white),
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
