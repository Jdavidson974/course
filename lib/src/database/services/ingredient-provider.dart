import 'package:course/src/database/models/ingredients.model.dart';
import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths
import 'dart:io';
import 'dart:async';

class IngredientsProvider {
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path =
        join(directory.path, "ingredients.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
          """
          CREATE TABLE Ingredients(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          libelle  TEXT,
          price INTEGER)""");
    });
  }

  Future<int> addItem(AddIngredientsModel item) async {
    //returns number of items inserted as an integer
    final db = await init(); //open database
    return db.insert(
      "Ingredients", item.toJson(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<List<IngredientsModel>> fetchIngredients() async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db.query(
        "Ingredients"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      //create a list of memos
      return IngredientsModel(
        id: int.parse(maps[i]['id'].toString()),
        libelle: maps[i]['libelle'].toString(),
        price: int.parse(maps[i]['price'].toString()),
      );
    });
  }

  Future<int> deleteMemo(int id) async {
    //returns number of items deleted
    final db = await init();

    int result = await db.delete("Ingredients", //table name
        where: "id = ?",
        whereArgs: [id] // use whereArgs to avoid SQL injection
        );

    return result;
  }

  Future<int> updateMemo(int id, IngredientsModel item) async {
    // returns the number of rows updated

    final db = await init();

    int result = await db
        .update("Ingredients", item.toJson(), where: "id = ?", whereArgs: [id]);
    return result;
  }
}
