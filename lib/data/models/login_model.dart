import 'account_model.dart';

class LoginModel {
  int? status;
  List<Account>? accounts;

  LoginModel({this.status, this.accounts});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['account'] != null) {
      accounts = <Account>[];
      json['account'].forEach((account) {
        account!.add(Account.fromJson(account));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (accounts != null) {
      data['account'] = accounts!.map((account) => account.toJson()).toList();
      return data;
    }
    return {};
  }
}