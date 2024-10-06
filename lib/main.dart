import 'package:calculater/provider/mode_provider.dart';
import 'package:calculater/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
    create: (context) => ModeProvider(),
    child: const CalcApp(),
  ));
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChange = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  GestureDetector(
                    child: SizedBox(
                      width: 120,
                      child: Switch(
                          activeColor: const Color(0xffD2D3DA),
                          activeTrackColor:
                              const Color.fromARGB(255, 206, 200, 200),
                          inactiveThumbColor: Colors.grey[600],
                          inactiveTrackColor: Colors.grey[850],
                          value: isChange,
                          onChanged: (bool value) {
                            setState(() {
                              Provider.of<ModeProvider>(context, listen: false)
                                  .changeMode();
                              // Provider.of<ModeProvider>(context, listen: false)
                              // .isChange = value;
                              isChange = value;
                            });
                          }),
                    ),
                  ),
                  Positioned(
                    left: !isChange ? 60.0 : 37.0,
                    child: Icon(
                      !isChange
                          ? Icons.nightlight_outlined
                          : Icons.light_mode_outlined,
                      color: Colors.blue,
                      size: 20.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
