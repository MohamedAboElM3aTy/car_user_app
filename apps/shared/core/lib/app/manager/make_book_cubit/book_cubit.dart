import 'package:core/app/data/services/database_service_impl.dart';
import 'package:core/app/data/services/database_services.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_home/features/home/data/models/request/book_request_model.dart';

part 'book_state.dart';
part 'book_cubit.freezed.dart';

class BookCubit extends Cubit<BookState> {
  late final DatabaseServices _databaseServices;
  BookCubit() : super(const BookState.initial()) {
    _databaseServices = DatabaseServiceImpl();
  }

  Future<void> makeBook(BookRequestModel requestModel) async {
    emit(const BookState.loading());
    final result = await _databaseServices.insert(
      table: DataBaseConstants.bookTable,
      requestModel: requestModel,
      responseFromMap: BookModel.fromJson,
    );
    result.fold(
      (error) => emit(BookState.error(failure: error)),
      (data) => emit(const BookState.loaded()),
    );
  }
}
