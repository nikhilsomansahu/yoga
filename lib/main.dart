import 'package:flutter/material.dart';
import 'package:web2app/widgets/maintab.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YogaPlusHerbs',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MainTab(),
      debugShowCheckedModeBanner: false,
    );
  }
}
