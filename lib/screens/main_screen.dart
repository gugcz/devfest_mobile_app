import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/screens/scan_map_code.dart';
import 'package:devfest_mobile_app/components/talk_card.dart';
import 'package:devfest_mobile_app/components/topic.dart';
import 'package:devfest_mobile_app/entities/talk.dart';
import 'package:devfest_mobile_app/entities/speaker.dart';
import 'package:devfest_mobile_app/entities/company.dart';

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
      return ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Keynote',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                      child: Text(
                        '9:00 / EN / Hall A',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          TalkCard(
            talk: Talk(
              name: "Why metal is so great? Why metal is so great?",
              firstSubtitle: "Beginners / EN / 40 min",
              secondSubtitle: "9:30 / EN / Hall A",
              description: "TBA",
              topics: List<Topic>.from([
                Topics.android,
                Topics.firebase,
              ]),
              speaker: Speaker(
                photo: AssetImage("assets/ozzy.jpg"),
                name: "Ozzy Osbourne",
                company: Company(
                  name: "Black Sabbath",
                  logo: AssetImage("assets/black-sabbath.jpg"),
                ),
                position: "Father of Metal",
                bio: "Speaker bio",
              ),
            ),
          ),
          TalkCard(
            talk: Talk(
              name: "Widgets!",
              description: "TBA",
              secondSubtitle: "9:30 / EN / Hall B",
              topics: List<Topic>.from([
                Topics.android,
                Topics.flutter,
              ]),
              speaker: Speaker(
                name: "Ozzy Osbourne",
                company: Company(
                  name: "Black Sabbath",
                  logo: AssetImage("assets/black-sabbath.jpg"),
                ),
                photo: AssetImage("assets/ozzy.jpg"),
                position: "Father of Metal",
                bio: "Speaker bio",
              ),
            ),
          ),
          TalkCard(
            talk: Talk(
              name: "Widgets with Firebase!",
              description: "TBA",
              firstSubtitle: "Beginners / EN / 40 min",
              topics: List<Topic>.from([
                Topics.flutter,
                Topics.firebase,
              ]),
              speaker: Speaker(
                photo: AssetImage("assets/ozzy.jpg"),
                name: "Ozzy Osbourne",
                company: Company(
                  name: "Black Sabbath",
                  logo: AssetImage("assets/black-sabbath.jpg"),
                ),
                position: "Father of Metal",
                bio: "Speaker bio",
              ),
            ),
          ),
          TalkCard(
            talk: Talk(
              name: "No topics!",
              description: "TBA",
              firstSubtitle: "Beginners / EN / 40 min",
              secondSubtitle: "10:30 / EN / Hall A",
              speaker: Speaker(
                name: "Ozzy Osbourne",
                company: Company(
                  name: "Black Sabbath",
                  logo: AssetImage("assets/black-sabbath.jpg"),
                ),
                photo: AssetImage("assets/ozzy.jpg"),
                position: "Father of Metal",
                bio: "Speaker bio",
              ),
            ),
          )
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
        //fixedColor: Config.colorPalette.shade700,
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
