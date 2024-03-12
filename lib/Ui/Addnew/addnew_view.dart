import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:posthub/app/size_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../app/image_constant.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'addnew_viewmodel.dart';

class AddnewView extends StatelessWidget {
  AddnewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddnewViewModel>.reactive(
        viewModelBuilder: () => AddnewViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: CustomAppBar(
                leadingWidth: 56.h,
                leading: Icon(
                  Icons.arrow_back,
                  size: 40,
                ),
                // leading: AppbarLeadingIconbutton(
                //   imagePath: ImageConstant.imgIcon2,
                //   margin: EdgeInsets.only(
                //     left: 16.h,
                //     top: 8.v,
                //     bottom: 8.v,
                //   ),
                // ),
                title: AppbarTitle(
                  text: "Create New Ad",
                  margin: EdgeInsets.only(left: 11.h),
                ),
              ),
              body: Form(
                key: model.formKey,
                child: SizedBox(
                  width: SizeUtils.width,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 32.v),
                    child: Column(
                      children: [
                        TakePic(),
                        SizedBox(height: 35.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Row(
                              children: [
                                Text(
                                  "Run Campaign in",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.v),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    model.ChangeCategory("google");
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: model.cat == "google"
                                        ? Colors.blue
                                        : Colors.grey,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/google.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15.v,
                                ),
                                InkWell(
                                  onTap: () {
                                    model.ChangeCategory("meta");
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: model.cat == "meta"
                                        ? Colors.blue
                                        : Colors.grey,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CircleAvatar(
                                        child: SvgPicture.asset(
                                          "assets/images/meta.svg",
                                          height: 20.v,
                                          width: 20.h,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        SizedBox(height: 20.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Caption';
                              }
                              return null;
                            },
                            controller: model.addCaptionValueController,
                            hintText: "Add Caption",
                          ),
                        ),
                        SizedBox(height: 20.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Description';
                              }
                              return null;
                            },
                            controller: model.addDescriptionController,
                            hintText: "Add Description",
                            maxLines: 5,
                            contentPadding: EdgeInsets.all(8.h),
                          ),
                        ),
                        SizedBox(height: 17.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Text(
                              "Add Your Budget",
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "₹",
                            ),
                            validator: (value) {
                              if (value == null || int.parse(value) < 500) {
                                return 'Please enter sufficient Budget';
                              }
                              return null;
                            },
                            controller: model.budgetctrlr,
                          ),
                        ),
                        SizedBox(height: 2.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Text(
                              "Min amount  500",
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Row(
                              children: [
                                Text(
                                  "Start from",
                                  style: theme.textTheme.titleSmall,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 94.h),
                                  child: Text(
                                    "End Date",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.v),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.h),
                          decoration: AppDecoration.outlineBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 160.h,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Pic Date",
                                      border: OutlineInputBorder()),
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2100));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16

                                      model.startdateController.text =
                                          formattedDate; //set output date to TextField value.
                                    }
                                  },

                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter start date';
                                  //   }
                                  //   return null;
                                  // },
                                  controller: model.startdateController,

                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                              Container(
                                width: 160.h,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Pic End Date",
                                      border: OutlineInputBorder()),
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2100));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16

                                      model.enddateController.text =
                                          formattedDate; //set output date to TextField value.
                                    }
                                  },

                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter start date';
                                  //   }
                                  //   return null;
                                  // },
                                  controller: model.enddateController,

                                  textInputAction: TextInputAction.done,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Location ",
                                style: theme.textTheme.titleSmall,
                              ),
                              Text(
                                "+ Add",
                                style: theme.textTheme.labelLarge!.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Location';
                              }
                              return null;
                            },
                            controller: model.locationController,
                            hintText: "Location",
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        SizedBox(height: 28.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Text(
                              "Age Preference",
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.v),
                        SizedBox(
                          height: 50.v,
                          child: SfRangeSlider(
                            min: 0.0,
                            max: 100.0,
                            values: model.values,
                            interval: 10,
                            showTicks: true,
                            showLabels: true,
                            enableTooltip: true,
                            minorTicksPerInterval: 1,
                            onChanged: (SfRangeValues values) {
                              model.setrange(values);
                            },
                          ),
                        ),
                        SizedBox(height: 40.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Text(
                              "Gender",
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        Container(
                          height: 42.v,
                          width: 330.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Radio(
                                activeColor: Theme.of(context).primaryColor,
                                value: model.gender[0],
                                groupValue: model.sex,
                                onChanged: (value) {
                                  model.ChangeGender(value);
                                },
                              ),
                              Text("${model.gender[0]}"),
                              SizedBox(
                                width: 10.v,
                              ),
                              Radio(
                                activeColor: Theme.of(context).primaryColor,
                                value: model.gender[1],
                                groupValue: model.sex,
                                onChanged: (value) {
                                  model.ChangeGender(value);
                                },
                              ),
                              Text("${model.gender[1]}"),
                              SizedBox(
                                width: 10.v,
                              ),
                              Radio(
                                activeColor: Theme.of(context).primaryColor,
                                value: model.gender[2],
                                groupValue: model.sex,
                                onChanged: (value) {
                                  model.ChangeGender(value);
                                },
                              ),
                              Text("${model.gender[2]}")
                            ],
                          ),
                        ),
                        SizedBox(height: 20.v),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Keywords",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  SizedBox(height: 15.v),
                                  Container(
                                      child: CustomTextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter key words for ranking';
                                      }
                                      return null;
                                    },
                                    controller: model.addKeywordsController,
                                    hintText: "Add upto 10 Keywords",
                                    contentPadding: EdgeInsets.all(8.h),
                                  )),
                                  SizedBox(height: 3.v),
                                  Text(
                                    "Add a comma (,) to separate keyword ",
                                    style: theme.textTheme.labelMedium,
                                  ),
                                  SizedBox(height: 36.v),
                                  CustomElevatedButton(
                                    buttonStyle: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.black)),
                                    buttonTextStyle: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    text: "Start Campaign",
                                    onPressed: () {
                                      model.validateandpush();
                                    },
                                  ),
                                  SizedBox(height: 46.v),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 260.v,
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class TakePic extends ViewModelWidget<AddnewViewModel> {
  TakePic({super.key});

  @override
  Widget build(BuildContext context, AddnewViewModel viewModel) {
    var url;

    File? _image;

    // This is the image picker
    final _picker = ImagePicker();

    getImage() async {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      print(pickedImage!.path.toString());
      _image = File(pickedImage!.path);
      viewModel.UpdateFile(_image);

      var imagefile = FirebaseStorage.instance
          .ref()
          .child("post_thumbnail")
          .child("/postpic${_image}.jpg");
      UploadTask task = imagefile.putFile(_image!);
      TaskSnapshot snapshot = await task;
      url = await snapshot.ref.getDownloadURL();
      print("url::::${url.toString()}");
      viewModel.UpdateFie(url);

      // print(file);
    }

    return SizedBox(
      height: 200.v,
      width: 329.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            child: viewModel.file == null
                ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    height: 200.v,
                    width: 329.h,
                  )
                : Image.file(
                    viewModel.file!,
                    fit: BoxFit.cover,
                  ),
            height: 200.v,
            width: 329.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.h,
              ),
            ),
            alignment: Alignment.center,
          ),
          Container(
            child: CustomImageView(
              imagePath: ImageConstant.imgUpload,
              height: 28.adaptSize,
              width: 28.adaptSize,
              margin: EdgeInsets.only(bottom: 150.v),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 140, left: 40),
            child: SizedBox(
              width: 250.h,
              child: Text('Choose a file or drag & drop it here',
                  style: theme.textTheme.bodyMedium),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 110, left: 30),
            child: SizedBox(
              width: 250.h,
              child: Text(
                'JPEG, PNG, PDG, and MP4 formats, up to 50MB',
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          CustomOutlinedButton(
            width: 119.h,
            text: "Browse Files",
            margin: EdgeInsets.only(bottom: 40.v),
            alignment: Alignment.bottomCenter,
            onPressed: () {
              getImage();
            },
          ),
        ],
      ),
    );
  }
}
