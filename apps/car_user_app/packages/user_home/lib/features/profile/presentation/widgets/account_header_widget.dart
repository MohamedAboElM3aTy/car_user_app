import 'package:auth/presentation/cubit/logout_cubit.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_home/features/profile/presentation/widgets/owner_details.dart';

class AccountHeaderWidget extends StatefulWidget {
  const AccountHeaderWidget({super.key});

  @override
  State<AccountHeaderWidget> createState() => _AccountHeaderWidgetState();
}

class _AccountHeaderWidgetState extends State<AccountHeaderWidget> {
  late final LogoutCubit _logoutCubit;

  @override
  void initState() {
    _logoutCubit = BlocProvider.of<LogoutCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const OwnerDetails(),
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
                context.navigator.pushNamed(AppRoutes.authRoute);
              },
              orElse: () => LoadingAlert.remove(context),
            );
          },
          builder: (context, state) {
            return TextButton.icon(
              onPressed: () async => await _logoutCubit.logOut(),
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
