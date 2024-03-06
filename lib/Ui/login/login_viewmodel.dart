
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:stacked/stacked.dart';
import 'package:posthub/app/app.router.dart';

import '../../app/utils.dart';


class LoginViewModel extends BaseViewModel {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult = await auth.signInWithCredential(credential);
      final User? user = authResult.user;
      return user;
    } catch (error) {
      print("Error during Google sign-in: $error");
      return null;
    }
  }

  Future<void> Login() async {
    User? user = await _handleSignIn();
    print('dataaaaaaaaaaaaaa${user?.displayName.toString()}');
    SharedPreferences pref =await SharedPreferences.getInstance();

    if (user != null) {
      pref.setString("email", "${user.email}");
      pref.setString("name", "${user.displayName}");
      pref.setString("phoneNumber", "${user.phoneNumber}");
      pref.setString("photoURL", "${user.photoURL}");
      navigationService.navigateTo(Routes.dashBoardView);
    }


  }

  }
