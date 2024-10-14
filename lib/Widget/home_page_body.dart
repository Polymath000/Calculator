import 'package:calculater/Widget/custom_buttom.dart';
import 'package:calculater/Widget/dark_light_mode.dart';
import 'package:calculater/Widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      // alignment: Alignment.bottomCenter,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const DarkLightMode(),
            InputTextField(
            ),
            OutputTextField(
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtom(
                  icon: FontAwesomeIcons.c,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.percent,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.deleteLeft,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.divide,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtom(
                  icon: FontAwesomeIcons.seven,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.eight,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.nine,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.xmark,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtom(
                  icon: FontAwesomeIcons.four,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.five,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.six,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.minus,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtom(
                  icon: FontAwesomeIcons.one,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.two,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.three,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.plus,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtom(
                  icon: Icons.adb_rounded,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.zero,
                ),
                CustomButtom(
                  icon: Icons.circle,
                ),
                CustomButtom(
                  icon: FontAwesomeIcons.equals,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
