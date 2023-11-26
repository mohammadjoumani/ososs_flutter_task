import 'package:flutter/material.dart';

import 'font_manager.dart';

abstract class Styles {
  static TextStyle _getTextStyle(
      double fontSize, FontWeight fontWeight, color) {
    return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  static TextStyle getRegularStyle(
      {double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.regular, color);
  }

  static TextStyle getMediumStyle(
      {double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.medium, color);
  }

  static TextStyle getLightStyle(
      {double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.light, color);
  }

  static TextStyle getBoldStyle(
      {double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.bold, color);
  }

  static TextStyle getSemiBoldStyle(
      {double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
  }
}
