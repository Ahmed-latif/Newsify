import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_ui/pages/category/most_popular.dart';
import 'package:news_ui/pages/page_switch.dart';
import 'package:news_ui/pages/search_screen.dart';
import 'package:news_ui/pages/splash_screen.dart';
import 'package:news_ui/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          primaryColor: Constants.primaryColor,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.ptSerifTextTheme(),
        ),
        initialRoute: "/",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return SplashScreen();
      });
    case "/notifications":
      return MaterialPageRoute(builder: (BuildContext context) {
        return MostPopular();
      });
    case "/search-results":
      return MaterialPageRoute(builder: (BuildContext context) {
        return MostPopular();
      });
    case "/single-news":
      return MaterialPageRoute(builder: (BuildContext context) {
        return SearchScreen();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return PageSwitch();
      });
  }
}
