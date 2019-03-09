import 'package:devfest_mobile_app/config.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Config.colorPalette,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Enter the four-digit number that appears on the back side of your badge',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                        style: TextStyle(fontSize: 36),
                        maxLength: 4,
                      ),
                      OutlineButton(
                        textColor: Colors.white,
                        child: Text('OK'),
                        onPressed: () {},
                      ),
                    ],
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
