import 'package:auth/di/injection_container.dart';
import 'package:auth/entity/app_user.dart';
import 'package:auth/presentation/cubit/authentication_cubit.dart';
import 'package:auth/presentation/widgets/forget_password.dart';
import 'package:auth/presentation/widgets/password_requirements.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.userRole});

  final UserRole userRole;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _firstNameFocusNode;
  late final FocusNode _lastNameFocusNode;
  var _authForm = AuthForm.login;
  late final AuthenticationCubit _authCubit;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
    _authCubit = getIt<AuthenticationCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _authCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30.0,
            horizontal: 30.0,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _authForm == AuthForm.login ? 'Login' : 'Sign Up',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: context.primaryColor,
                    ),
                  ),
                  20.emptyHeight,
                  _authForm == AuthForm.register
                      ? RoundedTextField(
                          controller: _firstNameController,
                          focusNode: _firstNameFocusNode,
                          autoFocus:
                              _authForm == AuthForm.register ? true : false,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_lastNameFocusNode),
                          changed: (firstName) =>
                              _firstNameController.text = firstName,
                          validator: (firstName) {
                            if (firstName!.isEmpty) {
                              return 'Please Enter Valid Name';
                            }
                            return null;
                          },
                          hintText: 'First Name',
                        )
                      : const SizedBox.shrink(),
                  _authForm == AuthForm.register
                      ? RoundedTextField(
                          controller: _lastNameController,
                          focusNode: _lastNameFocusNode,
                          autoFocus: false,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          changed: (lastName) =>
                              _lastNameController.text = lastName,
                          validator: (lastName) {
                            if (lastName!.isEmpty) {
                              return 'Please Enter Valid Name';
                            }
                            return null;
                          },
                          hintText: 'Last Name',
                        )
                      : const SizedBox.shrink(),
                  RoundedTextField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    autoFocus: _authForm == AuthForm.login ? true : false,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    changed: (email) => _emailController.text = email,
                    validator: (email) {
                      if (email == null ||
                          email.isEmpty ||
                          !email.contains('@')) {
                        return 'Please Enter valid Email';
                      }
                      return null;
                    },
                    hintText: 'Email',
                  ),
                  PasswordTextField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    onTap: (password) => _passwordController.text = password,
                    validator: (password) {
                      if (password == null ||
                          password.isEmpty ||
                          password.length < 8) {
                        return _authForm == AuthForm.register
                            ? 'Enter A valid Password'
                            : 'Wrong Password';
                      }
                      return null;
                    },
                  ),
                  15.emptyHeight,
                  _authForm == AuthForm.register
                      ? const PasswordRequirements()
                      : const SizedBox.shrink(),
                  // 30.emptyHeight,
                  _authForm == AuthForm.login
                      ? const ForgetPassword()
                      : const SizedBox.shrink(),
                  50.emptyHeight,
                  BlocConsumer<AuthenticationCubit, AuthenticationState>(
                    bloc: _authCubit,
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () => null,
                        authenticated: (isUserInHisApp) async {
                          if (isUserInHisApp) {
                            widget.userRole == UserRole.user
                                ? context.navigator.pushReplacementNamed(
                                    AppRoutes.userHomeRoute)
                                : context.navigator.pushReplacementNamed(
                                    AppRoutes.adminHomeRoute);
                            _formKey.currentState!.reset();
                            context.showSnackBar(
                              message: 'Login Success',
                              snackBarType: SnackBarStates.success,
                            );
                          } else {
                            return context.showSnackBar(
                              message: 'User Not registered',
                              snackBarType: SnackBarStates.error,
                            );
                          }
                        },
                        error: (message) {
                          context.showSnackBar(
                            message: message,
                            snackBarType: SnackBarStates.error,
                          );
                        },
                      );
                    },
                    builder: (context, state) {
                      return AppButton(
                        width: context.screenWidth * 0.9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        isLoading: state.maybeWhen(
                          orElse: () => false,
                          loading: () => true,
                        ),
                        onPressed: () async {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            final appUser = AppUser(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              userRole: widget.userRole,
                            );
                            if (_authForm == AuthForm.login) {
                              await _authCubit.signIn(appUser: appUser);
                            } else {
                              await _authCubit.signUp(appUser: appUser);
                            }
                          }
                        },
                        label:
                            _authForm == AuthForm.login ? 'Login' : 'Sign Up',
                      );
                    },
                  ),
                  20.emptyHeight,
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () => setState(
                        () {
                          _formKey.currentState!.reset();
                          if (_authForm == AuthForm.login) {
                            _authForm = AuthForm.register;
                          } else {
                            _authForm = AuthForm.login;
                          }
                        },
                      ),
                      child: Text(
                        _authForm == AuthForm.login
                            ? 'Don\'t have an account ? Register'
                            : 'Already have an account ? Login',
                        style: context.textTheme.labelMedium?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
