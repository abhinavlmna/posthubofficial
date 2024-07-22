// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:posthub/app/size_utils.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

import '../../app/image_constant.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  int sliderIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (model) {
        model.init();
        model.fetchDataFromFirebase();
      },
      onDispose: (model) {},
      builder: (context, viewModel, child) {
        return SafeArea(
            child: Scaffold(
                body: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 28),
                    decoration: AppDecoration.fillGray,
                    child: SingleChildScrollView(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 9),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/img_group_2.svg",
                                          height: 33,
                                          width: 104,
                                          fit: BoxFit.fill,
                                        ),
                                        Spacer(),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, bottom: 3),
                                            child: Column(children: [
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Hello",
                                                      style: theme.textTheme
                                                          .labelLarge)),
                                              Text("${viewModel.name}",
                                                  style: theme
                                                      .textTheme.labelLarge)
                                            ])),
                                        // CircleAvatar(
                                        //   radius: 40.adaptSize,
                                        //   backgroundImage: NetworkImage('${viewModel.photoURL}'
                                        //
                                        //   ),
                                        // )
                                        CustomImageView(
                                            imagePath: "${viewModel.photoURL}",
                                            height: 40.adaptSize,
                                            width: 40.adaptSize,
                                            radius: BorderRadius.circular(20),
                                            margin: EdgeInsets.only(
                                                left: 15, top: 2)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: IconButton(
                                              onPressed: () {
                                                viewModel.logout();
                                              },
                                              icon: Icon(
                                                Icons
                                                    .power_settings_new_outlined,
                                                color: Colors.red,
                                              )),
                                        )
                                      ])),
                              SizedBox(height: 32),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Text("Quick Access",
                                          style: theme.textTheme.titleMedium))),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      viewModel.Addpage();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration:
                                          AppDecoration.fillGray20001.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder10,
                                      ),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        margin: EdgeInsets.all(0),
                                        color: theme.colorScheme.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder10,
                                        ),
                                        child: Container(
                                          height: 130,
                                          width: 96,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 30,
                                            vertical: 33,
                                          ),
                                          decoration: AppDecoration.fillPrimary
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10,
                                          ),
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Align(
                                                alignment: Alignment.topCenter,
                                                child: Text(
                                                  "+",
                                                  style: theme
                                                      .textTheme.titleLarge,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 1),
                                                  child: Text(
                                                    "New",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 200, child: Text('nodata')
                                        //  CarouselSlider.builder(
                                        //     options: CarouselOptions(
                                        //         aspectRatio: 16 / 16,
                                        //         height: 200,
                                        //         initialPage: 0,
                                        //         autoPlay: true,
                                        //         viewportFraction: 1.0,
                                        //         enableInfiniteScroll: true,
                                        //         scrollDirection: Axis.horizontal,
                                        //         onPageChanged: (index, reason) {
                                        //           sliderIndex = index;
                                        //         }),
                                        //     itemCount:
                                        //         viewModel.postlist.length ?? 2,
                                        //     itemBuilder:
                                        //         (context, index, realIndex) {
                                        //       return viewModel.postlist.length ==
                                        //               0
                                        //           ? Container(
                                        //               height: 200,
                                        //               decoration: BoxDecoration(
                                        //                   borderRadius:
                                        //                       BorderRadius.all(
                                        //                           Radius.circular(
                                        //                               20)),
                                        //                   color: Colors.blueGrey),
                                        //               child: Center(
                                        //                   child: SvgPicture.asset(
                                        //                 "assets/images/img_group_2.svg",
                                        //                 height: 51.v,
                                        //                 width: 100.h,
                                        //                 fit: BoxFit.fill,
                                        //               )),
                                        //             )
                                        //           : Padding(
                                        //               padding:
                                        //                   EdgeInsets.all(8.0),
                                        //               child: Container(
                                        //                 height: 200,
                                        //                 decoration: BoxDecoration(
                                        //                     borderRadius:
                                        //                         BorderRadius.all(
                                        //                             Radius
                                        //                                 .circular(
                                        //                                     20)),
                                        //                     image: DecorationImage(
                                        //                         image: NetworkImage(
                                        //                             "${viewModel.postlist[index].url}"))),
                                        //               ),
                                        //             );
                                        //     }),
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 2, bottom: 3),
                                            child: Text(
                                                "${sliderIndex + 1}/${viewModel.postlist.length} Campaigns",
                                                style: theme
                                                    .textTheme.labelLarge)),
                                        Container(
                                            height: 24,
                                            margin: EdgeInsets.only(left: 59),
                                            child: AnimatedSmoothIndicator(
                                                activeIndex: sliderIndex,
                                                count:
                                                    viewModel.postlist.length,
                                                effect: ScrollingDotsEffect(
                                                    spacing: 8,
                                                    activeDotColor: theme
                                                        .colorScheme.primary,
                                                    dotColor: theme.colorScheme
                                                        .secondaryContainer,
                                                    dotHeight: 8,
                                                    dotWidth: 8)))
                                      ])),
                              SizedBox(height: 37),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Text("My Ads.",
                                          style: theme.textTheme.titleMedium))),
                              Container(
                                // height: 728,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: viewModel.postlist.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        viewModel.Detailspage(
                                            viewModel.postlist[index]);
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: Container(
                                          height: 364,
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 336,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      20,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${viewModel.postlist[index].url}"),
                                                        fit: BoxFit.fill,
                                                      ))),
                                              SizedBox(height: 8),
                                              Container(
                                                height: 20,
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                              height:
                                                                  16.adaptSize,
                                                              width:
                                                                  16.adaptSize,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          2),
                                                              decoration: BoxDecoration(
                                                                  color: viewModel
                                                                          .postlist[
                                                                              index]
                                                                          .rejected
                                                                      ? appTheme
                                                                          .redA700
                                                                      : appTheme
                                                                          .blueGray10001,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8))),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 8),
                                                              child: viewModel
                                                                          .postlist[
                                                                              index]
                                                                          .rejected ==
                                                                      false
                                                                  ? RichText(
                                                                      text: TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                                text: "Admin Rejected the post ",
                                                                                style: CustomTextStyles.labelLargeff161616),
                                                                            TextSpan(
                                                                                text: "Why?",
                                                                                style: CustomTextStyles.labelLargeff161616Bold.copyWith(decoration: TextDecoration.underline))
                                                                          ]),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left)
                                                                  : RichText(
                                                                      text: TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                                text: "Admin Approved the post ",
                                                                                style: CustomTextStyles.labelLargeff161616),
                                                                            TextSpan(
                                                                                text: "Tap to view",
                                                                                style: CustomTextStyles.labelLargeff161616Bold.copyWith(decoration: TextDecoration.underline))
                                                                          ]),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left)),
                                                          Spacer(),
                                                          InkWell(
                                                            onTap: () {
                                                              viewModel.deleteItem(
                                                                  "${viewModel.postlist[index].id}",
                                                                  index);
                                                            },
                                                            child: Text(
                                                                "Remove",
                                                                style: CustomTextStyles
                                                                    .labelLargeBold
                                                                    .copyWith(
                                                                        decoration:
                                                                            TextDecoration.underline)),
                                                          )
                                                        ])),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ]))))));
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  /// Section Widget

  /// Navigates to the advDetailsOneScreen when the action is triggered.
  onTapImgImage(BuildContext context) {
    // Navigator.pushNamed(context, Route);
  }
}
