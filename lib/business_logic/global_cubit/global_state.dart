part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

//login states
class LoginLoadingState extends GlobalState {}

class LoginSuccessState extends GlobalState {
  final Account account;
  LoginSuccessState(this.account);
}

class LoginErrorState extends GlobalState {
  final String error;
  LoginErrorState(this.error);
}

//register states
class RegisterLoadingState extends GlobalState {}

class RegisterSuccessState extends GlobalState {
}

class RegisterErrorState extends GlobalState {
  final String error;
  RegisterErrorState(this.error);
}

