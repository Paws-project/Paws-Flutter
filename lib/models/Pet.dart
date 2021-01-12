import 'dart:convert';

import 'package:meta/meta.dart';

class Pet {
  num id;
  String type;
  bool male;
  String nickname;
  DateTime birthDate;
  int chipNumber;
  DateTime chipImplantationDate;

  Pet({
    this.id,
    @required this.type,
    @required this.male,
    @required this.nickname,
    this.birthDate,
    this.chipNumber,
    this.chipImplantationDate,
  });

  Map<String, dynamic> toPostBody() {
    return <String, dynamic>{
      "id": this.id,
      "type": this.type,
      "male": this.male,
      "nickname": this.nickname,
      "birth_date": this.birthDate,
      "chip_number": this.chipNumber,
      "chip_implantation_date": this.chipImplantationDate,
    };
  }

  factory Pet.fromJson(String data) {
    var map = jsonDecode(data) as Map<dynamic, dynamic>;
    return Pet.fromMap(map);
  }

  factory Pet.fromMap(Map<dynamic, dynamic> map) {
    return Pet(
      id: map['id'],
      type: map["type"],
      male: map["male"],
      nickname: map["nickname"],
      birthDate: DateTime.parse(map["birth_date"]),
      chipNumber: map["chip_number"],
      chipImplantationDate: DateTime.parse(map["chip_implantation_date"]),
    );
  }

  static List<Pet> fromJsonList(String data) {
    List<dynamic> list = jsonDecode(data) as List<dynamic>;
    var testres = list
        .map(
          (map) => Pet.fromMap(map),
        )
        .toList();
    return testres;
  }
}
