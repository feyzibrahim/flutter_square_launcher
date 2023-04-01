import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Square Pixel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: WillPopScope(
          onWillPop: () => Future(() => false),
          child: SafeArea(
            child: Home(),
          ),
        ),
      ),
    );
  }
}
