import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:posthub/app/app.router.dart';

import '../../app/utils.dart';


class EditViewModel extends BaseViewModel {
  TextEditingController addCaptionValueController = TextEditingController();

  TextEditingController addDescriptionController = TextEditingController();

  TextEditingController languageController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  late TabController tabviewController;
  TextEditingController addKeywordsController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void Login(){

    navigationService.navigateTo(Routes.dashBoardView);
  }

  }
