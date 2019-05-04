import 'package:devfest_mobile_app/config.dart';
import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/screens/scan_map_code.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  Widget decideView() {
    if (_currentIndex == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("This is main screen."),
        ],
      );
    } else if (_currentIndex == 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("This is inventory screen."),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("This is leaderboard screen."),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevFest CZ 2019'),
      ),
      body: Center(
        child: Container(
          child: decideView(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Config.colorPalette.shade700,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScanMapCodeScreen(),
              ),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        // new
        currentIndex: _currentIndex,
        // new
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.amberAccent,
            icon: Icon(
              Icons.schedule,
            ),
            title: Text(
              'Schedule',
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
              Icons.dashboard,
            ),
            title: Text(
              'Leaderboard',
            ),
          ),
        ],
      ),
    );
  }
}
