import 'package:calculater/cubits/cubit/mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ModeCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xfff1f2f3),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: const Color.fromRGBO(86, 80, 14, 171),
        ),
        themeMode: BlocProvider.of<ModeCubit>(context).isChange == true
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              BlocBuilder<ModeCubit, ModeState>(
                builder: (context, state) {
                  return Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      GestureDetector(
                        child: SizedBox(
                          width: 120,
                          child: Switch(
                              activeColor: const Color(0xffD2D3DA),
                              activeTrackColor: Colors.white,
                              inactiveThumbColor: Colors.grey[600],
                              inactiveTrackColor: Colors.grey[850],
                              value:
                                  BlocProvider.of<ModeCubit>(context).isChange,
                              onChanged: (bool value) {
                                setState(() {
                                  BlocProvider.of<ModeCubit>(context).isChange =
                                      value;
                                });
                              }),
                        ),
                      ),
                      Positioned(
                        left: !BlocProvider.of<ModeCubit>(context).isChange
                            ? 60.0
                            : 37.0,
                        child: Icon(
                          !BlocProvider.of<ModeCubit>(context).isChange
                              ? Icons.nightlight_outlined
                              : Icons.light_mode_outlined,
                          color: Colors.blue,
                          size: 20.0,
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
