import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/screens/scan_map_code.dart';
import 'package:devfest_mobile_app/components/talk_card.dart';
import 'package:devfest_mobile_app/components/topic.dart';
import 'package:devfest_mobile_app/components/schedule_item_card.dart';
import 'package:devfest_mobile_app/components/schedule_time_title.dart';
import 'package:devfest_mobile_app/entities/talk.dart';
import 'package:devfest_mobile_app/entities/speaker.dart';
import 'package:devfest_mobile_app/entities/company.dart';
import 'package:devfest_mobile_app/entities/schedule_item.dart';

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
          ScheduleTimeTitle(
            hours: "9",
            minutes: "00",
          ),
          ScheduleItemCard(
              item: ScheduleItem(
                  title: "Keynote",
                  time: "9:00",
                  language: "EN",
                  hall: "Hall A",
                  description:
                      "Don't miss the opening keynote! Don't miss the opening keynote! Don't miss the opening keynote! Don't miss the opening keynote! Don't miss the opening keynote! Don't miss the opening keynote! Don't miss the opening keynote! Don't miss the opening keynote! Don't miss the opening keynote! Don't miss the opening keynote! Don't miss the opening keynote! Don't miss the opening keynote! Don't miss the opening keynote!"),
            ),
          ScheduleTimeTitle(
            hours: "9",
            minutes: "30",
          ),
          TalkCard(
            talk: Talk(
              name: "Why metal is so great? Why metal is so great?",
              subtitle: "Beginners / EN / Hall A / 40 min",
              description:
                  "Accepting payments online should be easy to implement and handy to use. Come and learn how the Google Pay API can improve your payment flow and increase conversions by offering customers tons of helpful check out tools. Join us for an overview session followed by a live demo on how quickly you can integrate Google Pay into your Android application",
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
                bio:
                    "Jose is a Developer Programs Engineer on the Google Pay team, currently focusing on facilitating online integration of payment APIs across customers in EMEA. Previously, he worked as a technical trainer and software engineering manager on projects such as Wunderlist, ROI Training and Google Cloud.",
              ),
            ),
          ),
          TalkCard(
            talk: Talk(
              name: "Widgets!",
              description:
                  "Accepting payments online should be easy to implement and handy to use. Come and learn how the Google Pay API can improve your payment flow and increase conversions by offering customers tons of helpful check out tools. Join us for an overview session followed by a live demo on how quickly you can integrate Google Pay into your Android application",
              subtitle: "EN / Hall B",
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
                bio:
                    "Jose is a Developer Programs Engineer on the Google Pay team, currently focusing on facilitating online integration of payment APIs across customers in EMEA. Previously, he worked as a technical trainer and software engineering manager on projects such as Wunderlist, ROI Training and Google Cloud.",
              ),
            ),
          ),
          ScheduleTimeTitle(
            hours: "10",
            minutes: "10",
          ),
          TalkCard(
            talk: Talk(
              name: "Widgets with Firebase!",
              description:
                  "Accepting payments online should be easy to implement and handy to use. Come and learn how the Google Pay API can improve your payment flow and increase conversions by offering customers tons of helpful check out tools. Join us for an overview session followed by a live demo on how quickly you can integrate Google Pay into your Android application",
              subtitle: "Beginners / EN / 40 min",
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
                bio:
                    "Jose is a Developer Programs Engineer on the Google Pay team, currently focusing on facilitating online integration of payment APIs across customers in EMEA. Previously, he worked as a technical trainer and software engineering manager on projects such as Wunderlist, ROI Training and Google Cloud.",
              ),
            ),
          ),
          TalkCard(
            talk: Talk(
              name: "No topics!",
              description:
                  "Accepting payments online should be easy to implement and handy to use. Come and learn how the Google Pay API can improve your payment flow and increase conversions by offering customers tons of helpful check out tools. Join us for an overview session followed by a live demo on how quickly you can integrate Google Pay into your Android application",
              subtitle: "Beginners / EN / 40 min",
              speaker: Speaker(
                name: "Ozzy Osbourne",
                company: Company(
                  name: "Black Sabbath",
                  logo: AssetImage("assets/black-sabbath.jpg"),
                ),
                photo: AssetImage("assets/ozzy.jpg"),
                position: "Father of Metal",
                bio:
                    "Jose is a Developer Programs Engineer on the Google Pay team, currently focusing on facilitating online integration of payment APIs across customers in EMEA. Previously, he worked as a technical trainer and software engineering manager on projects such as Wunderlist, ROI Training and Google Cloud.",
              ),
            ),
          ),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '1st',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            '123456 - 25 l of water',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '2nd',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            '123458 - 20 l of water',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '3rd',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            '123457 - 15 l of water',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "You are at position",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Text(
                    "26",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 42,
                    ),
                  ),
                ),
                Text(
                  "with",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: Text(
                    "2",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 36,
                    ),
                  ),
                ),
                Text(
                  "l of water.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
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
