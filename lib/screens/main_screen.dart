import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/models/uid_model.dart';
import 'package:devfest_mobile_app/screens/scan_qr_code.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final String number;
  MainScreen({Key key, this.title, this.number}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  Widget _decideBottomNavigation() {
    return BottomNavigationBar(
      backgroundColor: Config.colorPalette.shade800,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      currentIndex: _currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.business_center,
          ),
          title: Text(
            'Inventory',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map,
          ),
          title: Text(
            'Map',
          ),
        ),
      ],
    );
  }

  Widget _decideFloatingActionButton() {
    return _currentIndex == 0
        ? FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScanQRCodeScreen(),
                ),
              );
            },
            child: Icon(Icons.photo_camera),
            backgroundColor: Config.colorPalette.shade800,
            foregroundColor: Colors.white,
          )
        : null;
  }

  Widget _decideView() {
    if (_currentIndex == 0) {
      return Consumer<UIDModel>(
        builder: (context, model, child) {
          return StreamBuilder(
            builder: (context, projectSnap) {
              if (projectSnap.hasData) {
                return Container(
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
                          projectSnap.data['totalScore'].toString(),
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
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    Text(
                      'Loading',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }
            },
            stream: Firestore.instance
                .collection('users')
                .document(model.getUID())
                .snapshots(),
          );
        },
      );
    } else {
      return WebView(
        initialUrl:
            'https://maps.mapwize.io/#/p/devfestcz19/emerald_city_track?k=SSGLbv713lthqEg9&z=19&embed=true&venueId=5d9e2c3d6dc554006277453a',
        javascriptMode: JavascriptMode.unrestricted,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colorPalette.shade500,
      appBar: AppBar(
        title: Text('DevFest CZ 2019'),
        backgroundColor: Config.colorPalette.shade800,
      ),
      body: Center(
        child: _decideView(),
      ),
      bottomNavigationBar: _decideBottomNavigation(),
      floatingActionButton: _decideFloatingActionButton(),
    );
  }
}
