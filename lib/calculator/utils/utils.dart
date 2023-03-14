import 'dart:ui';

import 'package:calculator/calculator/model/calculator_button_data.dart';
import 'package:flutter/material.dart';

Color getTextColorByButtonType(ButtonType type) {
  Color color = Colors.black;
  switch (type) {
    case ButtonType.addition:
      color = Colors.green;
      break;

    case ButtonType.number:
      // TODO: Handle this case.
      break;
    case ButtonType.clear:
      color = Colors.red;
      break;
    case ButtonType.bracket:
      color = Colors.green;
      break;
    case ButtonType.percentage:
      color = Colors.green;
      break;
    case ButtonType.division:
      color = Colors.green;
      break;
    case ButtonType.multiplication:
      color = Colors.green;
      break;
    case ButtonType.subtraction:
      color = Colors.green;
      break;
    case ButtonType.decimal:
      // TODO: Handle this case.
      break;
    case ButtonType.negative:
      // TODO: Handle this case.
      break;
    case ButtonType.equalTo:
      color = Colors.white;
      break;
  }

  return color;
}

Color getBgColorByButtonType(ButtonType type) {
  Color color = Color(0xffF7F7F7);
  switch (type) {
    case ButtonType.addition:
      break;

    case ButtonType.number:
      // TODO: Handle this case.
      break;
    case ButtonType.clear:
      break;
    case ButtonType.bracket:
      break;
    case ButtonType.percentage:
      break;
    case ButtonType.division:
      break;
    case ButtonType.multiplication:
      break;
    case ButtonType.subtraction:
      break;
    case ButtonType.decimal:
      // TODO: Handle this case.
      break;
    case ButtonType.negative:
      // TODO: Handle this case.
      break;
    case ButtonType.equalTo:
      color = Colors.green;
      break;
  }

  return color;
}
