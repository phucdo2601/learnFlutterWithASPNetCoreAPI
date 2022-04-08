import 'package:flutter/material.dart';
import 'package:learn_flutter_asp_net_api_b01/api/StudentService.dart';
import 'package:learn_flutter_asp_net_api_b01/models/Student.dart';
import 'package:learn_flutter_asp_net_api_b01/ui/components/general/MyAppBar.dart';

class AddStudent extends StatefulWidget {
  late Student student;

  AddStudent(this.student);

  @override
  State<StatefulWidget> createState() => _AddStudentState(student);
}

class _AddStudentState extends State<AddStudent> {
   Student? student;

  _AddStudentState(this.student);

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();

  //create list button
  final _gendersDropDownList = ["Male", "Female", "N/A"];
  String? selectedItem = "Male";

  @override
  Widget build(BuildContext context) {
    firstNameController.text = student!.firstName;
    lastNameController.text = student!.lastName;

    return Scaffold(
      appBar: MyAppBar("Student"),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.only(
        top: 35.0,
        left: 10.0,
        right: 10,
      ),
      child: ListView(
        children: [
          TextField(
            controller: firstNameController,
            style: TextStyle(
              color: Colors.black,
            ),
            onChanged: (value) => updateFirstName(),
            decoration: InputDecoration(
                labelText: "First Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 15.0,
              bottom: 15.0,
            ),
            child: TextField(
              controller: lastNameController,
              style: TextStyle(
                color: Colors.black,
              ),
              onChanged: (value) => updateLastname(),
              decoration: InputDecoration(
                  labelText: "Last Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
            ),
          ),
          ListTile(
            title: DropdownButton<String>(
              value: selectedItem,
              items: _gendersDropDownList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (item){
                setState(() {
                  selectedItem = item;
                  updateGender(selectedItem!);
                });
              },
              style: const TextStyle(color: Colors.deepPurple),
              // style: tex,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                textColor: Colors.blueAccent,
                padding: EdgeInsets.all(10.0),
                onPressed: () {
                  saveStudent();
                },
                child: Text(
                    "Save"
                ),
              ),

              RaisedButton(
                textColor: Colors.red,
                padding: EdgeInsets.all(10.0),
                onPressed: () {},
                child: Text(
                    "Delete"
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }



  void updateGender(String value) {
    switch (value) {
      case "Male":
        student!.gender = 1;
        break;
      case "Female":
        student!.gender = 2;
        break;

      case "N/A":
        student!.gender = 3;
        break;
      default:
    }
  }

  void saveStudent() async{
    student?.id = 0;
    var saveResponse = await StudentService.postStudent(student!);

    saveResponse == true ? Navigator.pop(context, true) : null;
  }

  void updateFirstName() {
    student?.firstName = firstNameController.text;
  }

  void updateLastname() {
    student?.lastName = lastNameController.text;
  }
}
