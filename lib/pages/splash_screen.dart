import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_ui/pages/page_switch.dart';
import 'package:news_ui/utils/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Helper.nextScreen(context, PageSwitch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/splash.json', height: 100),
          Center(
            child: Text(
              "Newsify",
              //𝕯𝖆𝖎𝖑𝖞 𝕹𝖊𝖜𝖘
              style: GoogleFonts.allura(
                fontWeight: FontWeight.w600,
                fontSize: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
