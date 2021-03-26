import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Example'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _word = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return ListView.builder(itemBuilder: (context, index) {
      if (index >= _word.length) {
        _word.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_word[index], index);
    });
  }

  Widget _buildRow(WordPair wordPair, int index) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Text(index.toString() + " ", style: const TextStyle(fontSize: 18.0),),
          Expanded(child: Text(wordPair.asPascalCase, style: const TextStyle(fontSize: 18.0),)),
        ],
      ),
      // title: Text(
      //   wordPair.asPascalCase,
      //   style: const TextStyle(fontSize: 18.0),
      // ),
    );
  }
}
