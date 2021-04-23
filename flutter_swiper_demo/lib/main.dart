import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'cached_image.dart';
import 'fraction_pagination_with_background_builder.dart';
import 'listData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Swiper Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Swiper Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 360.0,
              child: Swiper(
                // 横向
                scrollDirection: Axis.horizontal,
                // 布局构建
                itemBuilder: (BuildContext context, int index) {
                  return CachedImageView(double.infinity, double.infinity, listData[index]["imageUrl"]);
                },
                //条目个数
                itemCount: listData.length,
                // 自动翻页
                autoplay: true,
                // 分页指示
                pagination: buildSwiperPagination(),
                // 相邻子条目视窗比例
                viewportFraction: 1,
                // 布局方式
                //layout: SwiperLayout.STACK,
                // 用户进行操作时停止自动翻页
                autoplayDisableOnInteraction: true,
                // 无线轮播
                loop: false,
                //当前条目的缩放比例
                scale: 1,
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //自定义分页指示器
  buildSwiperPagination() {
    // 分页指示器
    return SwiperPagination(
      //指示器显示的位置
      alignment: Alignment.bottomRight, // 位置 Alignment.bottomCenter 底部中间
      // 距离调整
      margin: const EdgeInsets.fromLTRB(0, 0, 30, 21),
      // 指示器构建
      builder: FractionPaginationWithBackgroundBuilder(
        // 选中时字体大小
          activeFontSize: 16,
          // 字体大小
          fontSize: 16,
          // 字体颜色
          color: Colors.white,
          //选中时的颜色
          activeColor: Colors.white),
    );
  }
}
