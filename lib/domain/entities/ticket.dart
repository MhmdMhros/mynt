class Ticket {
  final int? id;
  final String? propertyTitle;
  final String? propertyNumber;
  final String? propertyBuilding;
  final String? customerName;
  final String? customerPhone;
  final String? ownerName;
  final String? ownerPhone;
  final String? title;
  final String? description;
  final int? statusId;
  final String? statusText;
  final String? creationDate;
  final String? creationTime;
  final List<String>? gallery;

  const Ticket({
    required this.id,
    required this.propertyTitle,
    required this.propertyNumber,
    required this.propertyBuilding,
    required this.customerName,
    required this.customerPhone,
    required this.ownerName,
    required this.ownerPhone,
    required this.title,
    required this.description,
    required this.statusId,
    required this.statusText,
    required this.creationDate,
    required this.creationTime,
    required this.gallery,
  });
}
