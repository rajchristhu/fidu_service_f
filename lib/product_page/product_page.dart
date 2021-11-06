import 'package:cached_network_image/cached_network_image.dart';
import 'package:fidu_service/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(const ProductPage());

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:primaryColor,
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),

      home: const ProductPageWidget(),
    );
  }
}

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({Key? key}) : super(key: key);

  @override
  State<ProductPageWidget> createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  List<String> carousalList = [
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200"
  ];
// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,


            backgroundColor: primaryColor,
            snap: _snap,
            floating: _floating,
            expandedHeight: 220.0,

            flexibleSpace:  FlexibleSpaceBar(
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child:  Align(
                    alignment: Alignment.bottomLeft,
                    child:Text("Fidu Service",style: TextStyle(color: whiteColor),)
                ),),





                background: Stack(

                  fit: StackFit.expand,
                  children: <Widget>[
Container(
  color:Colors.black,
  child: ShaderMask(

  shaderCallback: (rect) {
    return LinearGradient(
      begin: Alignment.center,
      end: Alignment.bottomCenter,
      colors: [Colors.black, Colors.transparent],
    ).createShader(
        Rect.fromLTRB(10, 10, rect.width, rect.height));
  },
  blendMode: BlendMode.dstATop,
  child: CachedNetworkImage(
    fit: BoxFit.cover,
    imageUrl: carousalList[0],
    placeholder: (context, url) => Container(
      width: MediaQuery.of(context).size.width,
      color: HexColor("#8AE2E2E2"),
    ),
    errorWidget: (context, url, error) => Container(
      width: MediaQuery.of(context).size.width,
      color: HexColor("#8AE2E2E2"),
    ),
  ),


  // Image.network(
  //   getCurated[index]
  //       .bannerImageStorageUrl,
  //   fit: BoxFit.cover,
  // ),
),)

                    ,
                  ],
                )


            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Column(
                  children: [
                    const SizedBox(height: 20,),
                    Container(
                        padding: carousalList.length == index
                            ? const EdgeInsets.only(bottom: 0, left: 16, right: 16)
                            : 0 == index
                            ? const EdgeInsets.only(left: 16, right: 16)
                            : const EdgeInsets.only(top: 0, left: 16, right: 16),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(18.0),
                                    bottomRight: Radius.circular(18.0)),
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
                                    const SizedBox(height: 0,),
                                    Row(

                                      children: [
                                        Expanded(
                                          flex:2,
                                          child:  Text(
                                            "₹ 20000",
                                            style: TextStyle(
                                                color: blackColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600),
                                          ) ,),
                                        Expanded(
                                          flex:2,
                                          child:  Text(
                                            "₹ 30000",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                decoration: TextDecoration.lineThrough,

                                                color: primaryColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ) ,),
                                        Expanded(
                                          flex:2,
                                          child:    Container(
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: primaryColor),
                                            child: Row(
                                              children: [
                                                Expanded(flex:0,
                                                  child: InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons.remove,
                                                        color: Colors.white,
                                                        size: 16,
                                                      )),),
                                                Expanded(flex:1,
                                                  child: Container(
                                                    margin: const EdgeInsets.symmetric(horizontal: 2),
                                                    padding:
                                                    const EdgeInsets.symmetric(vertical: 0),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(3),
                                                        color: primaryColor),
                                                    child:
                                                    Text(
                                                      '3',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          color: whiteColor, fontSize: 16),
                                                    ),
                                                  ),),
                                                Expanded(flex:0,
                                                  child: InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 16,
                                                      )),)

                                              ],
                                            ),
                                          ) ,)
                                      ],
                                    ),

                                    const SizedBox(height: 0,),
                                    Text(
                                      "20 % offer",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: blackColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ) ,
                                    const SizedBox(height: 5,),
                                    Text(
                                      "View Details",
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
                );
              },
              childCount: carousalList.length,
            ),
          ),
        ],
      ),
    );
  }
}