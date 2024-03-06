import 'package:flutter/material.dart';
import 'package:posthub/Ui/google/google_view.dart';
import 'package:posthub/Ui/home/home_view.dart';
import 'package:posthub/Ui/meta/meta_view.dart';
import 'package:posthub/app/size_utils.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.router.dart';
import '../../app/image_constant.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import 'dashboardviewmodel.dart';

class DashBoardView extends StatelessWidget {
  DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<DashBoardViewModel>.reactive(

        viewModelBuilder: ()=>DashBoardViewModel(),
        onViewModelReady: (model){

        },
        builder:( context,model,child){
          return SafeArea(
              child: Scaffold(
                  body: Navigator(
                      key:model.navigatorKey,
                      initialRoute: Routes.homeView,
                      onGenerateRoute: (routeSetting) => PageRouteBuilder(
                          pageBuilder: (ctx, ani, ani1) =>
                              getCurrentPage(routeSetting.name!),
                          transitionDuration: Duration(seconds: 0))),
                  bottomNavigationBar: _buildBottomBar(context,model)));
        });
  }
  /// Section Widget
  Widget _buildBottomBar(BuildContext context, DashBoardViewModel model) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(model.navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Icroundhome:
        return Routes.homeView;
      case BottomBarEnum.Vector:
        return Routes.googleView;
      case BottomBarEnum.Vectorblack900:
        return Routes.metaView;

        // TODO: Handle this case.
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case Routes.homeView:
        return HomeView();
      case Routes.metaView:
        return MetaView();
      case Routes.googleView:
        return GoogleView();
      default:
        return DefaultWidget();
    }
  }
}


