import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:user_home/features/home/data/enums/book_request_status.dart';

class BookingHistoryCard extends StatelessWidget {
  const BookingHistoryCard({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking #${bookModel.id}',
              style: context.textTheme.labelSmall!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildStatusChip(bookModel.status),
            _buildInfoRow(
              Icons.directions_car,
              'Car ID',
              bookModel.carId.toString(),
            ),
            const Gap(10),
            _buildInfoRow(
              Icons.calendar_today,
              'From',
              _formatDate(bookModel.startDate),
            ),
            const Gap(10),
            _buildInfoRow(
              Icons.event,
              'To',
              _formatDate(bookModel.endDate),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: Colors.grey),
        SizedBox(width: 8.w),
        Text('$label:', style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
        SizedBox(width: 4.w),
        Text(value, style: TextStyle(fontSize: 14.sp)),
      ],
    );
  }

  Widget _buildStatusChip(BookRequestStatus status) {
    Color chipColor;
    String statusName;
    switch (status) {
      case BookRequestStatus.requestSent:
        chipColor = Colors.green;
        statusName = 'Request Sent';
        break;
      case BookRequestStatus.cancelled:
        chipColor = Colors.red;
        statusName = 'Cancelled';
        break;
      case BookRequestStatus.confirmed:
        chipColor = Colors.blue;
        statusName = 'Completed';
        break;
      default:
        chipColor = Colors.grey;
        statusName = 'Unknown';
    }

    return Chip(
      label: Text(
        statusName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
        ),
      ),
      backgroundColor: chipColor,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMM d, yyyy').format(date);
  }
}
