




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:posthub/app/app.router.dart';

import '../../app/utils.dart';


class DashBoardViewModel extends BaseViewModel {
  late String email,name,phoneNumber,photoURL;
  //  pref.setString("email", "${user.email}");
  //       pref.setString("name", "${user.displayName}");
  //       pref.setString("phoneNumber", "${user.phoneNumber}");
  //       pref.setString("photoURL", "${user.photoURL}");
  Future<void> init() async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
     email=prefs.getString("email")??"";
    name=prefs.getString("name")??"";
    phoneNumber=prefs.getString("phoneNumber")??"";
    photoURL=prefs.getString("photoURL")??"";
    notifyListeners();

  }
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  void Login(){

    navigationService.navigateTo(Routes.loginView);
  }

  }
