import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'history_booking_state.dart';

class HistoryBookingCubit extends Cubit<HistoryBookingState> {
  HistoryBookingCubit() : super(HistoryBookingInitial());
}
