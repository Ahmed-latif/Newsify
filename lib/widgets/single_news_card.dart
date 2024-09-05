import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleNewsCard extends StatefulWidget {
  final String title, date, source, image;
  SingleNewsCard(
      {super.key,
      required this.title,
      required this.date,
      required this.image,
      required this.source});

  @override
  State<SingleNewsCard> createState() => _SingleNewsCardState();
}

class _SingleNewsCardState extends State<SingleNewsCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(210.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(widget.image)),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Text(
                widget.date,
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
                widget.source,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(251, 89, 84, 1),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
