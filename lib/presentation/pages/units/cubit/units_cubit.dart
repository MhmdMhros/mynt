// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/core/common/pagination/list_page.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/entities/account_summary_data.dart';
import 'package:mynt/domain/entities/booking.dart';
import 'package:mynt/domain/usecases/create_restriction_usecase.dart';
import 'package:mynt/domain/usecases/get_booking_account_summary_usecase.dart';
import 'package:mynt/domain/usecases/get_booking_details_usecase.dart';
import 'package:mynt/domain/usecases/get_bookings_data_usecase.dart';

part 'units_state.dart';

@injectable
class UnitsCubit extends Cubit<UnitsState> {
  UnitsCubit(this._getBookingsDataUsecase, this._createRestrictionUsecase,
      this._getBookingAccountSummaryUsecase, this._getBookingDetailsUsecase)
      : super(UnitsInitial());
  final GetBookingsDataUsecase _getBookingsDataUsecase;
  final CreateRestrictionUsecase _createRestrictionUsecase;
  final GetBookingAccountSummaryUsecase _getBookingAccountSummaryUsecase;
  final GetBookingDetailsUsecase _getBookingDetailsUsecase;

  static UnitsCubit get(BuildContext context) => BlocProvider.of(context);

  PagingController<int, Booking> pagingController =
      PagingController<int, Booking>(
    firstPageKey: 1,
  );
  int total = 0;
  AccountSummaryData? bookingAccountSummaryData;
  Booking bookingDetails = const Booking(
    id: 0,
    propertyNumber: "",
    checkin: "",
    checkout: "",
    bookingId: 0,
    accountId: 0,
    netTotal: "",
    balance: "",
    customerName: "",
    title: "",
    description: "",
    projectId: 0,
    projectTitle: "",
    projectAddress: "",
    gallery: [],
    bookedDates: [],
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
        total = r.total;
        return ListPage(
          grandTotalCount: r.total,
          itemList: r.bookings,
        );
      },
    );
  }

  Future<Map<String, dynamic>> createRestriction({
    required String propertyId,
    required String dateFrom,
    required String dateTo,
  }) async {
    emit(CreateRestrictionLoading());

    final result = await _createRestrictionUsecase(
      CreateRestrictionRequest(
        propertyId: propertyId,
        dateFrom: dateFrom,
        dateTo: dateTo,
      ),
    );

    return result.fold(
      (failure) {
        emit(CreateRestrictionFailure(failure.message));
        return {
          'isSuccess': false,
          'message': failure.message,
        };
      },
      (success) {
        emit(CreateRestrictionSuccess());
        return {
          'isSuccess': true,
          'message': success.message,
        };
      },
    );
  }

  Future<void> fetchBookingAccountSummary(String unitId) async {
    emit(GetBookingAccountSummaryLoading());

    final result = await _getBookingAccountSummaryUsecase(
        GetBookingAccountSummaryRequest(query: {
      'property_id': unitId,
    }));
    result.fold(
      (failure) {
        emit(GetBookingAccountSummaryFailure(failure.message));
      },
      (data) {
        emit(GetBookingAccountSummarySuccess());
        bookingAccountSummaryData = data;
      },
    );
  }

  Future<void> getBookingDetails(String bookingId) async {
    emit(BookingDetailsLoading());

    final result = await _getBookingDetailsUsecase(bookingId);

    result.fold(
      (failure) => emit(BookingDetailsError(failure.message)),
      (booking) {
        bookingDetails = booking;
        emit(BookingDetailsLoaded(booking));
      },
    );
  }

  void clearBookingData() {
    bookingDetails = const Booking(
      id: 0,
      propertyNumber: "",
      checkin: "",
      checkout: "",
      bookingId: 0,
      accountId: 0,
      netTotal: "",
      balance: "",
      customerName: "",
      title: "",
      description: "",
      projectId: 0,
      projectTitle: "",
      projectAddress: "",
      gallery: [],
      bookedDates: [],
    );
  }
}
