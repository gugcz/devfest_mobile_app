import 'package:devfest_mobile_app/config.dart';
import 'package:flutter/material.dart';

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
                Image(
                  image: AssetImage("assets/devfest2019_logo.png"),
                ),
                Container(
                  child: Text(
                    'Map screen with location barcode: $locationCode.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
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
