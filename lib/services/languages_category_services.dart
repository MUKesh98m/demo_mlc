

import 'package:demo/model/course_list_model.dart';
import 'package:dio/dio.dart';

import '../components/indicators.dart';

class LanguageCategoryService {
  final Dio _dio = Dio();

  Future<GetCourses?> categoryList() async {
    try {

      final Response response = await _dio.get(
          'https://mlcompiler.000webhostapp.com/compile/getcourses.php',
           );
      hideLoadingIndicator();
      return GetCourses.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
