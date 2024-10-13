import 'package:calculater/Widget/dark_light_mode.dart';
import 'package:calculater/Widget/text_field.dart';
import 'package:calculater/provider/mode_provider.dart';
import 'package:calculater/theme/material_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
            textField(
              opacity: 0.4,
              size: 50,
              isEnabled: true,
            ),
            textField(
              size: 70,
              isEnabled: false,
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

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    Color color = getColor(context, icon);
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Center(
          child: Icon(
            icon,
            color: color == const Color(0xff4b5efc)
                ? Colors.white
                : (Provider.of<ModeProvider>(context).isChange
                    ? Colors.white
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}
