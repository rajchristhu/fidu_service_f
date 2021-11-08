import 'package:fidu_service/util/separate.dart';
import 'package:fidu_service/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:geolocator/geolocator.dart';
import 'main_page/map/map.dart';
import 'main_page/shop.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}
final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
Position? _currentPosition;
String? _currentAddress;
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fidu Service',
      theme: ThemeData(
        primaryColor: primaryColor,
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: BottomNavBar(),
    );
  }
}


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _page = 2;
    _getCurrentLocation();

  }
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = p[0];
      setState(() {
        _currentAddress =
        "${place.name!=null?place.name+" ,":""}${place.subLocality!=null?place.subLocality+" ,":""}${place.locality} ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: SizedBox(

          width: MediaQuery.of(context).size.width *
              0.80, // 75% of screen will be occupied
          child: Drawer(
            child: Stack(
              children: [
                Container(

                  height: MediaQuery.of(context).size.height,
                  decoration:  BoxDecoration(
                    color: whiteColor,
                  ),
                  child: ListView(

                    padding: EdgeInsets.only(top: 20),
                    children: <Widget>[
                      SafeArea(child:  Container(
padding: EdgeInsets.only(bottom: 10,left: 10),
                        child:  Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            const Expanded(
                              flex: 0,
                              child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage('https://via.placeholder.com/140x100')
                              ),),
                            SizedBox(width: 20,),
                            Expanded(
                                flex: 2,

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children:  [
                                    Text("Hello!",style: TextStyle(color: primaryColor,fontWeight: FontWeight.w600),),
                                    Text("Maria Christhu Rajan fjhbfbhbhwebfhjewbfhb",style: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w600),)
                                  ],)
                            ),

                          ],
                        ),



                      ),),


                      ListTile(
                        onTap: (){
                          // getLocation();
                        },
                        leading:  Icon(
                          Icons.history,
                          size: 22,
                          color: primaryColor,
                        ),
                        // trailing: const Text(
                        //     "99+"
                        // ),
                        title:
                         Text(
                            "Order History",style: TextStyle(color: blackColor,fontWeight: FontWeight.w600),
                          ),



                      ),
                      MySeparator(color: grayColor,),

                      ListTile(
                        onTap: (){},
                        leading:  Icon(
                          Icons.support_agent_rounded,
                          size: 22,
                          color: primaryColor,
                        ),
                        title:


                          Text(
                            "Support",style: TextStyle(color: blackColor,fontWeight: FontWeight.w600),
                          ),


                      ),
                      MySeparator(color: grayColor,),

                      ListTile(
                        onTap: (){},

                        leading:  Icon(
                          Icons.contact_support,
                          size: 22,
                          color: primaryColor,
                        ),
                        title:  Text(
                          "Help",style: TextStyle(color: blackColor,fontWeight: FontWeight.w600),
                        ),



                      ),
                      MySeparator(color: grayColor,),

                      ListTile(
                        onTap: (){},
                        leading:  Icon(
                          Icons.note_rounded,
                          size: 22,
                          color: primaryColor,
                        ),
                        title:   Text(
                            "Terms and Condition",style: TextStyle(color: blackColor,fontWeight: FontWeight.w600),
                          ),



                      ),
                      MySeparator(color: grayColor,),

                      ListTile(
                        onTap: (){},
                        leading:  Icon(
                          Icons.star_rate_rounded,
                          size: 22,
                          color: primaryColor,
                        ),
                        title:   Text(
                            "Rate the Application",style: TextStyle(color: blackColor,fontWeight: FontWeight.w600),
                          ),



                      ),



                    ],
                  ),),
                 Positioned(
                  bottom: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.80,
                      child:  Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: RichText(
                            text: TextSpan(
                              text: 'Created By ',
                              style: TextStyle(color: blackColor,
                                  fontSize:10,fontFamily: GoogleFonts.nunitoSans().fontFamily),

                              children:  <TextSpan>[
                                TextSpan(text: 'CESEAGOD', style: TextStyle(fontWeight: FontWeight.bold,color: primaryColor)),
                              ],
                            ),
                          )
                        ),
                      ),)
                   )
              ],
            )


          ),
        ),
        appBar: AppBar(
          toolbarHeight: 60,
          elevation:0.3,
          shadowColor: blackColor,
          foregroundColor: whiteColor,
          actions: <Widget>[
            IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                icon: Icon(Icons.menu_rounded, size: 23, color: blackColor),
                onPressed: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                }),
          ],
          centerTitle: false,
          title:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 0,
                      child: InkWell(
                        child: Icon(
                          Icons.location_pin,
                          color: primaryColor,
                          size: 16,
                        ),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
"Location",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: dark_blue,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
              const SizedBox(
                height: 4,
              ),
            _currentPosition != null &&
                  _currentAddress != null?
                Text(_currentAddress!,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: blackColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600),
              ): Text("--",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: blackColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600),
            ),

            ],
          )

         ,
          backgroundColor: whiteColor,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 55.0,
          items: <Widget>[
            Icon(
              Icons.more_vert_outlined,
              size: 22,
              color: whiteColor,
            ),
            Icon(Icons.shopping_cart_rounded, size: 22, color: whiteColor),
            Icon(Icons.fastfood_rounded,
                size: 22, color: whiteColor),
            Icon(Icons.local_shipping_rounded, size: 22, color: whiteColor),
            Icon(Icons.person_pin, size: 22, color: whiteColor),
          ],
          color: primaryColors,
          buttonBackgroundColor: primaryColors,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: _page == 0
            ? Container()
            : _page == 1
                ? Container()
                : _page == 2
                    ? const ShopFidu()
                    : _page == 3
                        ? Container()
                        : _page == 4
                            ? Container()
                            : Container());
  }
}
