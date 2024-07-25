import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.emailController,
    required this.emailFocusNode,
    required this.authForm,
    required this.passwordFocusNode,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final AuthForm authForm;
  final FocusNode passwordFocusNode;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedTextField(
          controller: emailController,
          focusNode: emailFocusNode,
          autoFocus: authForm == AuthForm.login,
          onEditingComplete: () =>
              FocusScope.of(context).requestFocus(passwordFocusNode),
          changed: (email) => emailController.text = email,
          validator: (email) {
            if (email == null || email.isEmpty || !email.contains('@')) {
              return 'Please Enter valid Email';
            }
            return null;
          },
          hintText: 'Email',
        ),
        PasswordTextField(
          controller: passwordController,
          focusNode: passwordFocusNode,
          onTap: (password) => passwordController.text = password,
          validator: (password) {
            if (password == null || password.isEmpty || password.length < 8) {
              return authForm == AuthForm.register
                  ? 'Enter A valid Password'
                  : 'Wrong Password';
            }
            return null;
          },
        ),
      ],
    );
  }
}
