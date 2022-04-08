import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:learn_flutter_asp_net_api_b01/models/Student.dart';

class StudentService {


  static Future<List<Student>?> fetchStudent() async{
    var client = http.Client();

    var url = Uri.parse('https://learnflutterwithaspnetapi20220408003613.azurewebsites.net/api/Student');
    var response = await client.get(url);
    if(response.statusCode == 200) {
      var json = response.body;
      print(json);
      return studentFromJson(json);
    }

  }
}