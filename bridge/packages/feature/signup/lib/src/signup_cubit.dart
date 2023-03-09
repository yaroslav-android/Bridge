import 'package:bloc/bloc.dart';

import 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState.empty());

  void toggleObscurePassword() {
    emit(state.copy(isPasswordObscured: !state.isPasswordObscured));
  }

  void toggleObscureConfirmPassword() {
    emit(state.copy(
      isConfirmPasswordObscured: !state.isConfirmPasswordObscured,
    ));
  }

  void setEmail(String email) {
    emit(state.copy(email: email));
  }

  void setNickname(String nickname) {
    emit(state.copy(nickname: nickname));
  }

  void setPassword(String password) {
    emit(state.copy(password: password));
  }

  void setConfirmPassword(String password) {
    emit(state.copy(confirmPassword: password));
  }
}
