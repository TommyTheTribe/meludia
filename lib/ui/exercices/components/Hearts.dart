import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Hearts extends StatefulWidget {
  @override
  _HeartsState createState() => _HeartsState();
}

class _HeartsState extends State<Hearts> with TickerProviderStateMixin {
  final Widget heart = SvgPicture.asset(
    'assets/images/heart.svg',
    semanticsLabel: 'Test',
    width: 10,
    height: 10,
  );

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: heart,
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: heart,
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: heart,
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: heart,
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: heart,
        ),
      ]),
    );
  }
}
