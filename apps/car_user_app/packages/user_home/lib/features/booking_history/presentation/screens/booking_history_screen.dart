import 'package:core/core.dart';
import 'package:core/views/widgets/page_title.dart';
import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          EllipticalContainer(),
          PageTitle(
            title: 'Booking History',
          ),
        ],
      ),
    );
  }
}
