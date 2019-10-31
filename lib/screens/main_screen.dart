import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/screens/question_screen.dart';
import 'package:devfest_mobile_app/screens/scan_qr_code.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String number;
  MainScreen({Key key, this.title, this.number}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState(this.number);
}

class _MainScreenState extends State<MainScreen> {

  final String number;

  _MainScreenState(this.number);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colorPalette.shade500,
      appBar: AppBar(
        title: Text('DevFest CZ 2019'),
        backgroundColor: Config.colorPalette.shade700,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Your score:",
                style: TextStyle(fontSize: 36),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                  "26",
                  style: TextStyle(fontSize: 64),
                ),
              ),
              Text(
                "litres of water",
                style: TextStyle(fontSize: 26),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 50, 50, 30),
                child: Text(
                  "Scan more QR codes and answer question to receive more points!",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScanQRCodeScreen(),
            ),
          );
        },
        child: Icon(Icons.photo_camera),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
