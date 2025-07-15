import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_tumour_detector/features/auth/data/repositories/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  void register({
    required Map<String, dynamic> data,
  }) async {
    emit(RegisterLoading());
    final result = await authRepo.register(data: data);
    result.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (message) => emit(RegisterSuccess()),
    );
  }

  void login({
  required String email,
  required String password,
}) async {
  emit(LoginLoading());

  final result = await authRepo.login(email: email, password: password);

  result.fold(
    (failure) => emit(LoginFailure(failure.message)),
    (token) {
      
      saveToken(token);
      emit(LoginSuccess(token)); 
    },
  );
}

void forgetPassword(String emailOrPhone) async {
  emit(ForgotPasswordLoading());

  final result = await authRepo.forgetPassword(emailOrPhone);

  result.fold(
    (failure) => emit(ForgotPasswordFailure(failure.message)),
    (message) => emit(ForgotPasswordSuccess(message)),
  );
}

void saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}
}
