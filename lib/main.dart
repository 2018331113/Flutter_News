import 'package:flutter/material.dart';
import 'package:flutter_news/views/home.dart';
import 'package:flutter_news/widgets/customAppBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        body: Home(),
        appBar: CustomWidget().getAppBar(homePage: true),
      ),
    );
  }
}
