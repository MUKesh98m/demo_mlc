// To parse this JSON data, do
//
//     final getCourses = getCoursesFromJson(jsonString);

import 'dart:convert';

GetCourses getCoursesFromJson(String str) => GetCourses.fromJson(json.decode(str));

String getCoursesToJson(GetCourses data) => json.encode(data.toJson());

class GetCourses {
  List<Course>? course;

  GetCourses({
    this.course,
  });

  factory GetCourses.fromJson(Map<String, dynamic> json) => GetCourses(
    course: json["course"] == null ? [] : List<Course>.from(json["course"]!.map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "course": course == null ? [] : List<dynamic>.from(course!.map((x) => x.toJson())),
  };
}

class Course {
  String? id;
  String? courseName;
  String? image;
  String? createdAt;
  String? updatedAt;

  Course({
    this.id,
    this.courseName,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    courseName: json["course_name"],
    image: json["image"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course_name": courseName,
    "image": image,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
