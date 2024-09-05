import 'package:flutter/material.dart';
import 'package:news_ui/pages/category/arts.dart';
import 'package:news_ui/pages/category/business.dart';
import 'package:news_ui/pages/category/food.dart';
import 'package:news_ui/pages/category/health.dart';
import 'package:news_ui/pages/category/most_popular.dart';
import 'package:news_ui/pages/category/politics.dart';
import 'package:news_ui/pages/category/science.dart';
import 'package:news_ui/pages/category/sports.dart';
import 'package:news_ui/pages/category/technology.dart';
import 'package:news_ui/pages/category/world.dart';

class CategorySelection extends StatefulWidget {
  @override
  _CategorySelectionState createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  List<int> selectedIndices = [];
  void selectUnselect(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        selectedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Select your \nfavorite section.",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GridView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MostPopular()));
                    },
                    child: Category2(
                      title: 'Most Popular',
                      image: Image.asset(
                        'assets/images/trend.png',
                        height: 50,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => World()));
                    },
                    child: Category2(
                      title: 'World',
                      image: Image.asset(
                        'assets/images/world.png',
                        height: 50,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Business()));
                    },
                    child: Category2(
                      title: 'Business',
                      image: Image.asset(
                        'assets/images/business.png',
                        height: 50,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Politics()));
                    },
                    child: Category2(
                      title: 'Politics',
                      image: Image.asset(
                        'assets/images/politics.png',
                        height: 50,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Health()));
                    },
                    child: Category2(
                      title: 'Health ',
                      image: Image.asset(
                        'assets/images/health.png',
                        height: 50,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Sports()));
                    },
                    child: Category2(
                      title: 'Sports',
                      image: Image.asset(
                        'assets/images/sports.png',
                        height: 50,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Food()));
                    },
                    child: Category2(
                      title: 'Food',
                      image: Image.asset(
                        'assets/images/food.png',
                        height: 50,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Science()));
                    },
                    child: Category2(
                      title: 'Science',
                      image: Image.asset(
                        'assets/images/science.png',
                        height: 50,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Arts()));
                    },
                    child: Category2(
                      title: 'Arts',
                      image: Image.asset(
                        'assets/images/arts.png',
                        height: 50,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Technology()));
                    },
                    child: Category2(
                      title: 'Technolgy',
                      image: Image.asset(
                        'assets/images/technology.png',
                        height: 50,
                      ),
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}

class Category2 extends StatelessWidget {
  final String title;
  final Image image;
  const Category2({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 246, 250, 1),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          SizedBox(
            height: 5.0,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function onTap;
  Category({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            height: 5.0,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }
}
