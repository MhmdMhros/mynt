part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class ServiceTitleResponse extends Equatable
    implements DataResponse<ServiceTitle> {
  final int? id;
  final String? title;

  const ServiceTitleResponse({
    required this.id,
    required this.title,
  });

  @override
  ServiceTitle toDomain() {
    return ServiceTitle(
      id: id.orZero(),
      title: title.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
      ];

  factory ServiceTitleResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceTitleResponseFromJson(json);
}
