import 'package:fidu_service/util/separate.dart';
import 'package:fidu_service/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'main_page/shop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fidu Service',
      theme: ThemeData(
        primaryColor: primaryColor,
        textTheme: GoogleFonts.nunitoTextTheme(
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: SizedBox(

          width: MediaQuery.of(context).size.width *
              0.70, // 75% of screen will be occupied
          child: Drawer(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView(

                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      SafeArea(child:  Container(
                        height: 50,
                        child:  Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Expanded(
                              flex: 0,
                              child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage('https://via.placeholder.com/140x100')
                              ),),
                            Expanded(
                                flex: 2,

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children:  [
                                    Text("Hello!",style: TextStyle(color: primaryColor,fontWeight: FontWeight.w600),),
                                    Text("Maria Christhu Rajan fjhbfbhbhwebfhjewbfhb",style: TextStyle(overflow: TextOverflow.ellipsis),)
                                  ],)
                            ),

                          ],
                        ),



                      ),),


                      ListTile(
                        onTap: (){},
                        leading:  Icon(
                          Icons.history,
                          size: 22,
                          color: primaryColor,
                        ),
                        // trailing: const Text(
                        //     "99+"
                        // ),
                        title:
                        Align(
                          child: Text(
                            "Order History",style: TextStyle(color: blackColor,fontWeight: FontWeight.w500),
                          ),
                          alignment: Alignment(-1.3, 0),
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

                        Align(
                          child: Text(
                            "Support",style: TextStyle(color: blackColor,fontWeight: FontWeight.w500),
                          ),
                          alignment: Alignment(-1.2, 0),
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
                        title:  Align(
                          child: Text(
                            "Help",style: TextStyle(color: blackColor,fontWeight: FontWeight.w500),
                          ),
                          alignment: Alignment(-1.2, 0),
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
                        title:  Align(
                          child: Text(
                            "Terms and Condition",style: TextStyle(color: blackColor,fontWeight: FontWeight.w500),
                          ),
                          alignment: Alignment(-1.7, 0),
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
                        title:  Align(
                          child: Text(
                            "Rate the Application",style: TextStyle(color: blackColor,fontWeight: FontWeight.w500),
                          ),
                          alignment: Alignment(-1.6, 0),
                        ),



                      ),



                    ],
                  ),),
                 Positioned(
                  bottom: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.70,
                      child:  Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: RichText(
                            text: TextSpan(
                              text: 'Created By ',
                              style: TextStyle(color: blackColor),
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
          actions: <Widget>[
            IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                icon: Icon(Icons.menu, size: 22, color: whiteColor),
                onPressed: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                }),
          ],
          centerTitle: false,
          title: Row(
            children: [
              const Expanded(
                  flex: 0,
                  child: InkWell(
                    child: Icon(
                      Icons.location_pin,
                      size: 20,
                    ),
                  )),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 2,
                  child: Text(
                    " ServiceFidu ServiceFidu ServiceFidu ServiceFidu Service",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700),
                  ))
            ],
          ),
          backgroundColor: primaryColor,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 70.0,
          items: <Widget>[
            Icon(
              Icons.more_vert_outlined,
              size: 24,
              color: whiteColor,
            ),
            Icon(Icons.shopping_cart_rounded, size: 24, color: whiteColor),
            Icon(Icons.local_fire_department_sharp,
                size: 24, color: whiteColor),
            Icon(Icons.local_shipping_rounded, size: 24, color: whiteColor),
            Icon(Icons.person_pin, size: 24, color: whiteColor),
          ],
          color: primaryColor,
          buttonBackgroundColor: primaryColor,
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
