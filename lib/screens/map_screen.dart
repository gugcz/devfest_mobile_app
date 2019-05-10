import 'package:devfest_mobile_app/config.dart';
import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/devfest_logo.dart';
import 'package:devfest_mobile_app/components/gug_logo.dart';

class MapScreen extends StatelessWidget {
  final String locationCode;

  MapScreen({Key key, this.locationCode}) : super(key: key);

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
                DevFestLogo(),
                Container(
                  child: Text(
                    'Map screen with location barcode: $locationCode.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GUGLogo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
