import 'dart:async';

import 'package:course/src/database/models/ingredients.model.dart';
import 'package:course/src/database/services/ingredient-provider.dart';
import 'package:course/src/states/app-states.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO FAIRE LE CRUD
class Ingredients extends StatelessWidget {
  const Ingredients({super.key});
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    appState.getIngredients();
    var ingredientList = appState.ingredients;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${ingredientList.length} favorites:'),
        ),
        for (var ingredient in ingredientList)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(ingredient.libelle),
          ),
      ],
    );
  }
}
