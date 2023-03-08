import 'package:common/common.dart';

class LoginState implements Copyable<LoginState> {
  LoginState({
    required this.isTextObscured,
    required this.email,
    required this.password,
  });

  LoginState.empty()
      : isTextObscured = true,
        email = '',
        password = '';

  final bool isTextObscured;
  final String email;
  final String password;

  @override
  LoginState copy({bool? isTextObscured, String? email, String? password}) {
    return LoginState(
      isTextObscured: isTextObscured ?? this.isTextObscured,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
