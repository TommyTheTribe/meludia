import 'package:flutter/material.dart';

class GreenCircle extends StatefulWidget {
  @override
  _GreenCircleState createState() => _GreenCircleState();
}

class _GreenCircleState extends State<GreenCircle> with SingleTickerProviderStateMixin {
  bool start = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedPositioned(
          // width: start ? 200.0 : 50.0,
          // height: start ? 50.0 : 200.0,
          top: start ? 0 : 150.0,
          duration: const Duration(seconds: 2),
          curve: Curves.bounceOut,
          child: GestureDetector(
            onTap: () {
              setState(() {
                start = !start;
              });
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: new BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
