import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:news_ui/models/gnews/G_News_Model.dart';
import 'package:news_ui/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class BookMark extends StatefulWidget {
  const BookMark({super.key});

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  final Dio dio = Dio();
  List<ArticleGNews> articles = [];
  Future<List<ArticleGNews>> getTopHeadlinesGNews() async {
    final response = await dio.get(
        'https://gnews.io/api/v4/top-headlines?category=health&lang=en&apikey=9679e240a7c552cbf6358c60a1547508');
    final articlesJson = response.data["results"] as List;

    List<ArticleGNews> newsArticles =
        articlesJson.map((a) => ArticleGNews.fromJson(a)).toList();
    newsArticles = newsArticles.where((a) => a.title != "[REMOVED]").toList();
    return newsArticles;
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Error $url');
    }
  }

  @override
  void initState() {
    getTopHeadlinesGNews();
    // TODO: implement initState
    super.initState();
  }

  final format = DateFormat('MMM, dd, yyyy, hh:mm a');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'No bookmark available',
                style: GoogleFonts.anton(
                    fontSize: 22, color: Colors.grey.shade300),
              ),
            ),
            ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Constants.primaryColor, BlendMode.modulate),
                child: Lottie.asset('assets/images/bookmark.json', height: 50))
          ],
        )
      ],
    ));
  }
}
