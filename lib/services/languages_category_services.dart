import 'package:demo/model/course_list_model.dart';
import 'package:dio/dio.dart';

import '../components/indicators.dart';

class LanguageCategoryService {
  final Dio _dio = Dio();

  Future<GetCourses?> categoryList() async {
    try {
      showLoadingIndicator();

      final Response response = await _dio.get(
        'https://mlcompiler.000webhostapp.com/compile/getcourses.php',
      );
      hideLoadingIndicator();
      print(response.data);
      GetCourses.fromJson(response.data);

    } catch (e) {
      print('${e}');
    }

    return null;
  }
}
