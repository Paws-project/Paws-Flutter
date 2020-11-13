import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:paws/config.dart';
import 'package:paws/models/Pet.dart';

class PetProvider {
  // static Future<List<Pet>> fetchAll() async {
  //   var res = await http.get(
  //     "http://${Config.API_HOST}:${Config.API_PORT}/pet/all",
  //   );
  //   var json = jsonDecode(res.body);
  //   print(json);
  //   return <Pet>[];
  // }

  static Future<bool> save(Pet pet) async {
    try {
      var res = await http.post(
        "$API_HTTP/pet/new",
        body: {
          "petType": pet.petType,
          "sex": pet.sex,
          "nickname": pet.nickname,
          "birthDate": pet.birthDate.millisecondsSinceEpoch.toString(),
          "chipNumber": pet.chipNumber.toString(),
          "chipImlantationDate":
              pet.chipImplantationDate.millisecondsSinceEpoch.toString()
        },
      );
      print(res.body);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
