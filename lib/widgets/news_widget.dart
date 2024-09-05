import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    required this.title,
    required this.date,
    required this.source,
    required this.image,
  });

  final String title, source;
  final String date;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 210.0, // Or use ScreenUtil().setHeight(210.0)
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: image,
        ),
        SizedBox(height: 5.0),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 5.0),
        Row(
          children: [
            Text(
              date,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            Text(
              " | ",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            Text(
              source,
              style: TextStyle(
                fontSize: 14.0,
                color: Color.fromRGBO(251, 89, 84, 1),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
