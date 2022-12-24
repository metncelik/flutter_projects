import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/student.dart';
import 'package:flutter_application_3/screens/student_add.dart';

const Color darkBlue = Color.fromARGB(255, 18, 37, 42);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
        home: const HomeScreen());
  }
}

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Student> students = [
    Student.withId(1, "Metin", 75),
    Student.withId(2, "Meto", 45),
    Student.withId(3, "Memo", 10)
  ];

  Student selectedStudent = Student.withId(0, "Boş", 0);

  void _func(Student sstudent) {
    setState(() {
      selectedStudent = sstudent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Student Automation"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(students[index].name),
                      trailing: buildStatusIcon(students[index].grade),
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"),
                      ),
                      subtitle: Text(
                          "Not: ${students[index].grade} [${students[index].setStatus}]"),
                      onTap: () {
                        _func(students[index]);
                        print(selectedStudent.name);
                      },
                      onLongPress: () {
                        print("Uzun Basıldı");
                      },
                    );
                  },
                ),
              ),
              Text("Seçili Öğrenci: ${selectedStudent.name}"),
              const SizedBox(
                height: 5.0,
              ),
              Row(children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // background
                      foregroundColor: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StudentAdd(students)));
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.add),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Yeni Öğrenci")
                      ],
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 108, 54, 244), // background
                      foregroundColor: Colors.white, // foreground
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.update),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Güncelle")
                      ],
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 11, 66, 46), // background
                      foregroundColor: Colors.white, // foreground
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.remove),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Sil")
                      ],
                    ),
                  ),
                ),
              ])
            ],
          ),
        ));
  }
}

Widget buildStatusIcon(grade) {
  if (grade >= 50) {
    return Icon(Icons.done);
  } else if (grade >= 40) {
    return Icon(Icons.album);
  } else {
    return Icon(Icons.clear);
  }
}
