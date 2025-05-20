// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/common/pagination/list_page.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/entities/ticket.dart';
import 'package:mynt/domain/usecases/create_review_usecase.dart';
import 'package:mynt/domain/usecases/get_tickets_data_usecase.dart';
import 'package:url_launcher/url_launcher.dart';

part 'tickets_state.dart';

@injectable
class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit(this._getTicketsDataUsecase, this._createReviewUsecase)
      : super(TicketsInitial());
  final GetTicketsDataUsecase _getTicketsDataUsecase;
  final CreateReviewUsecase _createReviewUsecase;

  static TicketsCubit get(BuildContext context) => BlocProvider.of(context);

  PagingController<int, Ticket> pagingController =
      PagingController<int, Ticket>(
    firstPageKey: 1,
  );

  Future<ListPage<Ticket>> getTickets(int page, int limit) async {
    emit(GetTicketsLoading());
    final res = await _getTicketsDataUsecase(
      GetAllTicketsRequest(query: {
        'page': page,
        'paginate': limit,
      }),
    );
    return res.fold(
      (l) {
        emit(GetTicketsFailure(l.message));
        throw l.message;
      },
      (r) {
        emit(GetTicketsSuccess());
        return ListPage(
          grandTotalCount: r.total,
          itemList: r.tickets,
        );
      },
    );
  }

  Future<void> callNumber(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      showToast('Cannot launch call with this phone number', ToastType.error);
      emit(const CallPhoneFailure("Cannot launch phone call"));
    }
  }

  Future<void> openWhatsAppChat(String phoneNumber) async {
    if (phoneNumber.isNotEmpty) {
      final String correctPhoneNumber =
          normalizeEgyptianPhoneNumber(phoneNumber);
      final url = Uri.parse("https://wa.me/$correctPhoneNumber");
      await launchUrl(url);
    } else {
      showToast('Cannot launch chat with this phone number', ToastType.error);
      emit(const ChatPhoneFailure("Cannot launch phone chat"));
    }
  }

  Future<bool> createReview({
    required String ticketId,
    required String comment,
    required String score,
  }) async {
    emit(CreateReviewLoading());

    final result = await _createReviewUsecase(
      CreateReviewRequest(
        ticketId: ticketId,
        comment: comment,
        score: score,
      ),
    );

    return await result.fold(
      (failure) {
        emit(CreateReviewFailure(failure.message));
        // showToast('Unable to submit your review. Please try again shortly.',
        //     ToastType.error);
        return false;
      },
      (success) {
        emit(CreateReviewSuccess());
        // showToast(
        //     'Your rate has been submitted successfully.', ToastType.success);
        return true;
      },
    );
  }
}
