




import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:posthub/app/app.router.dart';

import '../../app/utils.dart';
import '../home/user.dart';


class DetailsViewModel extends BaseViewModel {
  late Post post;
  DetailsViewModel({required this.post});
  TextEditingController frameEighteenController = TextEditingController();


  TextEditingController frameNineteenController = TextEditingController();



  late String email="",name="",phoneNumber="",photoURL="";
  var provider;
  init() async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
    email=prefs.getString("email")??"";
    name=prefs.getString("name")??"";
    phoneNumber=prefs.getString("phoneNumber")??"";
    photoURL=prefs.getString("photoURL")??"";
    notifyListeners();
    frameEighteenController.text=post.caption;
    frameNineteenController.text=post.discription;
  }

  void update(Post post) {
    print("id needed to update:${post.id}");
    DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('myadds');
    final newPost = {
      "caption": frameEighteenController.text,
      "addcategory": post.addcategory,
      "discription": frameNineteenController.text,
      "budget": post.budget,
      "startdate": post.startdate,
      "enddate": post.enddate,
      "location": post.location,
      "agestart": post.agestart,
      "ageend": post.ageend,
      "rejected": post.rejected,
      "gender": post.gender,
      "keywords": post.keywords,
      "url": post.url,
      "totalviews": post.totalviews,
      "moneyspent": post.moneyspent
    };
    try {

      dbRef.child(post.id.toString()).update(newPost).then((_) {
        print('Data updated successfully');
        navigationService.pushNamedAndRemoveUntil(Routes.dashBoardView);
      }).catchError((error) {
        print('Failed to update data: $error');
      });
    // Temporory Removed...

    } catch (e) {
print("error:::::::::${e.toString()}");
    }
  }



  }
