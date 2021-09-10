import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rentall/pages/categories/categories.dart';
import 'package:rentall/pages/profile/settings/LegalAndAbout.dart';
import 'package:rentall/pages/profile/settings/yourProfile.dart';
import 'package:rentall/pages/profile/viewOptions/viewOptions.dart';
import 'package:rentall/widgets/navbar/navBar.dart';
import 'package:rentall/widgets/navbar/themes.dart';
import 'package:rentall/widgets/widgets.dart';

import '../../widgets/appBar/appBar.dart';
import '../cart/cartPage.dart';
import '../login/ui.dart';
import 'settings/yourRequests/yourRequests.dart';

List categories = [
  "Musical Instruments",
  "Devices",
  "Books",
  "Consoles",
  "Clothing",
  "Combos",
  "Unique"
];
List categoriesImg = [
  "images/music.svg",
  "images/devices.svg",
  "images/book.svg",
  "images/consoles.svg",
  "images/clothing.svg",
  "images/combos.svg",
  "images/unique.svg",
];
List<int> currentOrdersQty = [1, 2, 3, 2, 1, 2, 5];

List currentOrdersName = [
  "2020 Apple MacBook Air",
  "JUAREZ Belleza Guitar",
  "Pluto X - Nano Drone with Camera"
];
List<int> currentOrdersRentingTime = [6, 3, 12];
// List currentOrdersImg = [];
List currentOrdersImg = [
  "images/mac1.png",
  "images/guitar.jpg",
  "images/drone.jpg"
];
List currentOrdersRentPrice = [1299, 999, 1099];
List currentOrdersBuyPrice = [120999, 15999, 35999];
List discountForBuy = [20000, 5000, 5000];
List currentOrdersMinimiumEMI = [9000, 2000, 4000];
List yourOrdersImg = [
  "images/drone.jpg",
  "images/mac1.png",
  "images/guitar.jpg",
];

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool currentOrders = false;
  bool yourOrders = false;
  bool cartItems = false;
  bool shopByCategory = false;
  bool settings = false;
  bool light = false;
  bool userAuthenticated = false;
  void showCustomerService() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (builder) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter bsState) {
          return Container(
            height: 200,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: new BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Any queries? Contact us right away.",
                      style: GoogleFonts.nunito(color: Colors.grey)),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8, left: 15, right: 15),
                      child: Icon(
                        CupertinoIcons.phone,
                        color: color,
                      ),
                    ),
                    Text("Make a call",
                        style: GoogleFonts.nunito(
                            color: Theme.of(context).secondaryHeaderColor)),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8, left: 15, right: 15),
                      child: Icon(
                        CupertinoIcons.mail,
                        // Icons.mail,
                        color: color,
                      ),
                    ),
                    Text("Send an email",
                        style: GoogleFonts.nunito(
                            color: Theme.of(context).secondaryHeaderColor)),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8, left: 15, right: 15),
                      child: Icon(
                        CupertinoIcons.chat_bubble,
                        color: color,
                        // size: 20,
                      ),
                    ),
                    Text("Chat with us",
                        style: GoogleFonts.nunito(
                            color: Theme.of(context).secondaryHeaderColor)),
                  ],
                ),
              ],
            ),
          );
        });
      },
    );
  }

  checkState() async {
    final store = new FlutterSecureStorage();
    if (FirebaseAuth.instance.currentUser == null) {
      if (await store.containsKey(key: 'sn')) {
        if (await store.read(key: 'sn') == 'true') {
          setState(() {
            userAuthenticated = true;
          });
        } else {
          setState(() {
            userAuthenticated = false;
          });
        }
      } else {
        setState(() {
          userAuthenticated = false;
        });
      }
    } else {
      setState(() {
        userAuthenticated = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    themeProvider.isDarkMode ? light = false : light = true;
    Size size = MediaQuery.of(context).size;
    Color color = Color(0xFFbe3144);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    // pinned: true,
                    elevation: 0.0,
                    leadingWidth: 150,
                    backgroundColor: color,
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => new NavigationBar(
                                      page: "Home", index: 0)));
                        },
                        child: Image.asset(
                          'images/logo.png',
                          width: 100,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                ];
              },

              // appBar: PreferredSize(
              //   preferredSize: Size.fromHeight(124),
              //   child: Container(
              //     width: 50,
              //     height: 50,
              //     color: color,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Image.asset(
              //             'images/logo.png',
              //             width: 100,
              //             height: 100,
              //           ),
              //         ),
              //         Row(
              //           children: [
              //             IconButton(
              //                 onPressed: () {},
              //                 icon: Icon(
              //                   Icons.search,
              //                   color: Theme.of(context).primaryColor,
              //                 )),
              //             IconButton(
              //                 onPressed: () {
              //                   setState(() {
              //                     final provider = Provider.of<ThemeProvider>(context,
              //                         listen: false);
              //                     provider.toggleTheme(light);
              //                     light = !light;
              //                   });
              //                 },
              //                 icon: light == true
              //                     ? Icon(Icons.wb_sunny_outlined,
              //                         color: Theme.of(context).primaryColor)
              //                     : Icon(CupertinoIcons.moon_fill,
              //                         color: Theme.of(context).primaryColor)),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // AppBar(
              //   backgroundColor: color,
              //   leading: Image.asset('images/logo.png'),
              //   actions: [
              //     IconButton(
              //         onPressed: () {
              //           setState(() {
              //             final provider =
              //                 Provider.of<ThemeProvider>(context, listen: false);
              //             provider.toggleTheme(light);
              //             light = !light;
              //           });
              //         },
              //         icon: light == true
              //             ? Icon(Icons.wb_sunny_outlined)
              //             : Icon(Icons.dark_mode)),
              //     // Switch.adaptive(
              //     //   activeColor: Theme.of(context).secondaryHeaderColor,
              //     //   value: themeProvider.isDarkMode,
              //     //   onChanged: (value) {
              //     //     final provider =
              //     //         Provider.of<ThemeProvider>(context, listen: false);
              //     //     provider.toggleTheme(value);
              //     //   },
              //     // ),
              //   ],
              // ),
              body: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 0.0,
                        bottom: 8,
                        left: 8,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 0.0,
                              left: 5,
                            ),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                // USE THIS FOR IMAGE
                                // image: DecorationImage(
                                //   image: AssetImage(
                                //     'images/mac1.png',
                                //   ),
                                //   fit: BoxFit.cover,
                                // ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.4),
                              ),
                              child: Icon(
                                CupertinoIcons.person,
                                size: 35,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                            // // CircleAvatar(
                            // //   radius: 30,
                            // //   backgroundColor: Theme.of(context).primaryColor,
                            // //   // foregroundColor: color,
                            // //   child: CircleAvatar(
                            // //     radius: 28,
                            // //     backgroundColor: color,
                            // //     child: Icon(
                            // //       CupertinoIcons.person,
                            // //       color: Theme.of(context).secondaryHeaderColor,
                            // //     ),
                            // //   ),
                            // ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              width: size.width / 1.457,
                              height: 35,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0, 25),
                                        blurRadius: 25,
                                        spreadRadius: -10)
                                  ],
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 0.1),
                                  color: color,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: userAuthenticated
                                          ? Text(
                                              "Hello,\t",
                                              style: GoogleFonts.nunito(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 18,
                                              ),
                                            )
                                          : Text(
                                              "Hello,\t",
                                              style: GoogleFonts.nunito(
                                                fontSize: 18,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                    ),
                                    userAuthenticated
                                        ? Text(
                                            "$userName",
                                            softWrap: true,
                                            style: GoogleFonts.merriweather(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              new Start()));
                                            },
                                            child: Text(
                                              "Tap to sign in",
                                              style: GoogleFonts.mukta(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10.0),
                  //   child: Divider(
                  //     color: color,
                  //     height: 10,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      "Your Account",
                      style: GoogleFonts.mukta(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 35.0,
                      left: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentOrders = !currentOrders;
                        });
                      },
                      child: Row(
                        children: [
                          currentOrders
                              ? Icon(
                                  Icons.arrow_drop_down,
                                  color: Theme.of(context).secondaryHeaderColor,
                                )
                              : Icon(
                                  Icons.arrow_right_outlined,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                          Container(
                            color: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Current Orders',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.nunito(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  currentOrders
                      ? currentOrdersImg.length == 0
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'images/emptyprofile.svg',
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("You are missing out!",
                                      style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                    left: 50,
                                    right: 50,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  NavigationBar(
                                                      page: "Home", index: 0)));
                                    },
                                    child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              color,
                                              // Colors.redAccent,
                                              Colors.red.withOpacity(0.9),
                                              // Colors.orangeAccent,
                                              // Colors.orange
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Center(
                                          child: Text("EXPLORE",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                  ),
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                width: 500,
                                child: ListView.builder(
                                    itemCount: currentOrdersImg.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black,
                                                // offset: Offset(0, 25),
                                                blurRadius: 2,
                                              )
                                            ],
                                            border: Border.all(
                                                color: Colors.grey, width: 0.2),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 200,
                                                width: 200,
                                                decoration: new BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          currentOrdersImg[
                                                              index]),
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.2),
                                                    borderRadius: new BorderRadius
                                                            .only(
                                                        topLeft: const Radius
                                                            .circular(15.0),
                                                        bottomLeft: const Radius
                                                            .circular(15.0))),
                                              ),
                                              Container(
                                                width: 150,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15,
                                                              left: 8.0,
                                                              right: 4.0),
                                                      child: Text(
                                                        currentOrdersName[
                                                            index],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 12,
                                                          color: Theme.of(
                                                                  context)
                                                              .secondaryHeaderColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 25.0),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context).push(
                                                              HeroDialogRoute(
                                                                  fullscreenDialog:
                                                                      false,
                                                                  builder:
                                                                      (context) {
                                                                    return Center(
                                                                        child: viewOptions(
                                                                            index:
                                                                                0,
                                                                            productIndex:
                                                                                index));
                                                                  }));
                                                        },
                                                        child: Hero(
                                                          tag: "viewOptions",
                                                          createRectTween:
                                                              (begin, end) {
                                                            return CustomRectTween(
                                                                begin: begin,
                                                                end: end);
                                                          },
                                                          child: Container(
                                                            width: 120,
                                                            height: 25,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  color,
                                                                  // Colors.redAccent,
                                                                  Colors.red,
                                                                  // Colors.orangeAccent,
                                                                  // Colors.orange
                                                                ],
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                  "Increase period",
                                                                  style:
                                                                      GoogleFonts
                                                                          .mukta(
                                                                    fontSize:
                                                                        13,
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  )),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 15.0),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              Navigator.of(context).push(
                                                                  HeroDialogRoute(
                                                                      fullscreenDialog:
                                                                          false,
                                                                      builder:
                                                                          (context) {
                                                                        return Center(
                                                                            child:
                                                                                viewOptions(index: 1, productIndex: index));
                                                                      }));
                                                            },
                                                            child: Hero(
                                                              tag:
                                                                  "viewOptions",
                                                              createRectTween:
                                                                  (begin, end) {
                                                                return CustomRectTween(
                                                                    begin:
                                                                        begin,
                                                                    end: end);
                                                              },
                                                              child: Container(
                                                                width: 90,
                                                                height: 25,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      color,
                                                                      // Colors.redAccent,
                                                                      Colors
                                                                          .red,
                                                                      // Colors.orangeAccent,
                                                                      // Colors.orange
                                                                    ],
                                                                  ),
                                                                  color: color
                                                                      .withOpacity(
                                                                          0.9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                      "Own it",
                                                                      style: GoogleFonts
                                                                          .mukta(
                                                                        // fontSize: 12,
                                                                        color: Theme.of(context)
                                                                            .primaryColor,
                                                                      )),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15.0),
                                                      child: Text(
                                                          "Track your order",
                                                          style: GoogleFonts
                                                              .nunito(
                                                            color: Colors.blue,
                                                            fontSize: 12,
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          yourOrders = !yourOrders;
                        });
                      },
                      child: Row(
                        children: [
                          yourOrders
                              ? Icon(
                                  Icons.arrow_drop_down,
                                  color: Theme.of(context).secondaryHeaderColor,
                                )
                              : Icon(
                                  Icons.arrow_right_outlined,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                          Container(
                            color: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Your Orders',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.nunito(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  yourOrders
                      ? yourOrdersImg.length == 0
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child:
                                      Text('Your adventure has not started yet',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.mukta(
                                            color: Theme.of(context)
                                                .secondaryHeaderColor,
                                            fontSize: 22,
                                          )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                    left: 50,
                                    right: 50,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  NavigationBar(
                                                      page: "Home", index: 0)));
                                    },
                                    child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              color,
                                              // Colors.redAccent,
                                              Colors.red.withOpacity(0.9),
                                              // Colors.orangeAccent,
                                              // Colors.orange
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Center(
                                          child: Text("RETURN TO HOMEPAGE",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                  ),
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 500,
                                height: 200,
                                child: ListView.builder(
                                    itemCount: yourOrdersImg.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 200,
                                          width: 200,
                                          decoration: new BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Theme.of(context)
                                                      .secondaryHeaderColor,
                                                  // offset: Offset(0, 25),
                                                  blurRadius: 1,
                                                ),
                                              ],
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    yourOrdersImg[index]),
                                                fit: BoxFit.fitWidth,
                                              ),
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.1),
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      15)),
                                        ),
                                      );
                                    }),
                              ),
                            )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          cartItems = !cartItems;
                        });
                      },
                      child: Row(
                        children: [
                          cartItems
                              ? Icon(
                                  Icons.arrow_drop_down,
                                  color: Theme.of(context).secondaryHeaderColor,
                                )
                              : Icon(
                                  Icons.arrow_right_outlined,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                          Container(
                            color: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Your Cart Items',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.nunito(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  cartItems
                      ? cartItemName.length == 0
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child:
                                      Text('Your adventure has not started yet',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.mukta(
                                            color: Theme.of(context)
                                                .secondaryHeaderColor,
                                            fontSize: 22,
                                          )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                    left: 50,
                                    right: 50,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pushReplacement(MaterialPageRoute(
                                              builder: (context) =>
                                                  NavigationBar(
                                                    page: "Home",
                                                    index: 0,
                                                  )));
                                    },
                                    child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              color,
                                              // Colors.redAccent,
                                              Colors.red.withOpacity(0.9),
                                              // Colors.orangeAccent,
                                              // Colors.orange
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Center(
                                          child: Text("RETURN TO HOMEPAGE",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                  ),
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 500,
                                    height: 150,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: cartItemName.length,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 300,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor,
                                                      // offset: Offset(0, 25),
                                                      blurRadius: 2,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 120,
                                                    height: 150.0,
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Theme.of(
                                                                    context)
                                                                .secondaryHeaderColor,
                                                            // offset: Offset(0, 25),
                                                            blurRadius: 2,
                                                          )
                                                        ],
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: Center(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  image:
                                                                      AssetImage(
                                                                    cartItemImg[
                                                                        index],
                                                                  ),
                                                                  fit: BoxFit
                                                                      .scaleDown,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 12.0),
                                                  Expanded(
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Container(
                                                            width: 300.0,
                                                            child: Text(
                                                                cartItemName[
                                                                    index],
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 2,
                                                                style: GoogleFonts.nunito(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .secondaryHeaderColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                          SizedBox(height: 10),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                            .grey[
                                                                        300],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  child: Icon(
                                                                      CupertinoIcons
                                                                          .minus,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          15.0)),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                                child: Text(
                                                                    '${cartItemCount[index]}',
                                                                    style: GoogleFonts.ubuntu(
                                                                        color: Theme.of(context)
                                                                            .secondaryHeaderColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            16)),
                                                              ),
                                                              Container(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        color,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  child: Icon(
                                                                      Icons.add,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          15.0)),
                                                              Spacer(),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            15.0),
                                                                child: Text(
                                                                    "\u20b9 ${formatter.format(cartItemPrice[index])}",
                                                                    style: GoogleFonts
                                                                        .openSans(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .secondaryHeaderColor,
                                                                    )),
                                                              ),
                                                            ],
                                                          ),
                                                        ]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 15.0,
                                      left: 50,
                                      right: 50,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pushReplacement(MaterialPageRoute(
                                                builder: (context) =>
                                                    NavigationBar(
                                                      page: "Cart",
                                                      index: 2,
                                                    )));
                                      },
                                      child: Container(
                                          height: 50,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Center(
                                            child: Text("PROCEED TO CHECKOUT",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          shopByCategory = !shopByCategory;
                        });
                      },
                      child: Row(
                        children: [
                          shopByCategory
                              ? Icon(
                                  Icons.arrow_drop_down,
                                  color: Theme.of(context).secondaryHeaderColor,
                                )
                              : Icon(
                                  Icons.arrow_right_outlined,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                          Container(
                            color: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Shop by Category',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.nunito(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  shopByCategory
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 150,
                            width: 500,
                            child: ListView.builder(
                                itemCount: categories.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 4,
                                    ),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CategoriesList(
                                                            index: index)));
                                          },
                                          child: Container(
                                            height: 120,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Theme.of(context)
                                                        .secondaryHeaderColor,
                                                    blurRadius: 0.1),
                                              ],
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              // border: Border.all(
                                              //   color: Theme.of(context).secondaryHeaderColor,
                                              // ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            width: 120,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4.0),
                                                  child: SvgPicture.asset(
                                                      categoriesImg[index],
                                                      width: 100,
                                                      height: 50),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 8,
                                                      left: 5,
                                                      right: 5),
                                                  child: Center(
                                                    child: Text(
                                                      categories[index],
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: GoogleFonts.mukta(
                                                        color: Theme.of(context)
                                                            .secondaryHeaderColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )
                      : Container(),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 40,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        print("Rent your products");
                      },
                      child: Row(
                        children: [
                          Container(
                            color: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Rent & Sell your Products',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.nunito(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          settings = !settings;
                        });
                      },
                      child: Row(
                        children: [
                          settings
                              ? Icon(
                                  Icons.arrow_drop_down,
                                  color: Theme.of(context).secondaryHeaderColor,
                                )
                              : Icon(
                                  Icons.arrow_right_outlined,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                          Container(
                            color: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Settings',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.nunito(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  settings == true
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                new yourProfile()));
                                  },
                                  child: Container(
                                    color: Theme.of(context).primaryColor,
                                    child: Text(
                                      'Your Profile',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.nunito(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                new yourRequests(
                                                  index: 0,
                                                )));
                                  },
                                  child: Container(
                                    color: Theme.of(context).primaryColor,
                                    child: Text(
                                      'Your Requests',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.nunito(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  color: Theme.of(context).primaryColor,
                                  child: Text(
                                    'Languages',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.nunito(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                new LegalAndAbout()));
                                  },
                                  child: Container(
                                    color: Theme.of(context).primaryColor,
                                    child: Text(
                                      'Legal and About',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.nunito(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    showCustomerService();
                                  },
                                  child: Container(
                                    color: Theme.of(context).primaryColor,
                                    child: Text(
                                      'Customer Service',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.nunito(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              )),
            )));
  }
}
