import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:learn_flutter_asp_net_api_b01/models/Student.dart';

class StudentService {
  static Future<List<Student>?> fetchStudent() async {
    var client = http.Client();

    var url = Uri.parse(
        'https://learnflutterwithaspnetapi20220408003613.azurewebsites.net/api/Student');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      print(json);
      return studentFromJson(json);
    }
  }

  static Map<String, String> header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  static Future<bool> postStudent(Student student) async {
    var client = http.Client();

    var url = Uri.parse(
        'https://learnflutterwithaspnetapi20220408003613.azurewebsites.net/api/Student');

    var myStudent = student.toJson();
    var studentBody = convert.json.encode(myStudent);
    var response = await client.post(url, headers: header, body: studentBody);

    return Future.value(response.statusCode == 200 ? true : false);
  }
  
  static Future<bool> deleteStudent(int id) async{
    var client = http.Client();
    String realId = id.toString();
    var url = Uri.parse(
        'https://learnflutterwithaspnetapi20220408003613.azurewebsites.net/api/Student?Id=$realId');
    var response = await client.delete(url, headers: header);

    return Future.value(response.statusCode == 200 ? true : false);
  }
}
