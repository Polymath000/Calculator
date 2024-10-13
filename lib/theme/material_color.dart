import 'package:calculater/provider/mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

Color getColor(context, IconData icon) {
  if (Provider.of<ModeProvider>(context).isChange) {
    if (icon == FontAwesomeIcons.c ||
        icon == FontAwesomeIcons.percent ||
        icon == FontAwesomeIcons.deleteLeft) {
      return const Color(0xff4e505f);
    } else if (icon == FontAwesomeIcons.divide ||
        icon == FontAwesomeIcons.xmark ||
        icon == FontAwesomeIcons.minus ||
        icon == FontAwesomeIcons.plus ||
        icon == FontAwesomeIcons.equals) {
      return const Color(0xff4b5efc);
    } else {
      return const Color(0xff2e2f38);
    }
  } else {
    if (icon == FontAwesomeIcons.c ||
        icon == FontAwesomeIcons.percent ||
        icon == FontAwesomeIcons.deleteLeft) {
      return const Color(0xffd2d3da);
    } else if (icon == FontAwesomeIcons.divide ||
        icon == FontAwesomeIcons.xmark ||
        icon == FontAwesomeIcons.minus ||
        icon == FontAwesomeIcons.plus ||
        icon == FontAwesomeIcons.equals) {
      return const Color(0xff4b5efc);
    } else {
      return Colors.white;
    }
  }
}
