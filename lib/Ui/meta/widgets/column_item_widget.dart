import 'package:flutter/material.dart';
import 'package:posthub/core/app_export.dart';

// ignore: must_be_immutable
class ColumnItemWidget extends StatelessWidget {
  const ColumnItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: AppDecoration.fillGray20001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Container(
          height: 120.v,
          width: 96.h,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 33.v,
          ),
          decoration: AppDecoration.fillPrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "+",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text(
                    "New",
                    style: CustomTextStyles.titleMediumGray50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
