import 'package:calculater/Widget/dark_light_mode.dart';
import 'package:calculater/Widget/text_field.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      // alignment: Alignment.centerRight,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Align(
                alignment: Alignment.center, child: DarkLightMode()),
            // const Spacer(),
            textField(
              opacity: 0.4,
              size: 50,
              isEnabled: true,
            ),
            textField(
              size: 70,
              isEnabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
