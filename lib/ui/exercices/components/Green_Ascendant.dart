import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GreenAscendant extends StatefulWidget {
  @override
  _GreenAscendantState createState() => _GreenAscendantState();
}

class _GreenAscendantState extends State<GreenAscendant>
    with TickerProviderStateMixin {
  final Widget ascendantBackground = SvgPicture.asset(
    'assets/images/ascendant_background_green.svg',
    color: Colors.green,
    semanticsLabel: 'Test',
  );

  @override
  Widget build(BuildContext context) {
    return ascendantBackground;
  }
}
