import 'package:common/common.dart';

class SignUpState implements Copyable<SignUpState> {
  SignUpState({
    required this.isPasswordObscured,
    required this.isConfirmPasswordObscured,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.nickname,
  });

  SignUpState.empty()
      : isPasswordObscured = true,
        isConfirmPasswordObscured = true,
        email = '',
        password = '',
        confirmPassword = '',
        nickname = '';

  final bool isPasswordObscured;
  final bool isConfirmPasswordObscured;
  final String email;
  final String password;
  final String confirmPassword;
  final String nickname;

  @override
  SignUpState copy({
    bool? isPasswordObscured,
    bool? isConfirmPasswordObscured,
    String? email,
    String? password,
    String? confirmPassword,
    String? nickname,
  }) {
    return SignUpState(
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      isConfirmPasswordObscured:
          isConfirmPasswordObscured ?? this.isConfirmPasswordObscured,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      nickname: nickname ?? this.nickname,
    );
  }
}
