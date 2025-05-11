part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class BannerResponse extends Equatable implements DataResponse<Banner_R> {
  final int? id;
  final String? name;
  final String? url;
  @JsonKey(name: 'featured_image')
  final String? featuredImage;

  const BannerResponse({
    required this.id,
    required this.name,
    required this.url,
    required this.featuredImage,
  });

  @override
  Banner_R toDomain() {
    return Banner_R(
      id: id.orZero(),
      name: name.orEmpty(),
      url: url.orEmpty(),
      featuredImage: featuredImage.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        url,
        featuredImage,
      ];

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);
}
