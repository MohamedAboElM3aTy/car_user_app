part of 'booking_list_cubit.dart';

class BookingListState extends Equatable {
  final bool isLoading;
  final Failure? failure;
  final BookModel? booking;

  const BookingListState({
    this.isLoading = false,
    this.booking,
    this.failure,
  });

  BookingListState loading() {
    return copyWith(
      isLoading: true,
      failure: null,
      booking: null,
    );
  }

  BookingListState success(BookModel booking) {
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
      booking: null,
    );
  }

  BookingListState copyWith({
    bool? isLoading,
    Failure? failure,
    BookModel? booking,
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
