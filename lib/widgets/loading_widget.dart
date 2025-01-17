import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra7alah/utils/colors.dart';

class LoadingWidget extends StatefulWidget {
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;
  late AnimationController controller3;
  late AnimationController controller4;
  late Animation<double> animation;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  late Animation<double> animation5;
  late Animation<double> animation6;
  late Animation<double> animation7;
  late Animation<double> animation8;
  late Animation<double> animation9;
  late Animation<double> animation10;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 150)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    animation2 = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    animation3 = Tween<double>(begin: 10, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    controller3 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation5 = Tween<double>(begin: 0, end: 150)
        .animate(CurvedAnimation(parent: controller3, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller3.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller3.forward();
        }
      });
    animation6 = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: controller3, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    animation7 = Tween<double>(begin: 10, end: 0)
        .animate(CurvedAnimation(parent: controller3, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    controller4 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation8 = Tween<double>(begin: 0, end: 150)
        .animate(CurvedAnimation(parent: controller4, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller4.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller4.forward();
        }
      });
    animation9 = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: controller4, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    animation10 = Tween<double>(begin: 10, end: 0)
        .animate(CurvedAnimation(parent: controller4, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation4 = Tween<double>(begin: 35, end: 50).animate(
        CurvedAnimation(parent: controller2, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    controller.forward();
    controller2.forward();
    Timer(Duration(milliseconds: 800), () => controller3.forward());
    Timer(Duration(milliseconds: 1100), () => controller4.forward());
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: CustomPaint(
          painter: MyPainter(
            animation.value,
            animation2.value,
            animation3.value,
            animation4.value,
            animation5.value,
            animation6.value,
            animation7.value,
            animation8.value,
            animation9.value,
            animation10.value,
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double _radius;
  final double _opacity;
  final double _strokeWidth;
  final double _centerCircleRadius;
  final double _radius2;
  final double _opacity2;
  final double _strokeWidth2;
  final double _radius3;
  final double _opacity3;
  final double _strokeWidth3;

  MyPainter(
      this._radius,
      this._opacity,
      this._strokeWidth,
      this._centerCircleRadius,
      this._radius2,
      this._opacity2,
      this._strokeWidth2,
      this._radius3,
      this._opacity3,
      this._strokeWidth3);

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint();
    paint.color = kPrimaryColor.withOpacity(_opacity);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = _strokeWidth;

    canvas.drawCircle(Offset.zero, _radius, paint);

    Paint paint2 = Paint();
    paint2.color = kPrimaryColor;
    paint2.style = PaintingStyle.fill;

    canvas.drawCircle(Offset.zero, _centerCircleRadius, paint2);

    Paint paint3 = Paint();
    paint3.color = kPrimaryColor.withOpacity(_opacity2);
    print("${Get.isDarkMode} is dark");
    paint3.style = PaintingStyle.stroke;
    paint3.strokeWidth = _strokeWidth2;

    canvas.drawCircle(Offset.zero, _radius2, paint3);

    Paint paint4 = Paint();
    paint4.color = kDarkPrimaryColor.withOpacity(_opacity3);
    paint4.style = PaintingStyle.stroke;
    paint4.strokeWidth = _strokeWidth3;

    canvas.drawCircle(Offset.zero, _radius3, paint4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}