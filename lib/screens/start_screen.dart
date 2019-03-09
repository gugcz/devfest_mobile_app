import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
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
                  image: AssetImage("assets/devfest2019_logo.png"),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'To participate in game you have to scan your QR code that is located at the back of your badge.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: OutlineButton(
                          textColor: Colors.white,
                          child: Text('Scan'),
                          onPressed: () { },
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          'Continue without login',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ),
                          );
                        },
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
