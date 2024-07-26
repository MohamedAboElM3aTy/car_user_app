import 'package:auth/auth.dart';
import 'package:auth/di/injection_container.dart';
import 'package:auth/entity/app_user.dart';
import 'package:auth/presentation/cubit/authentication_cubit.dart';
import 'package:auth/presentation/widgets/forget_password.dart';
import 'package:auth/presentation/widgets/login_body.dart';
import 'package:auth/presentation/widgets/password_validations.dart';
import 'package:auth/presentation/widgets/sign_up_body.dart';
import 'package:core/core.dart';
import 'package:core/views/widgets/page_title.dart';
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
  late final TextEditingController _emailController,
      _passwordController,
      _firstNameController,
      _lastNameController;
  late final FocusNode _emailFocusNode,
      _passwordFocusNode,
      _firstNameFocusNode,
      _lastNameFocusNode;
  var _authForm = AuthForm.login;
  late final AuthenticationCubit _authCubit;
  bool hasLowerCase = false, hasUpperCase = false, hasSpecialCharacters = false;

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
    setupPasswordControllerListener();
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

  void setupPasswordControllerListener() {
    _passwordController.addListener(
      () {
        setState(
          () {
            hasLowerCase = AppRegex.hasLowerCase(_passwordController.text);
            hasUpperCase = AppRegex.hasUpperCase(_passwordController.text);
            hasSpecialCharacters =
                AppRegex.hasSpecialCharacter(_passwordController.text);
          },
        );
      },
    );
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
                  PageTitle(
                    title: _authForm == AuthForm.register ? 'Sign Up' : 'Login',
                    style: context.textTheme.labelMedium!.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: context.primaryColor,
                    ),
                  ),
                  10.emptyHeight,
                  _authForm == AuthForm.register
                      ? SignUpBody(
                          emailController: _emailController,
                          passwordController: _passwordController,
                          passwordFocusNode: _passwordFocusNode,
                          firstNameController: _firstNameController,
                          firstNameFocusNode: _firstNameFocusNode,
                          authForm: _authForm,
                          lastNameFocusNode: _lastNameFocusNode,
                          lastNameController: _lastNameController,
                          emailFocusNode: _emailFocusNode,
                        )
                      : LoginBody(
                          emailController: _emailController,
                          emailFocusNode: _emailFocusNode,
                          authForm: _authForm,
                          passwordFocusNode: _passwordFocusNode,
                          passwordController: _passwordController,
                        ),
                  15.emptyHeight,
                  _authForm == AuthForm.register
                      ? PasswordValidations(
                          hasLowerCase: hasLowerCase,
                          hasUpperCase: hasUpperCase,
                          hasSpecialCharacters: hasSpecialCharacters,
                        )
                      : const SizedBox.shrink(),
                  _authForm == AuthForm.login
                      ? const ForgetPassword()
                      : const SizedBox.shrink(),
                  50.emptyHeight,
                  BlocConsumer<AuthenticationCubit, AuthenticationState>(
                    bloc: _authCubit,
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () => null,
                        authenticated: (isUserInHisApp, user) async {
                          if (isUserInHisApp) {
                            context.read<AuthCubit>().setUser(user);
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
                  30.emptyHeight,
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        _formKey.currentState!.reset();
                        setState(() {
                          if (_authForm == AuthForm.login) {
                            _authForm = AuthForm.register;
                          } else {
                            _authForm = AuthForm.login;
                          }
                        });
                      },
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
