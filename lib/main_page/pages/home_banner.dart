import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fidu_service/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeBannerLanding extends StatefulWidget {
  @override
  _HomeBannerLandingState createState() => new _HomeBannerLandingState();
}

bool check = false;

class _HomeBannerLandingState extends State<HomeBannerLanding> {
  @override
  void initState() {
    super.initState();
    check = true;
  }

  List<String> carousalList = ["https://picsum.photos/200",
    "https://picsum.photos/200"];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
          child: CarouselSlider(
            items: carousalList
                .map((item) => Container(
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.only(topLeft: Radius.circular(18.0),bottomRight: Radius.circular(18.0)),
                          child: InkWell(
                            onTap: () {},
                            child: CachedNetworkImage(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              imageUrl: item,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                width: MediaQuery.of(context).size.width,
                                height: 150,
                                color: HexColor("#E2E2E2"),
                              ),
                              errorWidget: (context, url, error) => Container(
                                width: MediaQuery.of(context).size.width,
                                height: 150,
                                color: HexColor("#E2E2E2"),
                              ),
                            ),
                          )),
                      color: Colors.transparent,
                    ))
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                height: 150.0,
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 2,
                autoPlayCurve: Curves.easeIn,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: carousalList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 20.0,
                  height: 3.0,
                  margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                      shape: BoxShape.rectangle,
                      color: (_current == entry.key
                          ? primaryColor
                          : grayColor)
                      // .withOpacity(_current == entry.key ? 0.9 : 0.1)
                      ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
