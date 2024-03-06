import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                      margin: EdgeInsets.only(left: 16, top: 8, bottom: 8)),
                  centerTitle: true,
                  title: AppbarTitle(text: "Advertisement  Status")),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 1),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            decoration: AppDecoration.fillBlueGray.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder24),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 10),
                                  Container(
                                      height: 336,
                                      width: MediaQuery.of(context).size.width-20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "${post.url}"),


                                            fit: BoxFit.fill,
                                          )
                                      )
                                  ),
                                  SizedBox(height: 5),
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
                                                Opacity(opacity: .5, child:SvgPicture.asset(
                                                  color: Colors.black,
                                                  "assets/images/img_bi_eye_fill.svg",
                                                    height: 16.adaptSize,
                                                    width: 16.adaptSize,
                                                    ),),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 3),
                                                    child: Text(
                                                        "${post.totalviews}",
                                                        style: CustomTextStyles
                                                            .labelLargeGray400))
                                              ]),
                                              SizedBox(height: 5),
                                              SizedBox(
                                                  width: 41,
                                                  child: Row(

                                                      children: [
                                                       Opacity(opacity: .5,
                                                       child: Icon(Icons.currency_rupee,size: 12,)),
                                                        Text(
                                                            "${post.moneyspent}",
                                                            style: CustomTextStyles
                                                                .labelLargeGray400)
                                                      ])),
                                              SizedBox(height: 1),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 3),
                                                  child: Text("₹${post.budget}",
                                                      style: CustomTextStyles
                                                          .labelLargeGray400))
                                            ]),
                                        CustomElevatedButton(
                                            width: 97,
                                            text: "Extend",
                                            margin: EdgeInsets.only(
                                                top: 9, bottom: 11),
                                            buttonStyle:
                                                CustomButtonStyles.fillGray,
                                            buttonTextStyle: CustomTextStyles
                                                .labelLargeInterBlack900)
                                      ])
                                ])),
                        SizedBox(height: 24),
                        Padding(
                            padding: EdgeInsets.only(right: 2),
                            child: CustomTextFormField(
                                controller: model.frameEighteenController,
                                hintText: "caption")),
                        SizedBox(height: 16),
                        Padding(
                            padding: EdgeInsets.only(right: 2),
                            child: CustomTextFormField(
                                controller: model.frameNineteenController,
                                hintText: "discription",
                                textInputAction: TextInputAction.done,
                                maxLines: 4,
                                contentPadding: EdgeInsets.all(8))),
                        SizedBox(height: 19),
                        GestureDetector(
                            onTap: () {
                              onTapTxtEditMore(context);
                            },
                            child: Padding(
                                padding: EdgeInsets.only(right: 1),
                                child: Container(
                                  height: 24,
                                )
                                // Text("Edit More",
                                //     style: theme.textTheme.labelLarge!.copyWith(
                                //         decoration: TextDecoration.underline))
                                )),
                        SizedBox(height: 5)
                      ]),
                ),
              ),
              bottomNavigationBar: CustomElevatedButton(
                  onPressed: () {
                    model.update(post);
                  },
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
