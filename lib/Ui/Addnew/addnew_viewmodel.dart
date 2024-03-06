import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:posthub/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../app/utils.dart';


class AddnewViewModel extends BaseViewModel {
  List gender=["Male","Female","Other"];
  List category=["google","meta"];
  String cat="google";
   String sex="Male";
  void ChangeGender(String values1) {
    sex=values1;
    notifyListeners();
  }
  void ChangeCategory(String values1) {
    cat=values1.toString();
    notifyListeners();
  }
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  void toggleProgress() {
    _isBusy = !_isBusy;
    notifyListeners();
  }

  final DialogService _dialogService = DialogService();

  Future<void> showDialogue() async {
    setBusy(_isBusy); // Set the ViewModel as busy

    await _dialogService.showDialog(
      title: 'Uploading',
      description: 'please wait...',
    );

    setBusy(_isBusy); // Set the ViewModel as not busy
  }
  init(){
    if(_file==null){
      _file= getImageFileFromAsset('assets/images/image_not_found.png') as File?;
    }
  }

  TextEditingController addCaptionValueController = TextEditingController();

  TextEditingController addDescriptionController = TextEditingController();

  TextEditingController languageController = TextEditingController();

  TextEditingController locationController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController enddateController = TextEditingController();
  //late TabController tabviewController=TabController();
  TextEditingController addKeywordsController = TextEditingController();

  TextEditingController budgetctrlr = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SfRangeValues values = SfRangeValues(40.0, 60.0);

  void Login(){

    navigationService.navigateTo(Routes.dashBoardView);
  }
void validateandpush(){
    if(formKey.currentState!.validate()){
      print("uploading");
      uploadFile(addCaptionValueController.text, cat, addDescriptionController.text, locationController.text, budgetctrlr.text, sex, values.end.toString(), url, values.start.toString(), addKeywordsController.text, startdateController.text, enddateController.text,"0","000");
    }
}
  void setrange(SfRangeValues values1) {
    values=values1;
    notifyListeners();
  }

  File? _file;
  File? get file => _file;

  Future<File> getImageFileFromAsset(String assetPath) async {
    // Get the temporary directory path
    final directory = await getTemporaryDirectory();
    // Create a new file in the temporary directory
    final file = File('${directory.path}/${assetPath.split('/').last}');

    // Check if the file already exists, if not, copy the asset image to the file
    if (!file.existsSync()) {
      final data = await rootBundle.load(assetPath);
      final bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
    }

    return file;
  }


  var url;
  UpdateFile(var u)
  {
print("updating file");
    _file=u;
    notifyListeners();
  }
  UpdateFie(var u)
  {print("updating url");

    url=u;
    notifyListeners();
  }


  uploadFile(String caption, String addcategory, String discription,String location,String budget, String gender, String ageend,var url,String agestart,String keywords,String startdate,String enddate,String totalviews,String moneyspent) async {
    DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('myadds');
toggleProgress() ;
print("toggle changed");

    print("dialogue ");
    try {
      print("try ::::::::");    print("url ::::::::${url}");

      if (url != null) {
        print("enteringtry ::::::::");
        Map<String, dynamic> myadds = {
          'caption': caption,
          'addcategory': addcategory,
          'discription':discription,
          'budget': budget,
          'startdate': startdate,
          'enddate': enddate,
          'location': location,
          'agestart': agestart,
          'ageend': ageend,
          'rejected': false,
          'gender': gender,
          'keywords':keywords,
          'url': url,
          'totalviews': totalviews,
          'moneyspent': moneyspent,
        };
        print("try to push::::::::${myadds.toString()}");
        showDialogue();
        dbRef!.push().set(myadds).whenComplete(() {
          toggleProgress() ;
          //code to navigate to login page
          navigationService.pushNamedAndRemoveUntil(Routes.dashBoardView);
        });
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  }
