import 'package:auth/presentation/widgets/login_body.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  SignUpBody({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
    required this.firstNameFocusNode,
    required this.lastNameFocusNode,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    this.authForm = AuthForm.register,
  });

  final TextEditingController firstNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController lastNameController;
  final FocusNode firstNameFocusNode;
  AuthForm authForm;
  final FocusNode lastNameFocusNode;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedTextField(
          controller: firstNameController,
          focusNode: firstNameFocusNode,
          onEditingComplete: () =>
              FocusScope.of(context).requestFocus(lastNameFocusNode),
          changed: (firstName) => firstNameController.text = firstName,
          validator: (firstName) {
            if (firstName!.isEmpty) {
              return 'Please Enter Valid Name';
            }
            return null;
          },
          hintText: 'First Name',
        ),
        RoundedTextField(
          controller: lastNameController,
          focusNode: lastNameFocusNode,
          autoFocus: false,
          onEditingComplete: () =>
              FocusScope.of(context).requestFocus(emailFocusNode),
          changed: (lastName) => lastNameController.text = lastName,
          validator: (lastName) {
            if (lastName!.isEmpty) {
              return 'Please Enter Valid Name';
            }
            return null;
          },
          hintText: 'Last Name',
        ),
        LoginBody(
          emailController: emailController,
          emailFocusNode: emailFocusNode,
          authForm: authForm,
          passwordFocusNode: passwordFocusNode,
          passwordController: passwordController,
        ),
      ],
    );
  }
}
