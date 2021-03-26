import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final wordPair = WordPair.random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
      home: Scaffold(
        body: Center(
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}
