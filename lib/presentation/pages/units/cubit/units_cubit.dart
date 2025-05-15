// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/core/common/pagination/list_page.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/entities/booking.dart';
import 'package:mynt/domain/usecases/get_bookings_data_usecase.dart';

part 'units_state.dart';

@injectable
class UnitsCubit extends Cubit<UnitsState> {
  UnitsCubit(this._getBookingsDataUsecase) : super(UnitsInitial());
  final GetBookingsDataUsecase _getBookingsDataUsecase;

  static UnitsCubit get(BuildContext context) => BlocProvider.of(context);

  PagingController<int, Booking> pagingController =
      PagingController<int, Booking>(
    firstPageKey: 1,
  );

  Future<ListPage<Booking>> getUnits(int page, int limit) async {
    emit(GetUnitsLoading());
    final res = await _getBookingsDataUsecase(
      GetAllUnitsRequest(query: {
        'page': page,
        'paginate': limit,
      }),
    );
    return res.fold(
      (l) {
        emit(GetUnitsFailure(l.message));
        throw l.message;
      },
      (r) {
        emit(GetUnitsSuccess());
        return ListPage(
          grandTotalCount: r.total,
          itemList: r.bookings,
        );
      },
    );
  }
}
