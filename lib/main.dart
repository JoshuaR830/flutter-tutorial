import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'startup Name Generator',
      home: RandomWords(),
    );
  }
}


// Only creates it's state class
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

// The _ prefix enforces privacy
class _RandomWordsState extends State<RandomWords> {
  @override

  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
          pair.asPascalCase,
          style: _biggerFont
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}

