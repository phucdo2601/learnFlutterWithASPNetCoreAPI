import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learn_flutter_asp_net_api_b01/api/StudentService.dart';
import 'package:learn_flutter_asp_net_api_b01/models/Student.dart';
import 'package:learn_flutter_asp_net_api_b01/ui/components/general/MyAppBar.dart';
import 'package:learn_flutter_asp_net_api_b01/ui/components/general/MyStudentList.dart';
import 'package:learn_flutter_asp_net_api_b01/ui/components/student/AddStudent.dart';

class Students extends StatefulWidget {
  Students({Key? key}) : super(key: key);

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Students> {
  List<Student>? students;
  late Future<Student> futureStudent;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getStudent();
  }

  getStudent() async {
    students = await StudentService.fetchStudent();
    if (students != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // getStudent();
    return Scaffold(
      floatingActionButton: _buildFloatingButton(),
      appBar: MyAppBar("Student List"),
      body: MyStudentList(students, context),
    );
  }

  void navigateToStudentDetail(Student student) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddStudent(student)),
    );
  }

  Widget _buildFloatingButton() {
    return FloatingActionButton(
      child: Icon(
        Icons.person_add,
      ),
      onPressed: () {
        navigateToStudentDetail(Student.WithOutId("", "", 1));
      },

    );
  }
}
