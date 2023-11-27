import 'dart:convert';

class IngredientsModel {
  final int id;
  final String libelle;
  final int price;

  IngredientsModel(
      {required this.id, required this.libelle, required this.price});

  IngredientsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        libelle = json['libelle'] as String,
        price = json['price'] as int;
  Map<String, dynamic> toJson() => {
        // used when inserting data to the database
        "id": id,
        "libelle": libelle,
        "price": price,
      };
}

class AddIngredientsModel {
  final String libelle;
  final int price;

  AddIngredientsModel({required this.libelle, required this.price});

  AddIngredientsModel.fromJson(Map<String, dynamic> json)
      : libelle = json['libelle'] as String,
        price = json['price'] as int;
  Map<String, dynamic> toJson() => {
        // used when inserting data to the database
        "libelle": libelle,
        "price": price,
      };
}
