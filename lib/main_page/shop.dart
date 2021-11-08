import 'package:fidu_service/main_page/pages/category_list.dart';
import 'package:fidu_service/main_page/pages/home_banner.dart';
import 'package:fidu_service/main_page/pages/shopping_page.dart';
import 'package:fidu_service/main_page/pages/top_trending.dart';
import 'package:fidu_service/util/theme.dart';
import 'package:flutter/material.dart';
class ShopFidu extends StatefulWidget {
  const ShopFidu({Key? key}) : super(key: key);

  @override
  _ShopFiduState createState() => _ShopFiduState();
}

class _ShopFiduState extends State<ShopFidu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HomeBannerLanding(),
                  const CategoryList(),
                  const TopTrending(),
                  const ShoppingPage()
                ])));
  }
}
