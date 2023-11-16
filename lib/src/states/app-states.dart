import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  var word = WordPair.random();
  var favorites = <WordPair>[];
  void getNext() {
    word = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(word)) {
      favorites.remove(word);
    } else {
      favorites.add(word);
    }
    notifyListeners();
  }
}
