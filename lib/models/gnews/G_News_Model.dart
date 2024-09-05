class TopHeadlinesModelGNews {
  final int totalArticles;
  final List<ArticleGNews> articles;

  TopHeadlinesModelGNews({
    required this.totalArticles,
    required this.articles,
  });

  factory TopHeadlinesModelGNews.fromJson(Map<String, dynamic> json) =>
      TopHeadlinesModelGNews(
        totalArticles: json["totalArticles"],
        articles: List<ArticleGNews>.from(
            json["articles"].map((x) => ArticleGNews.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalArticles": totalArticles,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class ArticleGNews {
  final String title;
  final String description;
  final String content;
  final String url;
  final String image;
  final String publishedAt;
  final Source source;

  ArticleGNews({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.source,
  });

  factory ArticleGNews.fromJson(Map<String, dynamic> json) => ArticleGNews(
        title: json["title"],
        description: json["description"],
        content: json["content"],
        url: json["url"],
        image: json["image"],
        publishedAt: json["publishedAt"],
        source: Source.fromJson(json["source"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "content": content,
        "url": url,
        "image": image,
        "publishedAt": publishedAt,
        "source": source.toJson(),
      };
}

class Source {
  final String name;
  final String url;

  Source({
    required this.name,
    required this.url,
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
