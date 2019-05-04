import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String barcode;

  ResultScreen({Key key, @required this.barcode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colorPalette.shade500,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(50, 100, 50, 40),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/ozzy.png"),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Welcome number $barcode!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: OutlineButton(
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Config.colorPalette.shade50,
                          splashColor: Config.colorPalette.shade100,
                          highlightColor: Config.colorPalette.shade100,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ),
                            );
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
                Image(
                  image: AssetImage("assets/gug_logo.png"),
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
