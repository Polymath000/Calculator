import 'package:calculater/Widget/dark_light_mode.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              DarkLightMode(),
            ],
          ),
        ),
      ),
    );
  }
}
