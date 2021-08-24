import 'dart:ui';
import 'package:flutter/material.dart';

class CircleAnimation extends StatefulWidget {
  CircleAnimation({
    @required this.animation,
    @required this.controller,
  })  : assert(animation != null),
        assert(controller != null);

  final Animation animation;
  final AnimationController controller;

  @override
  State<StatefulWidget> createState() {
    return CircleAnimationState();
  }
}

class CircleAnimationState extends State<CircleAnimation>
    with SingleTickerProviderStateMixin {
  Path _path;

  @override
  void initState() {
    super.initState();
    _path = drawPath();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.animation.status);
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: calculate(widget.animation.value).dy,
            left: calculate(widget.animation.value).dx,
            child: Opacity(
              opacity: widget.animation.status == AnimationStatus.dismissed
                  ? 0.0
                  : 1.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100),
                ),
                width: (1 - widget.animation.value) * 200,
                height: (1 - widget.animation.value) * 200,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  Path drawPath() {
    Path path = Path();
    path.moveTo(-100, 150);
    path.quadraticBezierTo(150, 150, 250, 95);
    return path;
  }

  Offset calculate(value) {
    PathMetrics pathMetrics = _path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent pos = pathMetric.getTangentForOffset(value);
    return pos.position;
  }
}

class PathPainter extends CustomPainter {
  Path path;

  PathPainter(this.path);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.redAccent.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.0;

    canvas.drawPath(this.path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
