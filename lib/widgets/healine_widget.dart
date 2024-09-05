import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadlinesWidget extends StatelessWidget {
  final String dateAndTime, title, source;
  final Widget image;
  final int index;
  const HeadlinesWidget(
      {Key? key,
      required this.dateAndTime,
      required this.index,
      required this.image,
      required this.title,
      required this.source})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: height * 0.6,
            width: width * .9,
            padding: EdgeInsets.symmetric(horizontal: height * .02),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15), child: image),
          ),
          Positioned(
            bottom: 20,
            child: Card(
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(15),
                height: height * .22,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.7,
                      child: Text(
                        title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            source,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            dateAndTime,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
