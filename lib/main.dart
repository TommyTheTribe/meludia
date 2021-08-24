import 'package:flutter/material.dart';
import 'package:meludia/ui/exercices/components/Circle.dart';
import 'package:meludia/ui/exercices/components/Footer.dart';
import 'package:meludia/ui/exercices/components/Green_Ascendant.dart';
import 'package:meludia/ui/exercices/components/Hearts.dart';
import 'package:meludia/ui/exercices/components/Orange_Ascendant.dart';
import 'package:meludia/ui/exercices/components/Sun.dart';
import 'package:meludia/ui/exercices/components/CircleAnimation.dart';

import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    super.initState();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Hearts(),
          Stack(
            children: [
              Positioned.fill(
                child: CircleAnimation(
                  animation: _animation,
                  controller: _controller,
                ),
              ),
              Positioned(
                child: _animation.status == AnimationStatus.dismissed ||
                        _animation.status == AnimationStatus.completed
                    ? OrangeAscendant()
                    : GreenAscendant(),
              ),
              Positioned(
                right: 0,
                bottom: 150,
                child: GestureDetector(
                    onTap: () {
                      _controller.forward();
                    },
                    child: Sun()),
              ),
              Positioned(
                child: Circle(),
                right: 27.5,
                top: 85,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
      floatingActionButton: SizedBox(
        width: 100,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          onPressed: null,
          child: Row(
            children: [
              Icon(
                Icons.pause,
                color: Colors.green,
              ),
              const Text(
                'PAUSE',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
