import 'package:demo/model/course_list_model.dart';
import 'package:flutter/material.dart';

import '../services/db_helper.dart';
import '../services/languages_category_services.dart';

class HomeScreenController extends ChangeNotifier {
  GetCourses? getCourses;

  categoryList() async {
    getCourses = await LanguageCategoryService().categoryList();

    notifyListeners();
    return getCourses;
  }
}
