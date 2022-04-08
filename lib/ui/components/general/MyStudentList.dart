import 'package:flutter/material.dart';
import 'package:learn_flutter_asp_net_api_b01/models/Student.dart';
import 'package:learn_flutter_asp_net_api_b01/ui/components/student/AddStudent.dart';

class MyStudentList extends StatelessWidget implements PreferredSizeWidget {

   List<Student>? students;
   BuildContext? context;

  MyStudentList(this.students, this.context);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: students?.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            title: ListTile(
              leading: displayByGender(this.students![index].gender),
              trailing: Icon(
                Icons.arrow_forward_ios
              ),
              title: Text(
                students![index].firstName + " " + students![index].lastName,
              ),
              onTap: () {
                navigateToStudentDetail(this.students![index]);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);

  void navigateToStudentDetail(Student student) async {
    await Navigator.push(
      context!,
      MaterialPageRoute(builder: (context) => AddStudent(student)),
    );
  }

  Widget displayByGender(int gender) {
    var male = Icon(
      Icons.person,
      color: Colors.blue,
    );
    var female = Icon(
      Icons.pregnant_woman,
      color: Colors.pink,
    );
    var otherSex = Icon(
      Icons.battery_unknown,
      color: Colors.green,
    );
    return gender == 1 ? male : gender == 2 ? female : otherSex;
  }
}