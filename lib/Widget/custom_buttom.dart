import 'package:calculator/provider/mode_provider.dart';
import 'package:calculator/provider/operation_provider.dart';
import 'package:calculator/theme/material_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButtom extends StatefulWidget {
  const CustomButtom({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  State<CustomButtom> createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Animation<double>? _squeezeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _squeezeAnimation = Tween<double>(begin: 0, end: 12.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = getColor(context, widget.icon);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Container(
          margin: EdgeInsets.symmetric(
            vertical: 6.h,
          ),
          height: MediaQuery.of(context).size.width / 5.7,
          width: widget.icon == FontAwesomeIcons.equals
              ? MediaQuery.of(context).size.width / 2.49
              : MediaQuery.of(context).size.width / 5.7,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(28),
              onTapDown: (_) => _controller.forward(),
              onTapUp: (_) => _controller.reverse(),
              onTapCancel: () => _controller.reverse(),
              onTap: () {
                Provider.of<OperationProvider>(context, listen: false)
                    .changeOperationField(icon: widget.icon);
              },
              onLongPress: widget.icon == FontAwesomeIcons.deleteLeft
                  ? () {
                      Provider.of<OperationProvider>(context, listen: false)
                          .clearAll();
                    }
                  : null,
              child: Container(
                margin: EdgeInsets.all(_squeezeAnimation?.value ?? 0),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Icon(
                  widget.icon,
                  color: color == const Color(0xff4b5efc)
                      ? Colors.white
                      : (Provider.of<ModeProvider>(context).isChange
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : Colors.black),
                  size: widget.icon == Icons.circle ? 12 : 23.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
