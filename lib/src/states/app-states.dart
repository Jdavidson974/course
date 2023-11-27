import 'package:course/src/database/models/ingredients.model.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import '../database/services/ingredient-provider.dart';

class AppState extends ChangeNotifier {
  var word = WordPair.random();
  var favorites = <WordPair>[];
  var ingredients = <IngredientsModel>[];
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

  Future<void> getIngredients() async {
    IngredientsProvider ingredientsDb = IngredientsProvider();
    ingredients = await ingredientsDb.fetchIngredients();
    notifyListeners();
  }
}
