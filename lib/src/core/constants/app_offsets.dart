import 'package:drift_flutter/src/core/constants/size.dart';
import 'package:flutter/material.dart';

class AppOffsets {
  static late BoxConstraints formWidthConstraint;
  static late BoxConstraints messageWidthConstaint;
  static late EdgeInsets screenPadding;

  static void init(BuildContext context) {
    formWidthConstraint = const BoxConstraints(maxWidth: 500);
    messageWidthConstaint = BoxConstraints(
      maxWidth: SizeConfig.safeBlockHorizontal * 80 > 600
          ? 600
          : SizeConfig.safeBlockHorizontal * 80,
    );
    screenPadding = EdgeInsets.symmetric(
      vertical: SizeConfig.safeBlockVertical * 2,
      horizontal: SizeConfig.safeBlockHorizontal * 5,
    );
  }
}
