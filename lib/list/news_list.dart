// To parse this JSON data, do
//
//     final newsList = newsListFromJson(jsonString);

import 'dart:convert';

NewsList newsListFromJson(String str) => NewsList.fromJson(json.decode(str));

String newsListToJson(NewsList data) => json.encode(data.toJson());

class NewsList {
  int? totalArticles;
  List<Article>? articles;

  NewsList({
    this.totalArticles,
    this.articles,
  });

  factory NewsList.fromJson(Map<String, dynamic> json) => NewsList(
        totalArticles: json["totalArticles"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"]!.map(
                  (x) => Article.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "totalArticles": totalArticles,
        "articles": articles == null
            ? []
            : List<dynamic>.from(
                articles!.map(
                  (x) => x.toJson(),
                ),
              ),
      };
}

class Article {
  String? title;
  String? description;
  String? content;
  String? url;
  String? image;
  DateTime? publishedAt;
  Source? source;

  Article({
    this.title,
    this.description,
    this.content,
    this.url,
    this.image,
    this.publishedAt,
    this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        description: json["description"],
        content: json["content"],
        url: json["url"],
        image: json["image"],
    publishedAt: _parsePublishedAt(json["publishedAt"]),
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "content": content,
        "url": url,
        "image": image,
        "publishedAt": publishedAt?.toIso8601String(),
        "source": source?.toJson(),
      };
  static DateTime _parsePublishedAt(String? publishedAt) {
    if (publishedAt == null) {
      return DateTime.now();
    }
    // Parse the publishedAt string into a DateTime object
    DateTime dateTime = DateTime.parse(publishedAt);
    // Return the DateTime object
    return dateTime;
  }
}

class Source {
  String? name;
  String? url;

  Source({
    this.name,
    this.url,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
