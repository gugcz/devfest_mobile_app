import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/models/app_model.dart';
import 'package:devfest_mobile_app/screens/main_screen.dart';
import 'package:devfest_mobile_app/screens/start_screen.dart';
import 'package:devfest_mobile_app/screens/loading_screen.dart';
import 'package:devfest_mobile_app/utils/auth.dart';
import 'package:devfest_mobile_app/utils/credentials_file.dart';
import 'package:devfest_mobile_app/components/decide_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      builder: (context) => AppModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //CredentialsFile.writeCredentials(Credentials('', ''));
    Provider.of<AppModel>(context, listen: false)
                .setUID('1234');
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Config.colorPalette,
        brightness: Brightness.dark,
        accentColor: Color(0xFFFFFFFFFF),
      ),
      home: StreamBuilder(
        stream: _auth.listenCurrentAuthState(),
        builder: (context, snapshot) {
          if (snapshot.hasError || snapshot.connectionState == ConnectionState.none || snapshot.connectionState == ConnectionState.waiting){
            return LoadingScreen();
          } else {
            if (snapshot.data != null && snapshot.data.uid != null){
            return new FutureBuilder(
              future: _auth.getCurrentUserData(),
              builder: (cont, snap){
                if (snap.data != null && snap.data.data['uuid'] != null){
                  Provider.of<AppModel>(context, listen: false)
                     .setUID(snap.data.data['uuid']);
                  return MainScreen();
                } else {
                  return StartScreen();
                }
              },
            );
            } else {
              return StartScreen();
            }
          }
        },
      )
    );
  }
}
