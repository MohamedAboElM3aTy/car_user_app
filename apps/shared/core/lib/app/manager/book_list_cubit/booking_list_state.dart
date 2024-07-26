part of 'booking_list_cubit.dart';

class BookingListState extends Equatable {
  final bool isLoading;
  final List<BookModel> booking;
  final Failure? failure;

  const BookingListState({
    this.isLoading = false,
    this.booking = const [],
    this.failure,
  });

  BookingListState loading() {
    return copyWith(
      isLoading: true,
      failure: null,
      booking: [],
    );
  }

  BookingListState success(List<BookModel> booking) {
    return copyWith(
      isLoading: false,
      failure: null,
      booking: booking,
    );
  }

  BookingListState error(Failure failure) {
    return copyWith(
      isLoading: false,
      failure: failure,
      booking: [],
    );
  }

  BookingListState copyWith({
    bool? isLoading,
    List<BookModel>? booking,
    Failure? failure,
  }) {
    return BookingListState(
      isLoading: isLoading ?? this.isLoading,
      booking: booking ?? this.booking,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [isLoading, booking, failure];
}
