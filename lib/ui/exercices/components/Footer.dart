import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> with TickerProviderStateMixin {
  final Widget footer = SvgPicture.asset(
    'assets/images/footer-tommy.svg',
    semanticsLabel: 'Test',
  );

  final footer2 = Image(image: AssetImage('assets/images/footer-png2.png'));

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: FittedBox(
        child: footer2,
        fit: BoxFit.fill,
      ),
    );
  }
}
