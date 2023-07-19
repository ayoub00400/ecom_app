abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginDone extends LoginState {}

class LoginFailed extends LoginState {}

class LoginError extends LoginState {
  final String erroString;
  LoginError(this.erroString);
}

class UserAlreadyLoggedIn extends LoginState {}

class UserNotLoggedInYet extends LoginState {}
