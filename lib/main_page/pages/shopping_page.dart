import 'package:cached_network_image/cached_network_image.dart';
import 'package:fidu_service/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    List<String> carousalList = [
      "https://picsum.photos/200",
      "https://picsum.photos/200"
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  child: Text(
                    "Shopping ",
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 50.0,
                  height: 2.5,
                  margin: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      shape: BoxShape.rectangle,
                      color: (primaryColor)
                      // .withOpacity(_current == entry.key ? 0.9 : 0.1)
                      ),
                )
              ]),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
            child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: carousalList.length,
          itemBuilder: (BuildContext context, int index) => Column(
            children: [
              Container(
                  padding: carousalList.length == index
                      ? const EdgeInsets.only(bottom: 16, left: 16, right: 16)
                      : 0 == index
                          ? const EdgeInsets.only(left: 16, right: 16)
                          : const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14.0),
                              topRight: Radius.circular(2.0),
                              bottomLeft: Radius.circular(2.0),
                              bottomRight: Radius.circular(14.0)),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                            imageUrl: carousalList[index],
                            placeholder: (context, url) => Container(
                              width: MediaQuery.of(context).size.width,
                              color: HexColor("#8AE2E2E2"),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: MediaQuery.of(context).size.width,
                              color: HexColor("#8AE2E2E2"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width-140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                "Crackers",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 6,),
                              Text(
                                "Crackers are best fun in festival. don't miss it djbvbdfsdfjbhfbhdsbfhbdfhdsbfhdsjbfj",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ) ,
                              const SizedBox(height: 6,),
                              Text(
                                "Continue Shopping >",
                                maxLines: 20,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  ))
            ],
          ),
        )),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
