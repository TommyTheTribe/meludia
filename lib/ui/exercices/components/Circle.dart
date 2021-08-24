import 'package:flutter/material.dart';
import 'dart:math' as math;

class Circle extends StatefulWidget {
  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<Circle> with SingleTickerProviderStateMixin {
  var _radius = 50.0;

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    Tween<double> _rotationTween = Tween(begin: -0.5, end: 0.5);

    animation = _rotationTween.animate(controller)
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

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: PointPainter(_radius, animation.value),
      child: Container(),
    );
  }
}

class PointPainter extends CustomPainter {
  final double radius;
  final double radians;
  PointPainter(this.radius, this.radians);

  @override
  void paint(Canvas canvas, Size size) {
    var innerCirclePaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    Offset center = Offset(size.width / 2, size.height / 2);

    double r;
    if (radians < 0.0) {
      r = math.pi - radians;
    } else {
      r = -math.pi + radians;
    }
    if (math.cos(r) < 0.0) {
      canvas.drawCircle(center, -radius * math.cos(r), innerCirclePaint);
    } else {
      canvas.drawCircle(center, radius * math.cos(r), innerCirclePaint);
    }

    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
