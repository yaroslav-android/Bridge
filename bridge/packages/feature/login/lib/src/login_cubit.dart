import 'package:bloc/bloc.dart';
import 'package:login/src/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.empty());

  void toggleObscureText() {
    emit(state.copy(isTextObscured: !state.isTextObscured));
  }

  void setEmail(String email) {
    emit(state.copy(email: email));
  }

  void setPassword(String password) {
    emit(state.copy(password: password));
  }
}
