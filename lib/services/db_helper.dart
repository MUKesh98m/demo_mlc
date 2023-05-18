import 'package:demo/model/course_list_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Future<Database> database() async {
    // Open the database
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "database.db");

     return openDatabase(path, version: 1, onCreate: (db, version) {
      // Create tables
      db.execute('CREATE TABLE courses (id INTEGER PRIMARY KEY, courseName TEXT,image TEXT,createdAt TEXT)');
      print("db created");
    });
  }


  static Future<void> insertData(GetCourses getCourses) async {
    final db = await database();
    await db.insert('courses', getCourses.toJson());
  }
}
