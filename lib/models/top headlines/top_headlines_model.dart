import 'articles_model.dart';

class TopHeadlinesModel {
  String status;
  int totalResults;
  List<Article> articles;

  TopHeadlinesModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory TopHeadlinesModel.fromJson(Map<String, dynamic> json) =>
      TopHeadlinesModel(
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
