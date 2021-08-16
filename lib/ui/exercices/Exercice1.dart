import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/Circle.dart';

class Exercice1 extends StatefulWidget {
  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice1> with TickerProviderStateMixin {
  final Widget ascendant = SvgPicture.asset(
      'assets/images/ascendant_background.svg',
      semanticsLabel: 'Test');
  final Widget descendant = SvgPicture.asset(
      'assets/images/descendant_background.svg',
      semanticsLabel: 'Test');
  final Widget ascendantButton = SvgPicture.asset(
      'assets/images/bouton_ascendant.svg',
      semanticsLabel: 'Test');

  @override
  Widget build(BuildContext context) {
    return MyPainter();
  }
}
