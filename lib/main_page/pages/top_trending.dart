import 'package:fidu_service/main_page/widget/topgrid.dart';
import 'package:fidu_service/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TopTrending extends StatefulWidget {
  const TopTrending({Key? key}) : super(key: key);

  @override
  _TopTrendingState createState() => _TopTrendingState();
}

class _TopTrendingState extends State<TopTrending> {
  @override
  Widget build(BuildContext context) {
    const List<Choice> choices = <Choice>[
      Choice(title: 'Cracker 1', icon: Icons.home),
      Choice(title: 'Cracker 2', icon: Icons.contacts),
      Choice(title: 'Cracker 3', icon: Icons.map),
      Choice(title: 'Cracker 4', icon: Icons.phone),
      Choice(title: 'Cracker 5', icon: Icons.camera_alt),
      Choice(title: 'Cracker 6', icon: Icons.settings),
      Choice(title: 'Cracker 7', icon: Icons.photo_album),
      Choice(title: 'Cracker 8', icon: Icons.wifi),
      Choice(title: 'Cracker 9', icon: Icons.wifi),
    ];
    List<String> carousalList = ["https://image.freepik.com/free-vector/beautiful-happy-diwali-crackers-celebration-banner_1017-21664.jpg",
      "https://d2y0eb5zgg2xw9.cloudfront.net/siteImages/homePageBanners/mark-harpur-HUOvKWXEdFY-unsplash.jpg"];
    return  Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color:     whiteColor,

          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                SizedBox(
                  child: Text(
                    "Top Trending",
                    style: TextStyle(
                        color: blackColor, fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 50.0,
                  height: 2.5,
                  margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      shape: BoxShape.rectangle,
                      color: ( primaryColor)
                    // .withOpacity(_current == entry.key ? 0.9 : 0.1)
                  ),
                )
              ]),
        ),
        const SizedBox(
          height: 15,
        ),
Padding(          padding: const EdgeInsets.only(right: 16, left: 16),
child:GridView.count(
    physics: const ClampingScrollPhysics(),
    crossAxisCount: 3,
    shrinkWrap: true,
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
    children: List.generate(choices.length, (index) {
      return Center(
        child: TopGrid(choice: choices[index]),
      );
    }
    )) ,)
        ,
          const SizedBox(
          height: 40,
        ),
      ],
    );

  }

}
class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}


