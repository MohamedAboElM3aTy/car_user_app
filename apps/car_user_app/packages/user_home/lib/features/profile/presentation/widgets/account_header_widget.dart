import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_home/features/profile/presentation/widgets/owner_details.dart';

class AccountHeaderWidget extends StatefulWidget {
  const AccountHeaderWidget({
    super.key,
    required this.isAdmin,
  });

  final bool isAdmin;

  @override
  State<AccountHeaderWidget> createState() => _AccountHeaderWidgetState();
}

class _AccountHeaderWidgetState extends State<AccountHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.isAdmin ? const SizedBox.shrink() : const OwnerDetails(),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.isAuthenticated == false) {
              context.showSnackBar(
                message: 'Logout Successful',
                state: SnackBarStates.success,
              );
              context.navigator.pushReplacementNamed(AppRoutes.authRoute);
            }
          },
          builder: (context, state) {
            return widget.isAdmin
                ? InkWell(
                    onTap: () async => context.read<AuthCubit>().logout(),
                    child: Icon(
                      Icons.logout,
                      size: 24.sp,
                      color: context.seedColor.onError,
                    ),
                  )
                : TextButton.icon(
                    onPressed: () async => context.read<AuthCubit>().logout(),
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
