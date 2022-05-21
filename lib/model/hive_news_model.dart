import 'package:hive/hive.dart';

part 'hive_news_model.g.dart';

@HiveType(typeId: 1)
class HiveNewsModel {
  @HiveField(0)
  String sourceName;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String url;

  @HiveField(4)
  final String urlToImage;

  @HiveField(5)
  final DateTime publishedAt;

  @HiveField(6)
  final String content;

  HiveNewsModel({
    required this.sourceName,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
}
