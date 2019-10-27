import 'dart:convert';
import 'package:devfest_mobile_app/config.dart';
import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/devfest_logo.dart';
import 'package:devfest_mobile_app/components/gug_logo.dart';
import 'package:devfest_mobile_app/utils/token_file.dart';
import 'package:http/http.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  initState() {
    super.initState();
  }

  final numberFieldController = TextEditingController();

  @override
  void dispose() {
    numberFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colorPalette.shade500,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 100, 30, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(children: <Widget>[
                DevFestLogo(),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Enter code located at the back of your badge.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Container(
                          width: 100,
                          child: TextField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
                            controller: numberFieldController,
                          ),
                        ),
                      ),
                      OutlineButton(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Config.colorPalette.shade50,
                        splashColor: Config.colorPalette.shade100,
                        highlightColor: Config.colorPalette.shade100,
                        onPressed: _login,
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(7.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              GUGLogo(
                opacity: 0.75,
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  _login() async {
    var url = 'https://us-central1-devfestcztest.cloudfunctions.net/login';
    try {
      var response = await post(url, body: {
        'number': numberFieldController.text,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['data']['type'] == 'token') {
          TokenFile.writeToken(Credentials(numberFieldController.text, data['data']['token']));          
        }
      }
    } catch (exception) {
      print(exception);
    }
  }
}
