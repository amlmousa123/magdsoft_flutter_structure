import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import '../../data/models/account_model.dart';
import '../../data/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);
  late Account account;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: loginUrl, body: {
      'email':email,
      'password':password
    }).then((value){
      account = Account.fromJson(value.data);
      emit(LoginSuccessState(account));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
      print('error is ${error.toString()}');
    });
  }
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerUrl, body: {
      'email':email,
      'password':password,
      'name':name,
      'phone':phone,
    }).then((value){
      userLogin(email: email, password: password);
      emit(RegisterSuccessState());
    }).catchError((error){
      emit(RegisterErrorState(error.toString()));
      print('error is ${error.toString()}');
    });
  }
}
