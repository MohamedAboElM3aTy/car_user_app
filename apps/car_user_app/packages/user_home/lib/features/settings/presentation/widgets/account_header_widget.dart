import 'package:auth/presentation/cubit/authentication_cubit.dart';
import 'package:auth/presentation/cubit/logout_cubit.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_home/features/settings/presentation/widgets/owner_details.dart';

class AccountHeaderWidget extends StatefulWidget {
  const AccountHeaderWidget({super.key});

  @override
  State<AccountHeaderWidget> createState() => _AccountHeaderWidgetState();
}

class _AccountHeaderWidgetState extends State<AccountHeaderWidget> {
  Future<void> _logOut(BuildContext context) async {
    LoadingAlert.show(context);
    await _logoutCubit.logOut();
  }

  late final LogoutCubit _logoutCubit;

  @override
  void initState() {
    _logoutCubit = BlocProvider.of<LogoutCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: OwnerDetails(),
        ),
        SizedBox(width: 10.w),
        BlocConsumer<LogoutCubit, LogoutState>(
          bloc: _logoutCubit,
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                LoadingAlert.remove(context);
                context.showSnackBar(
                  message: 'Ops An error Occur',
                  state: SnackBarStates.error,
                );
              },
              success: () {
                LoadingAlert.remove(context);
                context.showSnackBar(
                  message: 'Logout Success',
                  state: SnackBarStates.success,
                );
                BlocProvider.of<AuthenticationCubit>(context).logout();
                context.navigator.pushNamed(AppRoutes.userHomeRoute);
              },
              orElse: () => LoadingAlert.remove(context),
            );
          },
          builder: (context, state) {
            return TextButton.icon(
              onPressed: () => _logOut(context),
              icon: Icon(
                Icons.logout,
                color: context.primaryColor,
              ),
              label: const Text('Logout'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.blackColor,
              ),
            );
          },
        ),
      ],
    );
  }
}
