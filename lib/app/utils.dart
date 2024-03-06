import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
const num FIGMA_DESIGN_WIDTH = 360;
const num FIGMA_DESIGN_HEIGHT = 800;
const num FIGMA_DESIGN_STATUS_BAR = 0;
typedef ResponsiveBuild = Widget Function(
    BuildContext context,
    Orientation orientation,
    DeviceType deviceType,
    );

class Sizer extends StatelessWidget {
  const Sizer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  /// Builds the widget whenever the orientation changes.
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

class SizeUtils {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late DeviceType deviceType;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  static void setScreenSize(
      BoxConstraints constraints,
      Orientation currentOrientation,
      ) {
    // Sets boxConstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Sets screen width and height
    if (orientation == Orientation.portrait) {
      width =
          boxConstraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = boxConstraints.maxHeight.isNonZero();
    } else {
      width =
          boxConstraints.maxHeight.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = boxConstraints.maxWidth.isNonZero();
    }
    deviceType = DeviceType.mobile;
  }
}

/// This extension is used to set padding/margin (for the top and bottom side) &
/// height of the screen or widget according to the Viewport height.
extension ResponsiveExtension on num {
  /// This method is used to get device viewport width.
  double get _width => SizeUtils.width;

  /// This method is used to get device viewport height.
  double get _height => SizeUtils.height;

  /// This method is used to set padding/margin (for the left and Right side) &
  /// width of the screen or widget according to the Viewport width.
  double get h => ((this * _width) / FIGMA_DESIGN_WIDTH);

  /// This method is used to set padding/margin (for the top and bottom side) &
  /// height of the screen or widget according to the Viewport height.
  double get v =>
      (this * _height) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR);

  /// This method is used to set smallest px in image height and width
  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  /// This method is used to set text font size according to Viewport
  double get fSize => adaptSize;
}

extension FormatExtension on double {
  /// Return a [double] value with formatted according to provided fractionDigits
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}

enum DeviceType { mobile, tablet, desktop }

String getDeviceType() {
  String deviceType = '';
  if (Platform.isAndroid) {
    deviceType = '1';
  } else if (Platform.isIOS) {
    deviceType = '2';
  }
  return deviceType;
}

NavigationService get navigationService => locator<NavigationService>();
DialogService get dialogService => locator<DialogService>();
BottomSheetService get sheetService => locator<BottomSheetService>();

void dismissKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

String removeZero(double? value) {
  if (value == null) return "0";
  RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
  return value.toString().replaceAll(regex, "");
}

String getRandomString(int length) {
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();

  return String.fromCharCodes(
    Iterable.generate(
      length,
          (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ),
  );
}

String secToTime(int sec) {
  String time = Duration(seconds: sec).toString();
  return time.substring(time.indexOf(':') + 1, time.lastIndexOf('.'));
}

bool isAdult(DateTime dob) {
  DateTime adultDate = DateTime(dob.year + 21, dob.month, dob.day);
  return adultDate.isBefore(DateTime.now());
}

String listToString(List<String?> list) {
  String s = "";
  for (var i = 0; i < list.length; i++) {
    if (list[i] != null) {
      if (i < list.length - 1) {
        s += '${list[i]!}, ';
      } else {
        s += list[i]!;
      }
    }
  }
  return s;
}