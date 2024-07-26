import 'package:core/core.dart';
import 'package:core/views/booking_history/widgets/booking_history_card.dart';
import 'package:core/views/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_home/features/profile/presentation/widgets/account_header_widget.dart';

class AdminBookingHistoryScreen extends StatelessWidget {
  const AdminBookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BookingListCubit()..getBookings(),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EllipticalContainer(bottom: context.screenHeight * 0.7),
        Positioned(
          top: context.screenHeight * 0.15,
          left: 25.0,
          right: 0.0,
          bottom: 0.0,
          child: const PageTitle(title: 'Booking History'),
        ),
        Positioned(
          top: 30.h,
          left: 20.w,
          child: AccountHeaderWidget(isAdmin: true),
        ),
        BlocBuilder<BookingListCubit, BookingListState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Positioned(
                top: context.screenHeight * 0.22,
                left: 25.0,
                right: 25.0,
                bottom: 0.0,
                child: const ContainerShimmer(),
              );
            }
            if (state.failure != null) {
              return EmptyScreen(
                message: 'Error Fetching: ${state.failure.toString()}',
              );
            } else if (state.booking.isEmpty) {
              return const EmptyScreen(message: 'No Car Bookings Yet');
            } else if (state.booking.isNotEmpty) {
              return Positioned(
                top: context.screenHeight * 0.22,
                left: 25.0,
                right: 25.0,
                bottom: 0.0,
                child: ListView.builder(
                  itemCount: state.booking.length,
                  itemBuilder: (context, index) {
                    final booking = state.booking[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: BookingHistoryCard(bookModel: booking),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text('No Bookings'),
              );
            }
          },
        ),
      ],
    );
  }
}
