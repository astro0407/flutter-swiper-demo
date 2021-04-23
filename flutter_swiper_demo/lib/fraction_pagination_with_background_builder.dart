import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class FractionPaginationWithBackgroundBuilder extends SwiperPlugin {
  ///color ,if set null , will be Theme.of(context).scaffoldBackgroundColor
  final Color color;

  ///color when active,if set null , will be Theme.of(context).primaryColor
  final Color activeColor;

  ////font size
  final double fontSize;

  ///font size when active
  final double activeFontSize;

  final Key key;

  const FractionPaginationWithBackgroundBuilder(
      {this.color,
        this.fontSize: 20.0,
        this.key,
        this.activeColor,
        this.activeFontSize: 35.0});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    ThemeData themeData = Theme.of(context);
    Color activeColor = this.activeColor ?? themeData.primaryColor;
    Color color = this.color ?? themeData.scaffoldBackgroundColor;

    if (Axis.vertical == config.scrollDirection) {
      return  Container(
        padding: EdgeInsets.all(8),
        decoration:  BoxDecoration(
          borderRadius:  BorderRadius.all( Radius.circular(10.0)),
          image:  DecorationImage(
            image: ExactAssetImage("images/show_num.png"),
          ),
        ),
        child: Column(
          key: key,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Text(
              "${config.activeIndex + 1}",
              style: TextStyle(color: activeColor, fontSize: activeFontSize),
            ),
             Text(
              "/",
              style: TextStyle(color: color, fontSize: fontSize),
            ),
             Text(
              "${config.itemCount}",
              style: TextStyle(color: color, fontSize: fontSize),
            )
          ],
        ),
      );
    } else {
      return  Container(
        padding: EdgeInsets.all(8),
        decoration:  BoxDecoration(
          borderRadius:  BorderRadius.all( Radius.circular(10.0)),
          image:  DecorationImage(
            image: ExactAssetImage("images/show_num.png"),
          ),
        ),
        child: Row(
          key: key,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Text(
              "${config.activeIndex + 1}",
              style: TextStyle(color: activeColor, fontSize: activeFontSize),
            ),
             Text(
              " / ${config.itemCount}",
              style: TextStyle(color: color, fontSize: fontSize),
            )
          ],
        ),
      );
    }
  }
}
