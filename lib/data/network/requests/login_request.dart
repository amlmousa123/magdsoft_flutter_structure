import 'package:magdsoft_flutter_structure/constants/end_points.dart';

import '../../remote/dio_helper.dart';

class LoginRequest {

  Future<Map<String, dynamic>> login(String email, String password) async {
    var body = {
      'email': email,
      'password': password,
    };
    try {
      var response = await DioHelper.postData(
          url:loginUrl, body: body);
      print(response);
      return response.data;
    }catch (e) {
      print(e.toString());
      return {};
    }
  }
}