import 'dart:async';

import 'package:devfest_mobile_app/config.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:devfest_mobile_app/components/devfest_logo.dart';
import 'package:devfest_mobile_app/components/gug_logo.dart';

class ScanQRCodeScreen extends StatelessWidget {
  ScanQRCodeScreen({Key key}) : super(key: key);
  
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
                        'Find game QR code, scan it and answer question!',
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