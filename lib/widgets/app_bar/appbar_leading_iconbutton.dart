import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:posthub/core/app_export.dart';
import 'package:posthub/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class AppbarLeadingIconbutton extends StatelessWidget {
  AppbarLeadingIconbutton({
    Key? key,
    this.imagePath,
    this.icondata,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;
  Icon? icondata;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 20.adaptSize,
          width: 25.adaptSize,
          child: CustomImageView(
            imagePath: ImageConstant.imgIcon2,
          ),
        ),
      ),
    );
  }
}
