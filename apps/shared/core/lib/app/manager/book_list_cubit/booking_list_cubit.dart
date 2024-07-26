import 'package:core/app/data/services/database_service_impl.dart';
import 'package:core/app/data/services/database_services.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_list_state.dart';

/// [This cubit to fetch book table from supabase]
class BookingListCubit extends Cubit<BookingListState> {
  late final DatabaseServices _databaseServices;
  BookingListCubit() : super(const BookingListState()) {
    _databaseServices = DatabaseServiceImpl();
  }

  Future<void> getBookings() async {
    emit(state.loading());
    final result = await _databaseServices.fetch(
      table: DataBaseConstants.bookTable,
      responseFromMap: (json) => json['data']
          .map<BookModel>((booking) => BookModel.fromJson(booking))
          .toList(),
    );
    result.fold(
      (failure) => emit(state.error(failure)),
      (bookings) => emit(state.success(bookings)),
    );
  }
}