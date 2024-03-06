




import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:posthub/Ui/home/user.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.router.dart';
import '../../app/utils.dart';

//import '../../webservice/productprovider.dart';



class MetaViewModel extends BaseViewModel {

  List<Post> postlist = [];



  void deleteItem(String id, int index) {
    print("id needed to delete:$id");
    DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('myadds').child(id);

    dbRef.remove().then((_) {
      print("Item deleted successfully");
      postlist.removeAt(index);
      notifyListeners();
    }).catchError((error) {
      print("Failed to delete item: $error");
    });




    // for (int index = 0; index < globelusers.length; index++) {
    //   if (globelusers[index].id == id) {
    //     globelusers.removeWhere((item) => item.id == id);  // 1st Method
    //     globelusers.remove(index);                         // 2nd Method
    //   }
    // }

    // print('::::003:::::Deletion function executed');
  }




  void fetchDataFromFirebase() {
    DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('myadds');
    db_Ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot;
      Map P = data.value as Map<dynamic, dynamic>;
      print(P.toString());postlist.clear;
      notifyListeners();
      postlist = convertFirebaseResponseToPostList(P);
      notifyListeners();
      print('Adds::::${postlist.toString()}');
    });
  }
  List<Post> convertFirebaseResponseToPostList(Map<dynamic, dynamic> firebaseResponse) {


    firebaseResponse.forEach((key, value) {
      String id = key.toString();
      print("key:$key");
      String addcategory = value['addcategory'];
      String caption = value['caption'];
      String discription = value['discription'];
      String budget = value['budget'];
      String startdate = value['startdate'];
      String url = value['url'];
      String enddate = value['enddate'];
      String location=value['location'];
      String  agestart= value['agestart'];
      String  ageend= value['ageend'];
      bool  rejected= value['rejected'];
      String  gender=value['gender'];
      String keywords= value['keywords'];
      String totalviews= value['totalviews'];
      String moneyspent= value['moneyspent'];

if(addcategory=="meta") {
  Post p = Post(id: id,
      caption: caption,
      addcategory: addcategory,
      discription: discription,
      budget: budget,
      startdate: startdate,
      enddate: enddate,
      location: location,
      agestart: agestart,
      ageend: ageend,
      rejected: false,
      gender: gender,
      keywords: keywords,
      url: url,
      totalviews: totalviews,
      moneyspent: moneyspent);
  postlist.add(p);
  notifyListeners();
}


    });

    return postlist;
  }


    late String email="",name="",phoneNumber="",photoURL="";
  var provider;
  init() async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
    email=prefs.getString("email")??"";
    name=prefs.getString("name")??"";
    phoneNumber=prefs.getString("phoneNumber")??"";
    photoURL=prefs.getString("photoURL")??"";
    notifyListeners();
  }

  void Detailspage(Post p){
    navigationService.navigateTo(Routes.detailsView,arguments: DetailsViewArguments(post: p));
  }
  void Addpage(){
    navigationService.navigateTo(Routes.addnewView);
  }
  }
