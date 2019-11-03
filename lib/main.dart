import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/models/uid_model.dart';
import 'package:devfest_mobile_app/screens/main_screen.dart';
import 'package:devfest_mobile_app/screens/start_screen.dart';
import 'package:devfest_mobile_app/screens/loading_screen.dart';
import 'package:devfest_mobile_app/utils/credentials_file.dart';
import 'package:devfest_mobile_app/components/decide_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      builder: (context) => UIDModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //CredentialsFile.writeCredentials(Credentials('', ''));
    Provider.of<UIDModel>(context, listen: false)
                .setUID('1234');
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Config.colorPalette,
        brightness: Brightness.dark,
        accentColor: Color(0xFFFFFFFFFF),
      ),
      home: MainScreen(),/*FutureBuilder(
        builder: (context, projectSnap) {
          if (projectSnap.data == null) {
            return LoadingScreen();
          } else if (projectSnap.data.isEmpty()) {
            return StartScreen();
          } else {
            Provider.of<UIDModel>(context, listen: false)
                .setUID(projectSnap.data.userNumber);
            return DecideAuth(projectSnap.data);
          }
        },
        future: CredentialsFile.readCredentials(),
      ),*/
    );
  }
}
