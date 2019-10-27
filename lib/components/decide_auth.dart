import 'package:devfest_mobile_app/screens/main_screen.dart';
import 'package:devfest_mobile_app/screens/start_screen.dart';
import 'package:devfest_mobile_app/utils/token_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DecideAuth extends StatelessWidget {
  final Credentials credentials;

  DecideAuth(this.credentials);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.data == null) {
          return Container();
        } else {
          if (projectSnap.data.user != null) {
            return MainScreen();
          } else {
            return StartScreen();
          }
        }
      },
      future: FirebaseAuth.instance.signInWithCustomToken(token: credentials.token),
    );
  }
}
