import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageView extends StatelessWidget {
  final double width;
  final double height;
  final String url;

  CachedImageView(this.width, this.height, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      alignment: Alignment.center,
      child: CachedNetworkImage(
        imageUrl: this.url,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
        placeholder: (BuildContext context, String url) {
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Image.asset(
              "images/default.png",
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
