class Booking {
  final int? id;
  final String? propertyNumber;
  final String? checkin;
  final String? checkout;
  final int? bookingId;
  final int? accountId;
  final String? netTotal;
  final String? balance;
  final String? customerName;
  final String? title;
  final String? description;
  final int? projectId;
  final String? projectTitle;
  final String? projectAddress;
  final List<GalleryModel>? gallery;
  final List<BookedDateModel>? bookedDates;

  const Booking({
    required this.id,
    required this.propertyNumber,
    required this.checkin,
    required this.checkout,
    required this.bookingId,
    required this.accountId,
    required this.netTotal,
    required this.balance,
    required this.customerName,
    required this.title,
    required this.description,
    required this.projectId,
    required this.projectTitle,
    required this.projectAddress,
    required this.gallery,
    required this.bookedDates,
  });
}

class GalleryModel {
  final String? s;
  final String? m;

  const GalleryModel({
    required this.s,
    required this.m,
  });
}

class BookedDateModel {
  final int? bookingId;
  final String? date;

  const BookedDateModel({
    required this.bookingId,
    required this.date,
  });
}
