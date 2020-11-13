import 'package:meta/meta.dart';

class Pet {
  String petType;
  String sex;
  String nickname;
  DateTime birthDate;
  int chipNumber;
  DateTime chipImplantationDate;

  Pet({
    @required this.petType,
    @required this.sex,
    @required this.nickname,
    @required this.birthDate,
    this.chipNumber,
    this.chipImplantationDate,
  });
}
