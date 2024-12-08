import 'package:calculator/provider/mode_provider.dart';
import 'package:calculator/provider/operation_provider.dart';
import 'package:calculator/theme/material_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => GestureDetector(
        onTap: () {
          Provider.of<OperationProvider>(context, listen: false)
              .changeOperationField(icon: icon);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 6.h,),

          height: MediaQuery.of(context).size.width / 5.7,
          width: MediaQuery.of(context).size.width / 5.7,
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
              size: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
