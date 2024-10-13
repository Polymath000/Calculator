import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  textField({
    super.key,
    this.opacity = 1,
    required this.size,
    required this.isEnabled,
  });
  double opacity;
  double size;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: TextField(
        readOnly: !isEnabled,
        showCursor: false,
        autofocus: !isEnabled,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: size,
          // color: Provider.of<ModeProvider>(context).isChange
          //     ? darkColor
          //     : lightColor,
        ),
        keyboardType: TextInputType.none,
        decoration: InputDecoration(
          hintText: "Operation",
          hintStyle: TextStyle(
            fontSize: size,
            // color: Provider.of<ModeProvider>(context).isChange
            //     ? darkColor
            //     : lightColor,
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
    );
  }
}
