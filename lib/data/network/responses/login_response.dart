import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';

import '../../models/login_model.dart';

class LoginRepoistry {
final LoginRequest loginRequest;

LoginRepoistry(this.loginRequest);

Future<LoginModel> getLoginInfo(String name, String password) async {
  final user = await loginRequest.login(name, password);
  return LoginModel.fromJson(user);
}
}