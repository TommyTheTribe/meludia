import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sun extends StatefulWidget {
  @override
  _SunState createState() => _SunState();
}

class _SunState extends State<Sun> with TickerProviderStateMixin {
  final Widget ascendantButton = SvgPicture.asset(
      'assets/images/bouton_ascendant.svg',
      semanticsLabel: 'Test');

  double _size = 20.0;
  bool _large = false;

  @override
  void initState() {
    super.initState();
    new Timer.periodic(
        new Duration(milliseconds: 300),
        (Timer timer) => {
              setState(() {
                _size = _large ? 50 : 55.0;
                _large = !_large;
              })
            });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      child: Center(
        child: SizedBox(
          width: _size,
          child: ascendantButton,
        ),
      ),
    );
  }
}
