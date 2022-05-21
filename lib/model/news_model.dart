// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    this.status,
    this.totalResults,
    required this.articles,
  });

  String? status;
  int? totalResults;
  List<Article> articles;

  factory News.fromJson(Map<String, dynamic> json) => News(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source!.toJson(),
        "author": author == null ? null : author,
        "title": title == null ? "Not Available" : title,
        "description": description == null ? "Not Available" : description,
        "url": url == null ? "https://flutter.dev/" : url,
        "urlToImage": urlToImage == null
            ? "https://us.123rf.com/450wm/olgakot19/olgakot191912/olgakot19191200120/135111376-bitcoin-coins-are-a-stack-black-background-with-reflection.jpg?ver=6"
            : urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? "Not Available" : id,
        "name": name == null ? "Not Available" : name
      };
}
