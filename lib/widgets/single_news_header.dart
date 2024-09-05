import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SingleNewsHeader extends StatelessWidget {
  final String title, source;
  SingleNewsHeader({Key? key, required this.title, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80.0),
      padding: EdgeInsets.only(bottom: 20.0, left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(169, 176, 185, 0.42),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(source,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(251, 89, 84, 1),
                )),
            Text(
              " | ",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.ptSans(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              width: 40.0,
            ),
            Icon(
              Icons.bookmark,
              size: 20.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Icon(
              Icons.share,
              size: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
