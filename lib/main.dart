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
  final List<WordPair> _word = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // không cho phép giá trị trong set trùng
  final Set<WordPair> _saved = new Set<WordPair>();

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
    // set _saved chứa wordpair thì dã save
    final bool alreadySaved = _saved.contains(wordPair);

    return ListTile(
      title: Row(
        children: <Widget>[
          Text(
            index.toString() + " ",
            style: _biggerFont,
          ),
          Expanded(
              child: Text(
            wordPair.asPascalCase,
            style: _biggerFont,
          )),
        ],
      ),
      trailing: new Icon(
        alreadySaved == true ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }
}
