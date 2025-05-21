// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/base_usecase.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/entities/request_service_data.dart';
import 'package:mynt/domain/usecases/create_ticket_usecase.dart';
import 'package:mynt/domain/usecases/get_request_service_data_usecase.dart';
import 'package:mynt/domain/usecases/upload_ticket_images_usecase.dart';

part 'request_service_state.dart';

@injectable
class RequestServiceCubit extends Cubit<RequestServiceState> {
  RequestServiceCubit(this._getRequestServiceDataUsecase,
      this._createTicketUsecase, this._uploadTicketImagesUsecase)
      : super(RequestServiceInitial());
  final GetRequestServiceDataUsecase _getRequestServiceDataUsecase;
  final CreateTicketUsecase _createTicketUsecase;
  final UploadTicketImagesUsecase _uploadTicketImagesUsecase;
  final ImagePicker _picker = ImagePicker();

  List<File> selectedImages = [];
  RequestServiceData? requestServiceData;
  String unitId = '';
  String serviceId = '';
  String serviceTitle = '';

  static RequestServiceCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> pickImages() async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      selectedImages = pickedFiles.map((xfile) => File(xfile.path)).toList();
      emit(RequestServiceImagesUpdated(selectedImages));
    }
  }

  Future<void> getRequestServiceData() async {
    emit(GetRequestServiceDataLoading());
    final res = await _getRequestServiceDataUsecase(NoParams());
    res.fold(
      (l) {
        emit(GetRequestServiceDataFailure(l.message));
      },
      (data) {
        requestServiceData = data;
        emit(GetRequestServiceDataSuccess());
      },
    );
  }

  Future<void> submitTicket({required String description}) async {
    emit(SubmitTicketLoading());
    List<String> imageIds = [];
    try {
      if (selectedImages.isNotEmpty) {
        // Upload images first
        final uploadResult = await _uploadTicketImagesUsecase(
          UploadImagesRequest(name: "gallery", files: selectedImages),
        );

        imageIds = uploadResult.fold(
          (failure) {
            emit(SubmitTicketFailure(failure.message));
            return [];
          },
          (imagesData) => imagesData.uploadedImagesData
              .map((img) => img.id.toString())
              .toList(),
        );
      }

      // Create the ticket
      final createResult = await _createTicketUsecase(
        CreateTicketRequest(
          propertyId: unitId,
          titleId: serviceId,
          description: description,
          attachments: imageIds,
        ),
      );

      createResult.fold(
        (failure) {
          selectedImages = [];
          serviceId = '';
          serviceTitle = '';
          emit(SubmitTicketFailure(failure.message));
          // showToast('Failed to request service, please try again later.',
          //     ToastType.error);
        },
        (success) {
          selectedImages = [];
          serviceId = '';
          serviceTitle = '';
          emit(SubmitTicketSuccess(success.message));
          showToast('Request service added.', ToastType.success);
        },
      );
    } catch (e) {
      emit(SubmitTicketFailure('An unexpected error occurred: $e'));
    }
  }

  void updateUnitId(String unitId) {
    this.unitId = unitId;
    emit(UpdateUnitIdState(unitId));
  }

  void updateServiceTitleId(String serviceId, String serviceTitle) {
    this.serviceId = serviceId;
    this.serviceTitle = serviceTitle;
    emit(UpdateServiceTitleIdState(serviceId, serviceTitle));
  }
}
