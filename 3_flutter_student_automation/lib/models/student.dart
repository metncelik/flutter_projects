class Student {
  int id = 0;
  String name = "İsim";
  int grade = 00;
  String status = "Bilinmiyor";

  Student(String name, int grade) {
    //ignore: prefer_initializing_formals
    this.name = name;
    //ignore: prefer_initializing_formals
    this.grade = grade;
  }

  Student.withId(int id, String name, int grade) {
    //ignore: prefer_initializing_formals
    this.id = id;
    //ignore: prefer_initializing_formals
    this.name = name;
    //ignore: prefer_initializing_formals
    this.grade = grade;
  }
  String get setStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (grade > 40) {
      message = "Bütünlemeye kaldı";
    } else {
      message = "Kaldı";
    }
    this.status = message;
    return status;
  }
}
