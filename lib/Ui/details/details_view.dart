import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:posthub/Ui/Edit/edit_view.dart';
import 'package:posthub/app/size_utils.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.router.dart';
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
import '../../widgets/custom_text_form_field.dart';
import '../home/user.dart';
import 'detais_viewmodel.dart';

class DetailsView extends StatelessWidget {
  late Post post;

  DetailsView({required this.post});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailsViewModel>.reactive(viewModelBuilder: () {
      final arguments =
          ModalRoute.of(context)!.settings.arguments as DetailsViewArguments;
      post = arguments.post;

      return DetailsViewModel(post: post);
    }, onViewModelReady: (model) {
      model.init();
    }, builder: (context, model, child) {
      return SafeArea(
          child: Scaffold(
              //resizeToAvoidBottomInset: false,
              appBar: CustomAppBar(
                  leadingWidth: 56,
                  leading: AppbarLeadingIconbutton(
                      imagePath: model.photoURL,
                      margin:
                          EdgeInsets.only(left: 16.h, top: 8.v, bottom: 8.v)),
                  centerTitle: true,
                  title: AppbarTitle(text: "Advertisement  Status")),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.v, vertical: 13.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 1.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.v, vertical: 5.h),
                            decoration: AppDecoration.fillBlueGray.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder24),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 10.v),
                                  Container(
                                      height: 336.v,
                                      width: MediaQuery.of(context).size.width -
                                          20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: NetworkImage("${post.url}"),
                                            fit: BoxFit.fill,
                                          ))),
                                  SizedBox(height: 5.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(children: [
                                                Opacity(
                                                  opacity: .5,
                                                  child: SvgPicture.asset(
                                                    color: Colors.black,
                                                    "assets/images/img_bi_eye_fill.svg",
                                                    height: 16.adaptSize,
                                                    width: 16.adaptSize,
                                                  ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 3.h),
                                                    child: Text(
                                                        "${post.totalviews}",
                                                        style: CustomTextStyles
                                                            .labelLargeGray400))
                                              ]),
                                              SizedBox(height: 5.v),
                                              SizedBox(
                                                  width: 41.h,
                                                  child: Row(children: [
                                                    Opacity(
                                                        opacity: .5,
                                                        child: Icon(
                                                          Icons.currency_rupee,
                                                          size: 12,
                                                        )),
                                                    Text("${post.moneyspent}",
                                                        style: CustomTextStyles
                                                            .labelLargeGray400)
                                                  ])),
                                              SizedBox(height: 1.v),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 3),
                                                  child: Text("₹${post.budget}",
                                                      style: CustomTextStyles
                                                          .labelLargeGray400))
                                            ]),
                                        CustomElevatedButton(
                                            width: 97.h,
                                            text: "Extend",
                                            margin: EdgeInsets.only(
                                                top: 9.v, bottom: 11.v),
                                            buttonStyle:
                                                CustomButtonStyles.fillGray,
                                            buttonTextStyle: CustomTextStyles
                                                .labelLargeInterBlack900)
                                      ])
                                ])),
                        SizedBox(height: 24.v),
                        Padding(
                            padding: EdgeInsets.only(right: 2.h),
                            child: CustomTextFormField(
                                controller: model.frameEighteenController,
                                hintText: "caption")),
                        SizedBox(height: 16.v),
                        Padding(
                            padding: EdgeInsets.only(right: 2.h),
                            child: CustomTextFormField(
                                controller: model.frameNineteenController,
                                hintText: "discription",
                                textInputAction: TextInputAction.done,
                                maxLines: 4,
                                contentPadding: EdgeInsets.all(8))),
                        // SizedBox(height: 19.v),
                        // Padding(
                        //     padding: EdgeInsets.only(right: 1.v),
                        //     child: Container(
                        //       child: Text("Edit More",
                        //           style: theme.textTheme.labelLarge!.copyWith(
                        //               decoration: TextDecoration.underline)),
                        //     )
                        //     // Text("Edit More",
                        //     //     style: theme.textTheme.labelLarge!.copyWith(
                        //     //         decoration: TextDecoration.underline))
                        //     ),
                        SizedBox(height: 5.v)
                      ]),
                ),
              ),
              bottomNavigationBar: CustomElevatedButton(
                  onPressed: () {
                    model.update(post);
                  },
                  buttonStyle: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black)),
                  buttonTextStyle: TextStyle(fontSize: 20, color: Colors.white),
                  text: "Update Changes",
                  margin: EdgeInsets.only(left: 15, right: 16, bottom: 32))));
    });
  }

  /// Section Widget

  /// Navigates to the editTabContainerScreen when the action is triggered.
  onTapTxtEditMore(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.editTabContainerScreen);
  }
}
