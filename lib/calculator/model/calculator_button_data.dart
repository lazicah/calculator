import 'package:flutter/material.dart';

typedef OnButtonPressed = String Function();

class CalculatorButton {
  CalculatorButton({
    required this.sybmol,
    required this.buttonType,
    this.value,
    this.description,
  });
  final Widget sybmol;
  final ButtonType buttonType;
  String? value;
  String? description;
}

final buttons = [
  CalculatorButton(sybmol: Text('C'), buttonType: ButtonType.clear),
  CalculatorButton(sybmol: Text('( )'), buttonType: ButtonType.bracket),
  CalculatorButton(sybmol: Text('%'), buttonType: ButtonType.percentage),
  CalculatorButton(sybmol: Text('/'), buttonType: ButtonType.division),
  CalculatorButton(
      sybmol: Text('7'), buttonType: ButtonType.number, value: '7'),
  CalculatorButton(
      sybmol: Text('8'), buttonType: ButtonType.number, value: '8'),
  CalculatorButton(
      sybmol: Text('9'), buttonType: ButtonType.number, value: '9'),
  CalculatorButton(sybmol: Text('X'), buttonType: ButtonType.multiplication),
  CalculatorButton(
      sybmol: Text('4'), buttonType: ButtonType.number, value: '4'),
  CalculatorButton(
      sybmol: Text('5'), buttonType: ButtonType.number, value: '5'),
  CalculatorButton(
      sybmol: Text('6'), buttonType: ButtonType.number, value: '6'),
  CalculatorButton(sybmol: Text('-'), buttonType: ButtonType.subtraction),
  CalculatorButton(
      sybmol: Text('1'), buttonType: ButtonType.number, value: '1'),
  CalculatorButton(
      sybmol: Text('2'), buttonType: ButtonType.number, value: '2'),
  CalculatorButton(
      sybmol: Text('3'), buttonType: ButtonType.number, value: '3'),
  CalculatorButton(sybmol: Text('+'), buttonType: ButtonType.addition),
  CalculatorButton(sybmol: Text('+/-'), buttonType: ButtonType.negative),
  CalculatorButton(sybmol: Text('.'), buttonType: ButtonType.decimal),
  CalculatorButton(
      sybmol: Text('0'), buttonType: ButtonType.number, value: '0'),
  CalculatorButton(sybmol: Text('='), buttonType: ButtonType.equalTo),
];

enum ButtonType {
  number,
  clear,
  bracket,
  percentage,
  division,
  multiplication,
  subtraction,
  addition,
  decimal,
  negative,
  equalTo,
}
