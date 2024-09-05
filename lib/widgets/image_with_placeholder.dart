import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_ui/utils/constants.dart';

class ImageWithPlaceholder extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;

  const ImageWithPlaceholder({
    required this.imageUrl,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: 210.0, // Or use ScreenUtil().setHeight(210.0)
              decoration: BoxDecoration(
                color: Color.fromARGB(108, 0, 0, 0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Lottie.asset('assets/images/loading2.json', height: 60),
              ),
            ),
            // CachedNetworkImage(
            //   imageUrl: imageUrl,
            //   errorWidget: (context, url, error) {
            //     return Image.asset(
            //       PLACE_HOLDER_IMAGE,
            //       fit: BoxFit.cover,
            //     );
            //   },
            // )
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                    child: Lottie.asset('assets/images/loading2.json',
                        height: 60));
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  PLACE_HOLDER_IMAGE,
                  fit: BoxFit.cover,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
