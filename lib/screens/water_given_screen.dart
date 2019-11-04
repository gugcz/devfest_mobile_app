import 'package:devfest_mobile_app/config.dart';
import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/devfest_logo.dart';
import 'package:devfest_mobile_app/components/gug_logo.dart';

class WaterGivenScreen extends StatelessWidget {
  int pointsEarned;
  WaterGivenScreen({Key key, this.pointsEarned}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colorPalette.shade500,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 100, 30, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DevFestLogo(),
              Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Water given successfully!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 36),
                      ),
                    ),
                    OutlineButton(
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Config.colorPalette.shade50,
                      splashColor: Config.colorPalette.shade100,
                      highlightColor: Config.colorPalette.shade100,
                      onPressed: () {
                        Navigator.pop(
                          context,
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
                  ],
                ),
              ),
              GUGLogo(
                opacity: 0.75,
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
