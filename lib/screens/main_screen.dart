import 'package:devfest_mobile_app/screens/give_water_screen.dart';
import 'package:devfest_mobile_app/screens/rules_screen.dart';
import 'package:devfest_mobile_app/utils/auth.dart';
import 'package:flutter/services.dart';
import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/models/app_model.dart';
import 'package:devfest_mobile_app/screens/question_screen.dart';
import 'package:devfest_mobile_app/screens/error_barcode_scanner_screen.dart';
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
              print(model.getUID());
              if (projectSnap.hasData) {
                print(projectSnap.data);
                Provider.of<AppModel>(context, listen: false)
                    .setTotalScore(projectSnap.data['totalScore']);
                Provider.of<AppModel>(context, listen: false)
                    .setActualScore(projectSnap.data['actualScore']);
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Water collected",
                          style: TextStyle(fontSize: 28),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                          ),
                          child: Text(
                            projectSnap.data['totalScore'].toString(),
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          "Water to give",
                          style: TextStyle(fontSize: 28),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                          ),
                          child: Text(
                            projectSnap.data['actualScore'].toString(),
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        OutlineButton(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Text(
                              "Give water",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          color: Config.colorPalette.shade50,
                          splashColor: Config.colorPalette.shade100,
                          highlightColor: Config.colorPalette.shade100,
                          onPressed: projectSnap.data['actualScore'] == 0
                              ? null
                              : () {
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
                          padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
                          child: Text(
                            "Scan more QR codes and answer question to receive more water!",
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RulesScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Contest rules',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
    Auth().listenData();
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorBarcodeScannerScreen(),
          ),
        );
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
