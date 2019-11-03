import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  Future<DocumentSnapshot> getCurrentUserData() async {
    FirebaseUser user = await _auth.currentUser();
    if (user.uid.isNotEmpty) {
      String uuid = user.uid;
      return _firestore.collection('users').document(uuid).get();
    }
    return null;
  }

  Future<String> handleSignIn(int numberBadge) async {
    await _auth.signInAnonymously();
    FirebaseUser user = await _auth.currentUser();
    if (user.uid.isNotEmpty) {
      String uuid = user.uid;
      DocumentSnapshot data = await getCurrentUserData();
      if (data.exists) {
        if (data.data['number'] != numberBadge) {
          throw Exception('Cannot sign in with different badge');
        } else {
          return uuid;
        }
      } else {
        await _firestore.collection('users').document(uuid).setData({
          'number': numberBadge,
          'uuid': uuid,
          'actualScore': 0,
          'totalScore': 0
        });
        await _firestore.collection('numberOnBadges').document(numberBadge.toString()).updateData({
          'isUsed': true
        });
        return uuid;
      }
    }
    return null;
  }
}
