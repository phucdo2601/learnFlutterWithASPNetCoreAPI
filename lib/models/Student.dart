import 'dart:convert';

List<Student> studentFromJson(String str) => List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int gender;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
  });


  Student.WithOutId(this.firstName, this.lastName, this.gender);

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
  };
}

// class Student {
//   late int _id;
//   late String _firstName;
//   late String _lastName;
//   late int _gender;
//
//   Student.WithId(this._id, this._firstName, this._lastName, this._gender);
//
//   Student(this._firstName, this._lastName, this._gender);
//
//
//   int get gender => _gender;
//
//   set gender(int value) {
//     _gender = value;
//   }
//
//   String get lastName => _lastName;
//
//   set lastName(String value) {
//     _lastName = value;
//   }
//
//   String get firstName => _firstName;
//
//   set firstName(String value) {
//     _firstName = value;
//   }
//
//   int get id => _id;
//
//   set id(int value) {
//     _id = value;
//   }
//
//   Map<String, dynamic> toMap() {
//     var map =  Map<String, dynamic>();
//     map["firstName"] = _firstName;
//     map["lastName"] = _lastName;
//     map["gender"] = _gender;
//
//     if(_id != null) {
//       map["Id"] = _id;
//     }
//     return map;
//   }
//   Student.fromObject(dynamic o) {
//     this._id = o["Id"];
//     this._firstName = o["firstName"];
//     this._lastName = o["lastName"];
//     this._gender = o["gender"];
//   }
// }