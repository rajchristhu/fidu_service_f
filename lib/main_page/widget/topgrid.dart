import 'package:cached_network_image/cached_network_image.dart';
import 'package:fidu_service/main_page/pages/top_trending.dart';
import 'package:fidu_service/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class TopGrid extends StatelessWidget {
  const TopGrid({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border.all(color: grayColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
                child: Container(

                padding: const EdgeInsets.only(
                    right: 10, left: 10, top: 10, bottom: 10),
                child:
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(3.0),
                        topRight: Radius.circular(3.0),
                        bottomLeft: Radius.circular(3.0),
                        bottomRight: Radius.circular(3.0)),
                    child:
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  imageUrl: "https://picsum.photos/200",
                  placeholder: (context, url) => Container(
                    width: MediaQuery.of(context).size.width,
                    color: HexColor("#8AE2E2E2"),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: MediaQuery.of(context).size.width,
                    color: HexColor("#8AE2E2E2"),
                  ),
                )

                )))
            ,
            Expanded(
                flex: 0,
                child: Text(
              choice.title,
              style: TextStyle(
                  color: blackColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500),
            ))
            ,
            const SizedBox(
              height: 10,
            ),
          ]),
    );
  }
}
