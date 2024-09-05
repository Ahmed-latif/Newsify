import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:news_ui/models/top%20headlines/articles_model.dart';
import 'package:news_ui/pages/single_news_page.dart';
import 'package:news_ui/utils/constants.dart';
import 'package:news_ui/widgets/image_with_placeholder.dart';
import 'package:news_ui/widgets/news_widget.dart';

class Politics extends StatefulWidget {
  const Politics({super.key});

  @override
  State<Politics> createState() => _PoliticsState();
}

class _PoliticsState extends State<Politics> {
  final Dio dio = Dio();
  List<Article> articles = [];

  Future<List<Article>> getPoliticsNews() async {
    final response = await dio.get(
        'https://newsapi.org/v2/everything?q=politics&q=latest&apiKey=e0d44dca833446b1b371e9530e8eddc8');
    final articlesJson = response.data["articles"] as List;
    List<Article> newsArticles =
        articlesJson.map((a) => Article.fromJson(a)).toList();
    newsArticles = newsArticles.where((a) => a.title != "[REMOVED]").toList();
    return newsArticles;
  }

  @override
  void initState() {
    getPoliticsNews();
    // TODO: implement initState
    super.initState();
  }

  final format = DateFormat('MMM, dd, yyyy, hh:mm:ss a');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 18,
            )),
        backgroundColor: Constants.primaryColor,
        title: Text(
          'Politics News',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        titleSpacing: -15,
      ),
      body: FutureBuilder<List<Article>>(
        future: getPoliticsNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Lottie.asset('assets/images/loading.json'));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No articles available'));
          } else {
            articles = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  DateTime dateTime = DateTime.parse(article.publishedAt);
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleNewsPage(
                              url: article.url,
                              content: article.content ??
                                  'Click here to see details',
                              source: article.source.name,
                              title: article.title,
                              image: article.urlToImage ?? PLACE_HOLDER_IMAGE,
                              date: article.publishedAt,
                              author: article.author ?? '',
                              description: article.description ?? '',
                            ),
                          ),
                        );
                      },
                      child: NewsWidget(
                          title: article.title,
                          date: format.format(dateTime),
                          source: article.source.name,
                          image: ImageWithPlaceholder(
                              imageUrl:
                                  article.urlToImage ?? PLACE_HOLDER_IMAGE,
                              borderRadius: 12)));
                },
              ),
            );
          }
        },
      ),
    );
  }
}
