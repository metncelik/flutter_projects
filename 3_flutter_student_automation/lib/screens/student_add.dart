import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students = [];
  StudentAdd(this.students, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var FormKey = GlobalKey<FormState>();
  Student student = Student("", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yeni Öğrenci Ekle")),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
            key: FormKey,
            child: Column(
              children: <Widget>[
                buildNameField(),
                buildGrade(),
                const SizedBox(
                  height: 10.0,
                ),
                buildSubmitButton()
              ],
            )),
      ),
    );
  }

  buildNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Öğrenci Adı"),
      onSaved: (value) {
        student.name = value!;
      },
    );
  }

  buildGrade() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Not"),
      onSaved: (value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
        onPressed: () {
          FormKey.currentState?.save();
          widget.students.add(student);
          Navigator.of(context).pop();
        },
        child: const Text("Kaydet"));
  }
}
 //validation