class Course {
  int? id;
  String? namaCourse;
  String? tutor;
  String? kategori;

  Course({this.id, this.namaCourse, this.tutor, this.kategori});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaCourse = json['course_name'];
    tutor = json['pengajar'];
    kategori = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_name'] = this.namaCourse;
    data['pengajar'] = this.tutor;
    data['category'] = this.kategori;
    return data;
  }
}
