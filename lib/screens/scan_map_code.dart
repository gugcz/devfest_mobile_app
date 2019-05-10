import 'dart:async';

import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/screens/main_screen.dart';
import 'package:devfest_mobile_app/screens/map_screen.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:devfest_mobile_app/components/devfest_logo.dart';
import 'package:devfest_mobile_app/components/gug_logo.dart';

class ScanMapCodeScreen extends StatelessWidget {
  ScanMapCodeScreen({Key key}) : super(key: key);
  
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
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Scan nearest location barcode to show your location on map.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: OutlineButton(
                          child: Text(
                            "Scan",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Config.colorPalette.shade50,
                          splashColor: Config.colorPalette.shade100,
                          highlightColor: Config.colorPalette.shade100,
                          onPressed: () {
                            scan(context);
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
                      GestureDetector(
                        child: Text(
                          'Continue without location',
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
                GUGLogo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future scan(context) async {
    try {
      String locationCode = await BarcodeScanner.scan();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MapScreen(locationCode: locationCode),
        ),
      );
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        print('The user did not grant the camera permission!');
      } else {
        print('Unknown error: $e');
      }
    } on FormatException {
      print('null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      print('Unknown error: $e');
    }
  }
}