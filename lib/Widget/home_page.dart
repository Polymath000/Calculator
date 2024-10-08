import 'package:calculater/Widget/dark_light_mode.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
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
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 2.2),
                  child: textField(
                    opacity: 0.4,
                    size: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 3),
                  child: textField(
                    size: 70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class textField extends StatelessWidget {
  textField({super.key, this.opacity = 1, required this.size});
  double opacity;
  double size;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: TextField(
        style: TextStyle(
          fontSize: size,
        ),
        keyboardType: TextInputType.none,
        decoration: InputDecoration(
          hintText: "Operation",
          hintStyle: TextStyle(
            fontSize: size,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }
}
