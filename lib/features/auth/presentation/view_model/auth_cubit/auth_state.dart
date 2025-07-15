abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}
class LoginLoading extends AuthState {}
class ForgotPasswordLoading extends AuthState {}
class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  final String message;
  RegisterFailure(this.message);
}

class LoginSuccess extends AuthState {
  final String token;

  LoginSuccess(this.token);
}
class ForgotPasswordSuccess extends AuthState {
  final String message;
  ForgotPasswordSuccess(this.message);
}

class ForgotPasswordFailure extends AuthState {
  final String message;
  ForgotPasswordFailure(this.message);
}

class LoginFailure extends AuthState {
  final String message;
  LoginFailure(this.message);
}
