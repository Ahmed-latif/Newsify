import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:news_ui/models/top%20headlines/articles_model.dart';
import 'package:news_ui/pages/category/most_popular.dart';
import 'package:news_ui/pages/single_news_page.dart';
import 'package:news_ui/pages/top_headlines.dart';
import 'package:news_ui/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_ui/utils/helper.dart';
import 'package:news_ui/widgets/healine_widget.dart';
import 'package:news_ui/widgets/image_with_placeholder.dart';
import 'package:news_ui/widgets/mini_news_card.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Dio dio = Dio();
  List<Article> articles = [];
  List<Article> articles2 = [];
  Future<List<Article>> getTopHeadlines() async {
    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?q=hamas&q=politics&apiKey=e0d44dca833446b1b371e9530e8eddc8');
    final articlesJson = response.data["articles"] as List;
    List<Article> newsArticles =
        articlesJson.map((a) => Article.fromJson(a)).toList();
    newsArticles = newsArticles.where((a) => a.title != "[REMOVED]").toList();
    return newsArticles;
  }

  Future<List<Article>> getMostPopular() async {
    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?q=popular&apiKey=e0d44dca833446b1b371e9530e8eddc8');
    final articlesJson = response.data["articles"] as List;
    List<Article> newsArticles =
        articlesJson.map((a) => Article.fromJson(a)).toList();
    newsArticles = newsArticles.where((a) => a.title != "[REMOVED]").toList();
    return newsArticles;
  }

  @override
  void initState() {
    getTopHeadlines();
    getMostPopular();
    // TODO: implement initState
    super.initState();
  }

  final format = DateFormat('MMM, dd, yyyy, hh:mm a');

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
        body: ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 25.0, left: 15, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.up,
                children: [
                  Text(
                    'Top Headlines',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.red,
                        BlendMode.modulate,
                      ),
                      child: Lottie.asset('assets/images/fire.json'))
                ],
              ),
              GestureDetector(
                onTap: () {
                  Helper.nextScreen(context, TopHeadlines());
                },
                child: Text(
                  'See all',
                  style: GoogleFonts.poppins(
                      color: Constants.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: height * .55,
          width: width,
          child: FutureBuilder<List<Article>>(
            future: getTopHeadlines(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Lottie.asset('assets/images/loading.json'));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No articles available'));
              } else {
                articles = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
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
                        child: HeadlinesWidget(
                            dateAndTime: format.format(dateTime),
                            index: index,
                            image: ImageWithPlaceholder(
                              imageUrl:
                                  article.urlToImage ?? PLACE_HOLDER_IMAGE,
                              borderRadius: 12,
                            ),
                            title: article.title,
                            source: article.source.name),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25.0, left: 15, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Now',
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Helper.nextScreen(context, MostPopular());
                },
                child: Text(
                  'See all',
                  style: GoogleFonts.poppins(
                      color: Constants.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<Article>>(
            future: getMostPopular(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Lottie.asset('assets/images/loading.json'),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No articles available'));
              } else {
                articles2 = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: articles2.length = 5,
                    itemBuilder: (context, index) {
                      final article = articles2[index];
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
                                  image:
                                      article.urlToImage ?? PLACE_HOLDER_IMAGE,
                                  date: article.publishedAt,
                                  author: article.author ?? '',
                                  description: article.description ?? '',
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              MiniNewsCard(
                                  title: article.title,
                                  image: ImageWithPlaceholder(
                                      imageUrl: article.urlToImage ??
                                          PLACE_HOLDER_IMAGE,
                                      borderRadius: 12),
                                  source: article.source.name,
                                  date: format.format(dateTime)),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          ));
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    ));
  }
}
