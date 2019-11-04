import 'package:devfest_mobile_app/screens/give_water_screen.dart';
import 'package:flutter/services.dart';
import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/models/app_model.dart';
import 'package:devfest_mobile_app/screens/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:connectivity/connectivity.dart';

class MainScreen extends StatefulWidget {
  final String number;
  MainScreen({Key key, this.title, this.number}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  int _stackToView = 1;

  Widget _decideBottomNavigation() {
    return BottomNavigationBar(
      backgroundColor: Config.colorPalette.shade800,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          _stackToView = 0;
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
              scan(context);
            },
            child: Icon(Icons.photo_camera),
            backgroundColor: Config.colorPalette.shade800,
            foregroundColor: Colors.white,
          )
        : null;
  }

  void _handleWebViewLoad(String value) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _stackToView = 2;
      });
    } else {
      setState(() {
        _stackToView = 0;
      });
    }
  }

  Widget _decideView() {
    if (_currentIndex == 0) {
      return Consumer<AppModel>(
        builder: (context, model, child) {
          return StreamBuilder(
            builder: (context, projectSnap) {
              if (projectSnap.hasData) {
                Provider.of<AppModel>(context, listen: false).setTotalScore(projectSnap.data['totalScore']);
                Provider.of<AppModel>(context, listen: false).setActualScore(projectSnap.data['actualScore']);

                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Water collected:",
                        style: TextStyle(fontSize: 36),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: Text(
                          projectSnap.data['totalScore'].toString() + " l",
                          style: TextStyle(fontSize: 64),
                        ),
                      ),
                      Text(
                        "Water to give:",
                        style: TextStyle(fontSize: 32),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 40,
                        ),
                        child: Text(
                          projectSnap.data['actualScore'].toString() + " l",
                          style: TextStyle(fontSize: 48),
                        ),
                      ),
                      OutlineButton(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            "Give water",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        color: Config.colorPalette.shade50,
                        splashColor: Config.colorPalette.shade100,
                        highlightColor: Config.colorPalette.shade100,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GiveWaterScreen(),
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 40, 50, 30),
                        child: Text(
                          "Scan more QR codes and answer question to receive more water!",
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
                .document(model.getBadgeNumber())
                .snapshots(),
          );
        },
      );
    } else {
      return IndexedStack(
        index: _stackToView,
        children: <Widget>[
          WebView(
            initialUrl:
                'https://maps.mapwize.io/#/p/devfestcz19/emerald_city_track?k=SSGLbv713lthqEg9&z=19&embed=true&venueId=5d9e2c3d6dc554006277453a',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: _handleWebViewLoad,
          ),
          Center(
            child: Column(
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
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Unable to load map.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
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

  Future scan(context) async {
    try {
      String codeContent = await BarcodeScanner.scan();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuestionScreen(
            questionId: codeContent,
          ),
        ),
      );
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        print('The user did not grant the camera permission!');
      } else {
        print('Unknown error: $e');
      }
    } on FormatException {
      print(
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      print('Unknown error: $e');
    }
  }
}
