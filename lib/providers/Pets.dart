import 'package:flutter/material.dart';
import 'package:paws/models/Pet.dart';
import 'package:http/http.dart' as http;
import 'package:paws/config.dart' as cfg;

class Pets with ChangeNotifier {
  List<Pet> _items = [];

  List<Pet> get items {
    return [..._items];
  }

  void add(Pet pet) async {
    try {
      var apiresult = await http.post(
        cfg.API_HTTP + "pets/" + "list/",
        body: pet.toPostBody(),
      );
      if (apiresult.statusCode == 201) {
        this._items.add(Pet.fromJson(apiresult.body));
        notifyListeners();
      }
    } catch (e) {}
  }

  void find(num id) async {
    var apiresult = await http.get(cfg.API_HTTP + "pets/" + "list/$id");
    if (apiresult.statusCode == 200) {
      this._items.add(Pet.fromJson(apiresult.body));
      notifyListeners();
    }
  }

  void all() async {
    var apiresult = await http.get(cfg.API_HTTP + "pets/" + "list/");
    if (apiresult.statusCode == 200) {
      this._items.addAll(Pet.fromJsonList(apiresult.body));
      notifyListeners();
    }
  }
}
