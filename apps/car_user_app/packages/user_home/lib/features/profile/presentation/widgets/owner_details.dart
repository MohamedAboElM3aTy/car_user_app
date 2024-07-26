import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OwnerDetails extends StatefulWidget {
  const OwnerDetails({super.key});

  @override
  State<OwnerDetails> createState() => _OwnerDetailsState();
}

class _OwnerDetailsState extends State<OwnerDetails> {
  // TODO: To fetch user name
  // late final GetProfileDataCubit _profileCubit;
  // final SupabaseAuthService _auth = SupabaseAuthImplementation();
  // late final String _name;

  @override
  void initState() {
    super.initState();
    // _profileCubit = BlocProvider.of<GetProfileDataCubit>(context);
    // _name = _auth.getCurrentUserName()?.userMetadata?['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image: const DecorationImage(
              image: AssetImage(
                AppImages.onBoardingImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        10.w.horizontalSpace,
        Text(
          'Mohamed',
          style: context.textTheme.labelLarge!.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: context.primaryColor,
          ),
        ),
        // BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
        //   builder: (context, state) {
        //     return state.maybeWhen(
        //       orElse: () => const Text('Un Named User'),
        //       error: (message) => Text(message),
        //       success: (user) {
        //         final name = user.userMetadata!['name'] as String;
        //         return Text(name);
        //       },
        //     );
        //   },
        // ),
      ],
    );
  }
}
