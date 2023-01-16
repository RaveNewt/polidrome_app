import 'package:flutter/material.dart';
import 'package:polidrome/pages/first_page.dart';
import 'package:polidrome/pages/second_page.dart';
import 'package:polidrome/pages/third_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage(
              value: '',
            ),
        '/third': (context) => ThirdPage(),
      },
    );
  }
}
