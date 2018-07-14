import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class RandomWordsState extends State<RandomWords>{

  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0); 

  Widget build(BuildContext context){
    //final wordpair = new    WordPair.random();
    //return new Text(wordpair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      )
      ,
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int i){
          if (i.isOdd){
            return new Divider();
          }

          final int index = i  ~/2 ;
          if (index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair wordPair) {
    return new ListTile(
      title: new Text(wordPair.asPascalCase,
        style: _biggerFont,
      ),
      
    );

  }
}

class RandomWords extends StatefulWidget{
  RandomWordsState createState() => new RandomWordsState();
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context){
    
    return new MaterialApp(
        title: "Welcome to flutter",
        home: new RandomWords(),
    );
  }
}
