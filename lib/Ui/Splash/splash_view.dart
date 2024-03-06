import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:posthub/Ui/Splash/splash_viewmodel.dart';
import 'package:posthub/core/app_export.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/custom_image_view.dart';
class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<SplashViewModel>.reactive(

        viewModelBuilder: ()=>SplashViewModel(),
        onViewModelReady: (model){
          model.startTimer();
        },
        builder:( context,model,child){
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: SvgPicture.asset(
                  "assets/images/img_group_2.svg",

                  height: 51.v,
                  width: 161.h,
                  fit: BoxFit.fill,)


              ),
            ),
          );
        });
  }
}


