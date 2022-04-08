import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learn_flutter_asp_net_api_b01/api/StudentService.dart';
import 'package:learn_flutter_asp_net_api_b01/models/Student.dart';

class Students extends StatefulWidget {
  Students({Key? key}) : super(key:key);

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
    if(students != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    // getStudent();
    return Scaffold(
      appBar: MyAppBar(),
      body: MyStudentList(students),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: new Text("Student List"),
    );
  }
}

class MyStudentList extends StatelessWidget implements PreferredSizeWidget {

  late List<Student>? students;

  MyStudentList(this.students);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return new ListView.builder(
     itemCount: students!.length,
     itemBuilder: (context, index) {
       return Card(
         color: Colors.white,
         elevation: 2.0,
         child: ListTile(
           title: ListTile(
             title:  Text(
               students![index].firstName + " "+students![index].lastName,
             ),
             onTap: null,
           ),
         ),
       );
     },
   );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);

}