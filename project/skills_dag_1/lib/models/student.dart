class Student {
  final String image;
  final String name;
  final int id;
  final int minuten;
  Student(this.image, this.name, this.id, this.minuten);
  static Student FromJson(Map<String, dynamic> json) {
    return Student(
      json["student"]["foto"],
      json["student"]["naam"],
      json["student"]["id"],
      json["student"]["minuten"]
      );
  }
  static Student empty() {
    return Student("", "", 0, 0);
  }
}



 //{"success":true,"student":{"id":6,"naam":"Daan Willems","foto":"https:\/\/mobileapp.canvasaccept.com\/api\/photo-student\/6","minuten":9}}