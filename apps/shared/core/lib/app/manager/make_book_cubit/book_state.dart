part of 'book_cubit.dart';

@freezed
class BookState with _$BookState {
  const factory BookState.initial() = _Initial;

  const factory BookState.loading() = _Loading;

  const factory BookState.loaded() = _Loaded;

  const factory BookState.error({
    required Failure failure,
  }) = _Error;
}
