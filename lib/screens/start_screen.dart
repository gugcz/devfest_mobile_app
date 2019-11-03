import 'package:devfest_mobile_app/models/app_model.dart';
import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/screens/loading_screen.dart';
import 'package:devfest_mobile_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/devfest_logo.dart';
import 'package:devfest_mobile_app/components/gug_logo.dart';
import 'package:provider/provider.dart';
import '../utils/auth.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool loading = false;
  String error = "";

  final numberFieldController = TextEditingController();

  final Auth auth = Auth();

  @override
  void dispose() {
    numberFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : Scaffold(
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
                            Text(
                              error,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: OutlineButton(
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
                            ),
                          ],
                        ),
                      ),
                    ]),
                    GUGLogo(),
                  ],
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
          );
  }

  _login() async {
    if (numberFieldController.text.length == 4) {
      setState(() {
        loading = true;
        error = "";
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: new Text("Sign in"),
                content: new Text("Number " +
                    numberFieldController.text +
                    " will get locked for this phone"),
                actions: <Widget>[
                  new FlatButton(
                    child: Text("Back"),
                    onPressed: () {
                      setState(() {
                        loading = false;
                        error = "";
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("Sign in"),
                    onPressed: () async {
                        setState(() {
                          loading = true;
                          error = "";
                        });
                      try {
                        String uuid = await auth.handleSignIn(
                            int.parse(numberFieldController.text));
                        Provider.of<AppModel>(context, listen: false)
                            .setUID(uuid);
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                        auth.listenData();
                      } catch (err) {
                        setState(() {
                          loading = false;
                          error = "Error authenticating user.";
                        });
                      }
                    },
                  )
                ]);
          });
    } else {
      setState(() {
        error = "Please enter all 4 digits of your number.";
      });
    }
  }
}
