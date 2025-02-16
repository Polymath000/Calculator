import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

addToValueList(
  List value,
  String text,
  List result,
) {
  if (value.isEmpty) {
    value.add(text);
  } else {
    if (value.last != "%") {
      value.add(text);
    }
  }
  equalOperartor(value, result);
}

class OperationProvider extends ChangeNotifier {
  bool equlClickled = false;

  List value = [];
  List result = [""];
  
  void clearAll() {
    value.clear();
    result.clear();
    result.add("");
    notifyListeners();
  }

  changeOperationField({required IconData icon}) {
    equlClickled = false;
    result.isNotEmpty ? result.clear() : "";
    bool checkOperator = value.isEmpty
        ? icon == FontAwesomeIcons.minus // Allow minus if list is empty
        : (icon == FontAwesomeIcons.minus
            ? value.last != '.' &&
                value.last != 'x' &&
                value.last != '-' &&
                value.last != '+' &&
                value.last != '/'
            : value.isNotEmpty &&
                value.last != '.' &&
                value.last != 'x' &&
                value.last != '-' &&
                value.last != '+' &&
                value.last != '/');
    if (icon == FontAwesomeIcons.c) {
      value.clear();
    } else if (icon == FontAwesomeIcons.percent) {
      if (value.isNotEmpty) {
        if (!(value.last == '+' ||
            value.last == "-" ||
            value.last == "x" ||
            value.last == "/")) {
          value.add('%');
        }
      }
    } else if (icon == FontAwesomeIcons.deleteLeft) {
      value.isEmpty ? "" : value.removeLast();
      equalOperartor(value, result);
    } else if (icon == FontAwesomeIcons.divide) {
      if (checkOperator) {
        value.add('/');
      }
    } else if (icon == FontAwesomeIcons.seven) {
      addToValueList(
        value,
        "7",
        result,
      );
    } else if (icon == FontAwesomeIcons.eight) {
      addToValueList(
        value,
        "8",
        result,
      );
    } else if (icon == FontAwesomeIcons.nine) {
      addToValueList(
        value,
        "9",
        result,
      );
    } else if (icon == FontAwesomeIcons.xmark) {
      if (checkOperator) {
        value.add('x');
      }
    } else if (icon == FontAwesomeIcons.four) {
      addToValueList(
        value,
        "4",
        result,
      );
    } else if (icon == FontAwesomeIcons.five) {
      addToValueList(
        value,
        "5",
        result,
      );
    } else if (icon == FontAwesomeIcons.six) {
      addToValueList(
        value,
        "6",
        result,
      );
    } else if (icon == FontAwesomeIcons.minus) {
      if (checkOperator) {
        value.add('-');
      }
    } else if (icon == FontAwesomeIcons.one) {
      addToValueList(
        value,
        "1",
        result,
      );
    } else if (icon == FontAwesomeIcons.two) {
      addToValueList(
        value,
        "2",
        result,
      );
    } else if (icon == FontAwesomeIcons.three) {
      addToValueList(
        value,
        "3",
        result,
      );
    } else if (icon == FontAwesomeIcons.plus) {
      if (checkOperator) {
        value.add('+');
      }
    } else if (icon == FontAwesomeIcons.zero) {
      addToValueList(value, "0", result);
    } else if (icon == Icons.circle) {
      bool test = true;
      for (int i = value.length - 1; i >= 0; i--) {
        if (value[i] == '.') {
          test = false;
          break;
        } else if (value[i] == "+" ||
            value[i] == "/" ||
            value[i] == "x" ||
            value[i] == "-") {
          break;
        }
      }
      if (test) {
        if (value.last != "%" && value.last != ".") {
          if (value.length >= 3) {
            if (value[value.length - 2] != '.') {
              value.add('.');
            }
          } else {
            value.add('.');
          }
        }
        equalOperartor(value, result);
      }
    } else if (icon == FontAwesomeIcons.equals) {
      equlClickled = true;
      equalOperartor(value, result);
      if (!(result.join() == value.join()) && !(result.join() == "Not Valid")) {
        value.clear();
        for (dynamic str in result) {
          value.addAll(str.toString().split(''));
        }
        result.clear();
        result.add("");
      }
    }
    notifyListeners();
  }
}

void equalOperartor(List value, List result) {
  if (value.isNotEmpty) {
    if (value.last == "-" ||
        value.last == "+" ||
        value.last == "x" ||
        value.last == "/") {
      result.add("Not Valid");
    } else {
      for (int i = 0; i < value.length; i++) {
        if ((value[i] == "/" ||
            value[i] == "x" ||
            value[i] == "-" ||
            value[i] == "+")) {
          if (i == 0) {
            result.add(value[i]);
          } else {
            result.add(value[i]);
            result.add('');
          }
        } else if (value[i] == "%") {
          result.add(value[i]);
        } else {
          if (result.isEmpty) {
            result.add(value[i]);
          } else {
            result.last += value[i];
          }
        }
      }
      operationMultiAndDivide(result);
      operationPlusAndMinus(result);
    }
  }
}

operationMultiAndDivide(List result) {
  for (int i = 1; i < result.length;) {
    if (result[i] == "%") {
      result[i] = result[i - 1] is String
          ? (double.parse(result[i - 1]) / 100)
          : result[i - 1] / 100;
      result.removeAt(i - 1);
      i++;
    } else {
      if (result[i] == "/") {
        var leftOperand = result[i - 1] is String
            ? double.parse(result[i - 1])
            : result[i - 1];
        var rightOperand = result[i + 1] is String
            ? double.parse(result[i + 1])
            : result[i + 1];
        if (rightOperand == 0) {
          result.add("Not Valid");
        } else {
          if (leftOperand == '-') {
            rightOperand *= -1;
          } else {
            result[i + 1] = leftOperand / rightOperand;
            result.removeAt(i);
          }
        }
        result.removeAt(i - 1);
      } else if (result[i] == "x") {
        var leftOperand = result[i - 1] is String
            ? double.parse(result[i - 1])
            : result[i - 1];
        var rightOperand = result[i + 1] is String
            ? double.parse(result[i + 1])
            : result[i + 1];
        if (leftOperand == '-') {
          rightOperand *= -1;
        } else {
          result[i + 1] = leftOperand * rightOperand;
          result.removeAt(i);
        }
        result.removeAt(i - 1);
      } else {
        i++;
      }
    }
  }
}

operationPlusAndMinus(List result) {
  for (int i = 1; result.length != 1;) {
    if (result[i] == "+") {
      var leftOperand =
          result[i - 1] is String ? double.parse(result[i - 1]) : result[i - 1];
      var rightOperand =
          result[i + 1] is String ? double.parse(result[i + 1]) : result[i + 1];
      if (leftOperand == '-') {
        rightOperand *= -1;
      } else {
        result[i + 1] = leftOperand + rightOperand;
        result.removeAt(i);
      }

      result.removeAt(i - 1);
    } else if (result[i] == "-") {
      var leftOperand =
          result[i - 1] is String ? double.parse(result[i - 1]) : result[i - 1];
      var rightOperand =
          result[i + 1] is String ? double.parse(result[i + 1]) : result[i + 1];
      if (leftOperand == '-') {
        rightOperand *= -1;
      } else {
        result[i + 1] = leftOperand - rightOperand;
        result.removeAt(i);
      }
      result.removeAt(i - 1);
    }
  }
}
