import 'package:flutter/material.dart';
import 'package:posthub/app/size_utils.dart';
import 'package:stacked/stacked.dart';

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
import 'edit_viewmodel.dart';

class EditView extends StatelessWidget {
  EditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditViewModel>.reactive(
        viewModelBuilder: () => EditViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: CustomAppBar(
                leadingWidth: 56.h,
                leading: AppbarLeadingIconbutton(
                  imagePath: ImageConstant.imgIcon2,
                  margin: EdgeInsets.only(
                    left: 16.h,
                    top: 8.v,
                    bottom: 8.v,
                  ),
                ),
                title: AppbarTitle(
                  text: "Edit Ad.",
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
                        SizedBox(
                          height: 304.v,
                          width: 329.h,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgRectangle7304x329,
                                height: 304.v,
                                width: 329.h,
                                radius: BorderRadius.circular(
                                  10.h,
                                ),
                                alignment: Alignment.center,
                              ),
                              CustomOutlinedButton(
                                width: 119.h,
                                text: "Browse Files",
                                margin: EdgeInsets.only(bottom: 108.v),
                                alignment: Alignment.bottomCenter,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 45.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: CustomTextFormField(
                            controller: model.addCaptionValueController,
                            hintText: "Add Caption",
                          ),
                        ),
                        SizedBox(height: 16.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: CustomTextFormField(
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
                        SizedBox(height: 5.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: CustomTextFormField(
                            controller: model.languageController,
                            hintText: "₹",
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
                        SizedBox(height: 9.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.h),
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
                          padding: EdgeInsets.symmetric(vertical: 3.v),
                          decoration: AppDecoration.outlineBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 160.h,
                                padding:
                                    EdgeInsets.fromLTRB(27.h, 6.v, 28.h, 6.v),
                                decoration: AppDecoration.outlineBluegray10002,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "22 JANUARY 2024",
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              CustomOutlinedButton(
                                width: 164.h,
                                text: "22 FEBRUARY 2024",
                                margin: EdgeInsets.only(left: 4.h),
                                buttonStyle:
                                    CustomButtonStyles.outlineBlueGray1,
                                buttonTextStyle: theme.textTheme.bodySmall!,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 17.v),
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
                        SizedBox(height: 24.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "10",
                                style: theme.textTheme.labelLarge,
                              ),
                              Text(
                                "20",
                                style: theme.textTheme.labelLarge,
                              ),
                              Text(
                                "30",
                                style: theme.textTheme.labelLarge,
                              ),
                              Text(
                                "40",
                                style: theme.textTheme.labelLarge,
                              ),
                              Text(
                                "50",
                                style: theme.textTheme.labelLarge,
                              ),
                              Text(
                                "60",
                                style: theme.textTheme.labelLarge,
                              ),
                              Text(
                                "70",
                                style: theme.textTheme.labelLarge,
                              ),
                              Text(
                                "80",
                                style: theme.textTheme.labelLarge,
                              ),
                              Text(
                                "90",
                                style: theme.textTheme.labelLarge,
                              ),
                              Text(
                                "100",
                                style: theme.textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.v),
                        SizedBox(
                          height: 30.v,
                          width: 324.h,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgGroup16,
                                height: 6.v,
                                width: 313.h,
                                alignment: Alignment.center,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 4.v,
                                  width: 324.h,
                                  margin: EdgeInsets.only(bottom: 9.v),
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          width: 324.h,
                                          child: Divider(),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: SizedBox(
                                          width: 140.h,
                                          child: Divider(
                                            color: theme.colorScheme.primary,
                                            indent: 69.h,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 58.h),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgUser,
                                        height: 30.v,
                                        width: 26.h,
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant
                                            .imgUserPrimarycontainer,
                                        height: 30.v,
                                        width: 26.h,
                                        margin: EdgeInsets.only(left: 43.h),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.v),
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
                        SizedBox(height: 8.v),
                        Column(
                          children: [
                            SizedBox(height: 31.v),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Keywords",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  SizedBox(height: 5.v),
                                  CustomTextFormField(
                                    controller: model.addKeywordsController,
                                    hintText: "Add upto 10 Keywords",
                                    textInputAction: TextInputAction.done,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    obscureText: true,
                                  ),
                                  SizedBox(height: 3.v),
                                  Text(
                                    "Add a comma (,) to separate keyword ",
                                    style: theme.textTheme.labelMedium,
                                  ),
                                  SizedBox(height: 26.v),
                                  CustomElevatedButton(
                                    text: "Update Campaign",
                                  ),
                                  SizedBox(height: 26.v),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  /// Section Widget

  /// Section Widget

  /// Section Widget

  /// Section Widget

  /// Section Widget

  /// Section Widget

  // /// Section Widget
  // Widget _buildTabview(BuildContext context) {
  //   return Container(
  //     height: 32.v,
  //     width: 330.h,
  //     child: TabBar(
  //       controller: tabviewController,
  //       labelPadding: EdgeInsets.zero,
  //       labelColor: appTheme.gray50,
  //       labelStyle: TextStyle(
  //         fontSize: 12.fSize,
  //         fontFamily: 'Inter',
  //         fontWeight: FontWeight.w600,
  //       ),
  //       unselectedLabelColor: appTheme.gray700,
  //       unselectedLabelStyle: TextStyle(
  //         fontSize: 12.fSize,
  //         fontFamily: 'Inter',
  //         fontWeight: FontWeight.w600,
  //       ),
  //       indicator: BoxDecoration(
  //         color: theme.colorScheme.primary,
  //       ),
  //       tabs: [
  //         Tab(
  //           child: Text(
  //             "Male",
  //           ),
  //         ),
  //         Tab(
  //           child: Text(
  //             "Female",
  //           ),
  //         ),
  //         Tab(
  //           child: Text(
  //             "Unisex",
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
