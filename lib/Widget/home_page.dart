import 'package:calculator/Widget/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: HomePageBody(),
      ),
    );
  }
}
