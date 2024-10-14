import 'package:calculater/provider/mode_provider.dart';
import 'package:calculater/provider/operation_provider.dart';
import 'package:calculater/theme/material_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      onTap: () {
        Provider.of<OperationProvider>(context, listen: false)
            .changeOperationField(icon: icon);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 9),
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
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}
