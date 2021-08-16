import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrangeAscendant extends StatefulWidget {
  @override
  _OrangeAscendantState createState() => _OrangeAscendantState();
}

class _OrangeAscendantState extends State<OrangeAscendant>
    with TickerProviderStateMixin {
  final Widget ascendantBackground = SvgPicture.asset(
    'assets/images/ascendant_background.svg',
    semanticsLabel: 'Test',
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: FittedBox(
        child: ascendantBackground,
        fit: BoxFit.fill,
      ),
    );
  }
}
