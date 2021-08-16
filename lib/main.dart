import 'package:flutter/material.dart';
import 'package:meludia/ui/exercices/components/Circle.dart';
import 'package:meludia/ui/exercices/components/Footer.dart';
import 'package:meludia/ui/exercices/components/GreenCircle.dart';
import 'package:meludia/ui/exercices/components/Hearts.dart';
import 'package:meludia/ui/exercices/components/Orange_Ascendant.dart';
import 'package:meludia/ui/exercices/components/Sun.dart';
import 'package:meludia/ui/exercices/components/Test.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Test()),
          // Expanded(child: GreenCircle()),
          // Hearts(),
          // Stack(
          //   children: [
          //     Positioned(
          //       child: OrangeAscendant(),
          //     ),
          //     Positioned(
          //       right: 0,
          //       bottom: 150,
          //       child: Sun(),
          //     ),
          //     Positioned(
          //       child: Circle(),
          //       right: 27.5,
          //       top: 85,
          //     ),
          //   ],
          // ),
          // Footer(),
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
