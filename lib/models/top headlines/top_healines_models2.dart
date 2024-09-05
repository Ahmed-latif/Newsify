// To parse this JSON data, do
//
//     final topHeadlinesModel2 = topHeadlinesModel2FromJson(jsonString);

import 'dart:convert';

TopHeadlinesModel2 topHeadlinesModel2FromJson(String str) =>
    TopHeadlinesModel2.fromJson(json.decode(str));

String topHeadlinesModel2ToJson(TopHeadlinesModel2 data) =>
    json.encode(data.toJson());

class TopHeadlinesModel2 {
  final String status;
  final int totalResults;
  final List<Result> results;
  final String nextPage;

  TopHeadlinesModel2({
    required this.status,
    required this.totalResults,
    required this.results,
    required this.nextPage,
  });

  factory TopHeadlinesModel2.fromJson(Map<String, dynamic> json) =>
      TopHeadlinesModel2(
        status: json["status"],
        totalResults: json["totalResults"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "nextPage": nextPage,
      };
}

class Result {
  final String articleId;
  final String title;
  final String link;
  final List<String>? keywords;
  final List<String>? creator;
  final dynamic videoUrl;
  final String description;
  final String content;
  final String pubDate;
  final String? imageUrl;
  final String sourceId;
  final int sourcePriority;
  final String sourceName;
  final String sourceUrl;
  final String sourceIcon;
  final String language;
  final List<String> country;
  final List<String> category;
  final String aiTag;
  final String sentiment;
  final String sentimentStats;
  final String aiRegion;
  final String aiOrg;
  final bool duplicate;

  Result({
    required this.articleId,
    required this.title,
    required this.link,
    required this.keywords,
    required this.creator,
    required this.videoUrl,
    required this.description,
    required this.content,
    required this.pubDate,
    required this.imageUrl,
    required this.sourceId,
    required this.sourcePriority,
    required this.sourceName,
    required this.sourceUrl,
    required this.sourceIcon,
    required this.language,
    required this.country,
    required this.category,
    required this.aiTag,
    required this.sentiment,
    required this.sentimentStats,
    required this.aiRegion,
    required this.aiOrg,
    required this.duplicate,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        articleId: json["article_id"],
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null
            ? []
            : List<String>.from(json["keywords"]!.map((x) => x)),
        creator: json["creator"] == null
            ? []
            : List<String>.from(json["creator"]!.map((x) => x)),
        videoUrl: json["video_url"],
        description: json["description"],
        content: json["content"],
        pubDate: json["pubDate"],
        imageUrl: json["image_url"],
        sourceId: json["source_id"],
        sourcePriority: json["source_priority"],
        sourceName: json["source_name"],
        sourceUrl: json["source_url"],
        sourceIcon: json["source_icon"],
        language: json["language"],
        country: List<String>.from(json["country"].map((x) => x)),
        category: List<String>.from(json["category"].map((x) => x)),
        aiTag: json["ai_tag"],
        sentiment: json["sentiment"],
        sentimentStats: json["sentiment_stats"],
        aiRegion: json["ai_region"],
        aiOrg: json["ai_org"],
        duplicate: json["duplicate"],
      );

  Map<String, dynamic> toJson() => {
        "article_id": articleId,
        "title": title,
        "link": link,
        "keywords":
            keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "creator":
            creator == null ? [] : List<dynamic>.from(creator!.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": content,
        "pubDate": pubDate,
        "image_url": imageUrl,
        "source_id": sourceId,
        "source_priority": sourcePriority,
        "source_name": sourceName,
        "source_url": sourceUrl,
        "source_icon": sourceIcon,
        "language": language,
        "country": List<dynamic>.from(country.map((x) => x)),
        "category": List<dynamic>.from(category.map((x) => x)),
        "ai_tag": aiTag,
        "sentiment": sentiment,
        "sentiment_stats": sentimentStats,
        "ai_region": aiRegion,
        "ai_org": aiOrg,
        "duplicate": duplicate,
      };
}
