import 'package:core/core.dart';
import 'package:core/views/widgets/page_title.dart';
import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override

  /// [A screen to view the booking history]
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const EllipticalContainer(),
          Positioned(
            top: context.screenHeight * 0.12,
            left: 25.0,
            right: 0.0,
            bottom: 0.0,
            child: const PageTitle(title: 'History'),
          ),
          const BookingDetailsHistory(),
        ],
      ),
    );
  }
}

class BookingDetailsHistory extends StatelessWidget {
  const BookingDetailsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (_) => BookingListCubit()..getBookings(),
    // );
    return const SizedBox.shrink();
  }
}
