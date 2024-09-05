import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ui/models/news.dart';

class MiniNewsCard extends StatelessWidget {
  final String title, source, date;
  final Widget image;
  MiniNewsCard(
      {required this.title,
      required this.image,
      required this.source,
      required this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(233, 233, 233, 1),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Container(
            height: ScreenUtil().setHeight(125.0),
            width: ScreenUtil().setWidth(125.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(233, 233, 233, 1),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: image,
          ),
          SizedBox(
            width: 30.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  source,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color.fromRGBO(139, 144, 165, 1),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(251, 89, 84, 1),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
