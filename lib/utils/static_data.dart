import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_ui/models/category.dart';
import 'package:news_ui/models/news.dart';

class StaticData {
  static List<Category> categories = [
    Category(
      id: 1,
      title: "Most Popular",
      icon: Icon(
        Icons.trending_up_sharp,
      ),
    ),
    Category(
      id: 2,
      title: "World",
      icon: Icon(
        Icons.earbuds_battery_sharp,
      ),
    ),
    Category(
      id: 3,
      title: "Science",
      icon: Icon(
        Icons.explore_rounded,
      ),
    ),
    Category(
      id: 4,
      title: "Politics",
      icon: SvgPicture.asset("assets/svg/politics.svg"),
    ),
    Category(
      id: 5,
      title: "Business",
      icon: Icon(Icons.handshake_outlined),
    ),
    Category(
      id: 6,
      title: "Sports",
      icon: Icon(Icons.sports_soccer_outlined),
    ),
    Category(
      id: 7,
      title: "Arts",
      icon: SvgPicture.asset("assets/svg/arts.svg"),
    ),
    Category(
      id: 8,
      title: "Health",
      icon: Icon(Icons.health_and_safety),
    ),
    Category(
      id: 9,
      title: "Food",
      icon: SvgPicture.asset("assets/svg/food.svg"),
    ),
    Category(
      id: 10,
      title: "Technology",
      icon: SvgPicture.asset("assets/svg/technology.svg"),
    ),
  ];

  static List<News> news = [
    News(
      id: 1,
      category: "Fashion",
      title: "Who Is Paris Hilton, Really?",
      content:
          "The heiress and proto-influencer says that she spent nearly two decades playing a character. Now she’s ready to be herself.",
      timePosted: "10 hours ago",
      imagePath: "assets/images/paris.png",
    ),
    News(
      id: 2,
      category: "Sports",
      title: "The True Cost Of Lionel Messi’s...",
      content:
          "The actor also played groundbreaking figures like the James Brown, Jackie Robinson and Thurgood Marshall,",
      timePosted: "10 hours ago",
      imagePath: "assets/images/messi.png",
    ),
    News(
      id: 3,
      category: "Magazine",
      title: "Chris Rock Tried to Warn Us...",
      content:
          "In a candid interview, the comic discusses America’s summer of strife, Trump, blackface and his dramatic turn in the new season of “Fargo.",
      timePosted: "1 day ago",
      imagePath: "assets/images/chris.png",
    ),
    News(
      id: 4,
      category: "Arts",
      title: "Debut Novelists and Women Dominate...",
      content:
          "Some literary heavy hitters missed out, including Hilary Mantel, whose latest work, “The Mirror and the Light,” did not make the cut",
      timePosted: "1 day ago",
      imagePath: "assets/images/art.png",
    ),
  ];
}
