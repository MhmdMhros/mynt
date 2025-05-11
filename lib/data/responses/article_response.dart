part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class ArticleResponse extends Equatable implements DataResponse<Article> {
  final int? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? excerpt;
  @JsonKey(name: 'meta_title')
  final String? metaTitle;
  @JsonKey(name: 'meta_description')
  final String? metaDescription;
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  final String? route;
  final List<CategoryResponse>? categories;
  final String? image;

  const ArticleResponse({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.excerpt,
    required this.metaTitle,
    required this.metaDescription,
    required this.publishedAt,
    required this.route,
    required this.categories,
    required this.image,
  });

  @override
  Article toDomain() {
    return Article(
      id: id.orZero(),
      title: title.orEmpty(),
      slug: slug.orEmpty(),
      description: description.orEmpty(),
      excerpt: excerpt.orEmpty(),
      metaTitle: metaTitle.orEmpty(),
      metaDescription: metaDescription.orEmpty(),
      publishedAt: publishedAt.orEmpty(),
      route: route.orEmpty(),
      categories: categories?.map((e) => e.toDomain()).toList() ?? [],
      image: image.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        description,
        excerpt,
        metaTitle,
        metaDescription,
        publishedAt,
        route,
        categories,
        image,
      ];

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class CategoryResponse extends Equatable
    implements DataResponse<CategoryModel> {
  final int? id;
  final String? title;

  const CategoryResponse({
    required this.id,
    required this.title,
  });

  @override
  CategoryModel toDomain() {
    return CategoryModel(
      id: id.orZero(),
      title: title.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [id, title];

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}
