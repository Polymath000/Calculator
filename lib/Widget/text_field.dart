import 'package:calculator/provider/mode_provider.dart';
import 'package:calculator/provider/operation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class InputTextField extends StatefulWidget {
  InputTextField({
    super.key,
  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  late TextEditingController myController;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the initial value from the provider
    myController = TextEditingController(
      text: Provider.of<OperationProvider>(context, listen: false).value.join(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newValue = Provider.of<OperationProvider>(context).value.join();
    final equlClickled = Provider.of<OperationProvider>(context).equlClickled;
    if (newValue != myController.text) {
    myController.text = newValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => Opacity(
        opacity: 0.4,
        child: TextFormField(
          controller: myController,
          textCapitalization: TextCapitalization.characters,
          readOnly: false,
          showCursor: false,
          autofocus: true,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 30.sp,
            color: !Provider.of<ModeProvider>(context).isChange
                ? Colors.black
                : Colors.white,
          ),
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            // hintText: myController.text,
            hintStyle: TextStyle(
              fontSize: 30.sp,
              color: !Provider.of<ModeProvider>(context).isChange
                  ? Colors.black
                  : Colors.white,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.none,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.none,
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OutputTextField extends StatefulWidget {
  OutputTextField({
    super.key,
  });

  @override
  _OutputTextFieldState createState() => _OutputTextFieldState();
}

class _OutputTextFieldState extends State<OutputTextField> {
  late TextEditingController myController;

  @override
  void initState() {
    super.initState();

    myController = TextEditingController(
      text:
          Provider.of<OperationProvider>(context, listen: false).result.join(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var newValue = Provider.of<OperationProvider>(context).result;
    if (newValue != myController.text) {
      String result = newValue.join();
      myController.text = result.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => Opacity(
        opacity: 1,
        child: TextFormField(
          controller: myController,
          textCapitalization: TextCapitalization.characters,
          readOnly: true,
          showCursor: false,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 50.sp,
            color: !Provider.of<ModeProvider>(context).isChange
                ? Colors.black
                : Colors.white,
          ),
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            hintText: myController.text,
            hintStyle: TextStyle(
              fontSize: 50.sp,
              color: !Provider.of<ModeProvider>(context).isChange
                  ? Colors.black
                  : Colors.white,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.none,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.none,
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
