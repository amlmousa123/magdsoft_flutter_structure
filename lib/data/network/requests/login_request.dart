import 'package:magdsoft_flutter_structure/constants/end_points.dart';

import '../../remote/dio_helper.dart';

class LoginRequest {
   String login_API_URL = baseURL+login_endPoint;

  Future<Map<String, dynamic>> login(String email, String password) async {
    var body = {
      'email': email,
      'password': password,
    };
    try {
      var response = await DioHelper.postData(
          url: login_API_URL, body: body);
      print(response);
      return response.data;
    }catch (e) {
      print(e.toString());
      return {};
    }
  }
}