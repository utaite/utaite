import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UI {
  static const double elevation = 2;

  static const double collapsedAppBarHeight = kToolbarHeight;
  static const double expandedAppBarHeight = collapsedAppBarHeight * 4;

  static const double iconSize = 24;

  static const double paddingTripleValue = 48;
  static const double paddingDoubleValue = 32;
  static const double paddingValue = 16;
  static const double paddingMediumValue = 8;
  static const double paddingSmallValue = 4;
  static const double paddingExtraSmallValue = 2;

  static const EdgeInsets paddingTriple = EdgeInsets.all(paddingTripleValue);
  static const EdgeInsets paddingDouble = EdgeInsets.all(paddingDoubleValue);
  static const EdgeInsets padding = EdgeInsets.all(paddingValue);
  static const EdgeInsets paddingMedium = EdgeInsets.all(paddingMediumValue);
  static const EdgeInsets paddingSmall = EdgeInsets.all(paddingSmallValue);
  static const EdgeInsets paddingExtraSmall = EdgeInsets.all(paddingExtraSmallValue);

  static const EdgeInsets paddingTripleVertical = EdgeInsets.symmetric(vertical: paddingTripleValue);
  static const EdgeInsets paddingDoubleVertical = EdgeInsets.symmetric(vertical: paddingDoubleValue);
  static const EdgeInsets paddingVertical = EdgeInsets.symmetric(vertical: paddingValue);
  static const EdgeInsets paddingMediumVertical = EdgeInsets.symmetric(vertical: paddingMediumValue);
  static const EdgeInsets paddingSmallVertical = EdgeInsets.symmetric(vertical: paddingSmallValue);
  static const EdgeInsets paddingExtraSmallVertical = EdgeInsets.symmetric(vertical: paddingExtraSmallValue);

  static const EdgeInsets paddingTripleHorizontal = EdgeInsets.symmetric(horizontal: paddingTripleValue);
  static const EdgeInsets paddingDoubleHorizontal = EdgeInsets.symmetric(horizontal: paddingDoubleValue);
  static const EdgeInsets paddingHorizontal = EdgeInsets.symmetric(horizontal: paddingValue);
  static const EdgeInsets paddingMediumHorizontal = EdgeInsets.symmetric(horizontal: paddingMediumValue);
  static const EdgeInsets paddingSmallHorizontal = EdgeInsets.symmetric(horizontal: paddingSmallValue);
  static const EdgeInsets paddingExtraSmallHorizontal = EdgeInsets.symmetric(horizontal: paddingExtraSmallValue);

  static const EdgeInsets paddingTripleLeft = EdgeInsets.only(left: paddingTripleValue);
  static const EdgeInsets paddingDoubleLeft = EdgeInsets.only(left: paddingDoubleValue);
  static const EdgeInsets paddingLeft = EdgeInsets.only(left: paddingValue);
  static const EdgeInsets paddingMediumLeft = EdgeInsets.only(left: paddingMediumValue);
  static const EdgeInsets paddingSmallLeft = EdgeInsets.only(left: paddingSmallValue);
  static const EdgeInsets paddingExtraSmallLeft = EdgeInsets.only(left: paddingExtraSmallValue);

  static const EdgeInsets paddingTripleTop = EdgeInsets.only(top: paddingTripleValue);
  static const EdgeInsets paddingDoubleTop = EdgeInsets.only(top: paddingDoubleValue);
  static const EdgeInsets paddingTop = EdgeInsets.only(top: paddingValue);
  static const EdgeInsets paddingMediumTop = EdgeInsets.only(top: paddingMediumValue);
  static const EdgeInsets paddingSmallTop = EdgeInsets.only(top: paddingSmallValue);
  static const EdgeInsets paddingExtraSmallTop = EdgeInsets.only(top: paddingExtraSmallValue);

  static const EdgeInsets paddingTripleRight = EdgeInsets.only(right: paddingTripleValue);
  static const EdgeInsets paddingDoubleRight = EdgeInsets.only(right: paddingDoubleValue);
  static const EdgeInsets paddingRight = EdgeInsets.only(right: paddingValue);
  static const EdgeInsets paddingMediumRight = EdgeInsets.only(right: paddingMediumValue);
  static const EdgeInsets paddingSmallRight = EdgeInsets.only(right: paddingSmallValue);
  static const EdgeInsets paddingExtraSmallRight = EdgeInsets.only(right: paddingExtraSmallValue);

  static const EdgeInsets paddingTripleBottom = EdgeInsets.only(bottom: paddingTripleValue);
  static const EdgeInsets paddingDoubleBottom = EdgeInsets.only(bottom: paddingDoubleValue);
  static const EdgeInsets paddingBottom = EdgeInsets.only(bottom: paddingValue);
  static const EdgeInsets paddingMediumBottom = EdgeInsets.only(bottom: paddingMediumValue);
  static const EdgeInsets paddingSmallBottom = EdgeInsets.only(bottom: paddingSmallValue);
  static const EdgeInsets paddingExtraSmallBottom = EdgeInsets.only(bottom: paddingExtraSmallValue);

  static const Widget empty = SizedBox();

  static const Widget paddingHeightTripleSizedBox = SizedBox(height: paddingTripleValue);
  static const Widget paddingHeightDoubleSizedBox = SizedBox(height: paddingDoubleValue);
  static const Widget paddingHeightSizedBox = SizedBox(height: paddingValue);
  static const Widget paddingHeightMediumSizedBox = SizedBox(height: paddingMediumValue);
  static const Widget paddingHeightSmallSizedBox = SizedBox(height: paddingSmallValue);
  static const Widget paddingHeightExtraSmallSizedBox = SizedBox(height: paddingExtraSmallValue);

  static const Widget paddingWidthTripleSizedBox = SizedBox(width: paddingTripleValue);
  static const Widget paddingWidthDoubleSizedBox = SizedBox(width: paddingDoubleValue);
  static const Widget paddingWidthSizedBox = SizedBox(width: paddingValue);
  static const Widget paddingWidthMediumSizedBox = SizedBox(width: paddingMediumValue);
  static const Widget paddingWidthSmallSizedBox = SizedBox(width: paddingSmallValue);
  static const Widget paddingWidthExtraSmallSizedBox = SizedBox(width: paddingExtraSmallValue);

  static const Radius radius = Radius.circular(24);
  static const Radius radiusSmall = Radius.circular(12);

  static const BorderRadius borderRadius = BorderRadius.all(radius);
  static const BorderRadius borderRadiusSmall = BorderRadius.all(radiusSmall);
  static const BorderRadius borderRadiusCircle = BorderRadius.all(Radius.circular(6888));
  static const BorderRadius borderRadiusTop = BorderRadius.vertical(top: radius);

  static const CircleBorder circle = CircleBorder();
  static const RoundedRectangleBorder rounded = RoundedRectangleBorder(borderRadius: borderRadius);
  static const RoundedRectangleBorder roundedSmall = RoundedRectangleBorder(borderRadius: borderRadiusSmall);

  static const Duration duration = Duration(milliseconds: 300);
  static const Duration immediately = Duration(milliseconds: 0);
}
