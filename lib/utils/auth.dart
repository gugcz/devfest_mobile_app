import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  void listenData()async{
    FirebaseUser user = await _auth.currentUser();
    if (user.uid != null) {
      String uuid = user.uid;
      StreamSubscription streamSubscription;
      streamSubscription = _firestore.collection('users').document(uuid).snapshots().listen(
        (data){
          if (!data.exists){
            _auth.signOut();
            streamSubscription.cancel();
          }
        }
      );
    }
  }

  Future<DocumentSnapshot> getCurrentUserData() async {
    FirebaseUser user = await _auth.currentUser();
    if (user.uid != null) {
      String uuid = user.uid;
      DocumentSnapshot data = await _firestore.collection('users').document(uuid).get();
      if (data.exists){
        return data;
      } else {
        return null;
      }
    }
    return null;
  }

  Future<Stream<DocumentSnapshot>> listenUserData() async {
    FirebaseUser user = await _auth.currentUser();
    if (user.uid != null) {
      String uuid = user.uid;
      Stream<DocumentSnapshot> data = _firestore.collection('users').document(uuid).snapshots();
      return data;
    }
    return null;
  }

  void signOut() {
    _auth.signOut();
  }

  Stream<FirebaseUser> listenCurrentAuthState() {
    return _auth.onAuthStateChanged;
  }

  Future<String> handleSignIn(int numberBadge) async {
    await _auth.signInAnonymously();
    FirebaseUser user = await _auth.currentUser();
    if (user.uid.isNotEmpty) {
      String uuid = user.uid;
      DocumentSnapshot data = await getCurrentUserData();
      if (data != null) {
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
        await _firestore.collection('numbersOnBadges').document(numberBadge.toString()).setData({
          'isUsed': true,
          'number': numberBadge
        });
        return uuid;
      }    
    }
    return null;
  }
}
