class Article {
  final int? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? excerpt;
  final String? metaTitle;
  final String? metaDescription;
  final String? publishedAt;
  final String? route;
  final List<CategoryModel>? categories;
  final String? image;

  const Article({
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
}

class CategoryModel {
  final int? id;
  final String? title;

  const CategoryModel({
    required this.id,
    required this.title,
  });
}
