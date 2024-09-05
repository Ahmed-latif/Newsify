import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:news_ui/utils/constants.dart';
import 'package:news_ui/widgets/single_news_header.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleNewsPage2 extends StatelessWidget {
  final String title, date, source, image, content, url;
  final List author;
  SingleNewsPage2(
      {Key? key,
      required this.title,
      required this.url,
      required this.date,
      required this.image,
      required this.author,
      required this.source,
      required this.content});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Error $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMM, dd, yyyy, hh:mm:ss a');
    DateTime dateTime = DateTime.parse(date);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0.0,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Container(
        height: ScreenUtil().setHeight(100.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 60.0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(232, 232, 232, 1),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Write a comment...",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(186, 186, 186, 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                width: 65.0,
                height: 65.0,
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Transform.rotate(
                  angle: -0.8,
                  child: Icon(
                    Icons.send_to_mobile_rounded,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleNewsHeader(
              source: source,
              title: title,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Click here to read more',
                        style: TextStyle(
                          height: 1.7,
                          color: Color.fromRGBO(139, 144, 165, 1),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: ScreenUtil().setHeight(210.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(image)),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        author.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        format.format(dateTime),
                        style: TextStyle(
                          height: 1.7,
                          color: Color.fromRGBO(139, 144, 165, 1),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchUrl(Uri.parse(url));
                        },
                        child: Text(
                          content,
                          style: TextStyle(
                            height: 1.7,
                            color: Color.fromRGBO(139, 144, 165, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
