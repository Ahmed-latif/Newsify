import 'package:dio/dio.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:news_ui/models/top%20headlines/articles_model.dart';
import 'package:news_ui/models/top%20headlines/top_healines_models2.dart';
import 'package:news_ui/pages/single_news_page.dart';
import 'package:news_ui/pages/single_news_page_2.dart';
import 'package:news_ui/utils/constants.dart';
import 'package:news_ui/widgets/healine_widget.dart';
import 'package:news_ui/widgets/image_with_placeholder.dart';
import 'package:news_ui/widgets/mini_news_card.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Dio dio = Dio();
  List<Article> articles = [];
  List<Article> articles2 = [];
  Future<List<Article>> getTopHeadlines(String query) async {
    final response = await dio.get(
        'https://newsapi.org/v2/everything?q=$query&apiKey=e0d44dca833446b1b371e9530e8eddc8');
    final articlesJson = response.data["articles"] as List;
    List<Article> newsArticles =
        articlesJson.map((a) => Article.fromJson(a)).toList();
    newsArticles = newsArticles.where((a) => a.title != "[REMOVED]").toList();
    return newsArticles;
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Error $url');
    }
  }

  void fetchHeadlines(String query) {
    if (query.isEmpty) {
      setState(() {
        isEmptyQuery = true;
        articles2 = [];
        isLoading = false;
      });
      return;
    }
    setState(() {
      isLoading = true;
      isInitialSearch = false;
      isEmptyQuery = false;
    });
    getTopHeadlines(query).then((newsArticles) {
      setState(() {
        articles2 = newsArticles;
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      // Handle error here, like showing a snackbar or a dialog
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  bool isEmptyQuery = false;
  bool isInitialSearch = true;

  final format = DateFormat('MMM, dd, yyyy, hh:mm a');
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      // body:
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextFormField(
              controller: searchController,
              cursorColor: Constants.textFormColor2,
              onFieldSubmitted: (query) {
                fetchHeadlines(query);
              },
              decoration: InputDecoration(
                  errorText: isEmptyQuery ? 'Please enter a query' : null,
                  hintText: 'Search using query i.e politics',
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Constants.textFormColor2),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(FluentIcons.search_32_regular),
                    onPressed: () {
                      fetchHeadlines(searchController.text);
                    },
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Constants.textFormColor2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(12)),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
          ),
          Expanded(
              child: isInitialSearch
                  ? Center(
                      child: Text(
                        'Search to find your latest news',
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : isLoading
                      ? Center(
                          child: Lottie.asset('assets/images/search2.json',
                              height: 100, width: 100),
                        )
                      : articles2.isEmpty
                          ? Center(
                              child: Text(
                                'Search to find your top news',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey, fontSize: 16),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: articles2.length,
                                itemBuilder: (context, index) {
                                  final article = articles2[index];
                                  DateTime dateTime =
                                      DateTime.parse(article.publishedAt);
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SingleNewsPage(
                                              url: article.url,
                                              content: article.content ??
                                                  'Click here to see details',
                                              source: article.source.name,
                                              title: article.title,
                                              image: article.urlToImage ??
                                                  PLACE_HOLDER_IMAGE,
                                              date: article.publishedAt,
                                              author: article.author ?? '',
                                              description:
                                                  article.description ?? '',
                                            ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          MiniNewsCard(
                                              title: article.title,
                                              image: ImageWithPlaceholder(
                                                  imageUrl:
                                                      article.urlToImage ??
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
                              ))),
        ],
      ),
    );
  }
}
