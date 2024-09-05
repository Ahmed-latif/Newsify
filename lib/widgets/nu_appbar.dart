import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_ui/pages/notifications.dart';
import 'package:news_ui/utils/helper.dart';

class NuAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(70.0),
      padding: EdgeInsets.only(bottom: 10.0, left: 16.0, right: 16.0),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Newsify",
                //𝕯𝖆𝖎𝖑𝖞 𝕹𝖊𝖜𝖘
                style: GoogleFonts.allura(
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     Helper.nextScreen(context, Notifications());
          //   },
          //   child: Icon(
          //     Icons.notifications,
          //     size: 20.0,
          //   ),
          // )
        ],
      ),
    );
  }
}
