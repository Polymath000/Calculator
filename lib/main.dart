import 'package:calculater/Widget/home_page.dart';
import 'package:calculater/provider/mode_provider.dart';
import 'package:calculater/provider/operation_provider.dart';
import 'package:calculater/theme/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
    create: (context) => ModeProvider(),
  ),
  ChangeNotifierProvider(create: (context) => OperationProvider(),)
  ],
  child: const CalcApp(),
  )
  
  );
  // runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ModeProvider>(context).isChange
          ? ModeTheme.dark
          : ModeTheme.light,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
