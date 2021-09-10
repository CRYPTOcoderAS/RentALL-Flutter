import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/pages/categories/categories.dart';

import '../../widgets/appBar/appBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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
  Color color = Color(0xFFbe3144);
  customDivider(String title) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: color,
              height: 10,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: color,
              ),
              borderRadius: BorderRadius.circular(13),
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: GoogleFonts.nunito(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: color,
              height: 10,
            ),
          ),
        ],
      ),
    );
  }

  image_carousel() {
    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          height: 230.0,
          child: new CarouselSlider(
            options: CarouselOptions(
              pageSnapping: true,
              height: 200,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              viewportFraction: 0.8,
            ),
            items: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(
                          "images/flipkart3.jpg",
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(
                          "images/flipkart.jpg",
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(
                          "images/flipkart1.png",
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(
                          "images/flipkart2.jpg",
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ],
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     for (int i = 0; i < 5; i++)
        //       Container(
        //         width: 8,
        //         height: 8,
        //         margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        //         decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             color: i == _ImageCarouselIndex
        //                 ? Color.fromRGBO(0, 0, 0, 0.9)
        //                 : Color.fromRGBO(0, 0, 0, 0.4)),
        //       ),
        //   ],
        // ),
      ],
    );
  }

  deals_carousel() {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 320.0,
      child: new CarouselSlider(
        options: CarouselOptions(
          pageSnapping: true,
          height: 310,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 2000),
          viewportFraction: 0.8,
        ),
        items: [
          GestureDetector(
            onTap: () {},
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 500,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/mac.png",
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Name',
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 260),
                        child: Divider(
                          color: Colors.blueGrey,
                          thickness: 2,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.nunito(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: '₹999/mo',
                                style: GoogleFonts.nunito(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Text(
                        "Ends in 05:05:05",
                        style: GoogleFonts.nunito(
                          color: Theme.of(context)
                              .secondaryHeaderColor
                              .withOpacity(0.7),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.local_shipping_outlined,
                                color: Theme.of(context)
                                    .secondaryHeaderColor
                                    .withOpacity(0.7)),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text(
                                "24 hours",
                                style: GoogleFonts.nunito(
                                  color: Theme.of(context)
                                      .secondaryHeaderColor
                                      .withOpacity(0.7),
                                ),
                              ),
                            ),
                          ])
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 500,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/mac1.png",
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Name',
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 260),
                        child: Divider(
                          color: Colors.blueGrey,
                          thickness: 2,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.nunito(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: '₹999/mo',
                                style: GoogleFonts.nunito(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Text(
                        "Ends in 05:05:05",
                        style: GoogleFonts.nunito(
                          color: Theme.of(context)
                              .secondaryHeaderColor
                              .withOpacity(0.7),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.local_shipping_outlined,
                                color: Theme.of(context)
                                    .secondaryHeaderColor
                                    .withOpacity(0.7)),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text(
                                "24 hours",
                                style: GoogleFonts.nunito(
                                  color: Theme.of(context)
                                      .secondaryHeaderColor
                                      .withOpacity(0.7),
                                ),
                              ),
                            ),
                          ])
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 500,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/mac2.png",
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Name',
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 260),
                        child: Divider(
                          color: Colors.blueGrey,
                          thickness: 2,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.nunito(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: '₹999/mo',
                                style: GoogleFonts.nunito(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Text(
                        "Ends in 05:05:05",
                        style: GoogleFonts.nunito(
                          color: Theme.of(context)
                              .secondaryHeaderColor
                              .withOpacity(0.7),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.local_shipping_outlined,
                                color: Theme.of(context)
                                    .secondaryHeaderColor
                                    .withOpacity(0.7)),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text(
                                "24 hours",
                                style: GoogleFonts.nunito(
                                  color: Theme.of(context)
                                      .secondaryHeaderColor
                                      .withOpacity(0.7),
                                ),
                              ),
                            ),
                          ])
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 500,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/redmi.jpg",
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Name',
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 260),
                        child: Divider(
                          color: Colors.blueGrey,
                          thickness: 2,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.nunito(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: '₹999/mo',
                                style: GoogleFonts.nunito(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Text(
                        "Ends in 05:05:05",
                        style: GoogleFonts.nunito(
                          color: Theme.of(context)
                              .secondaryHeaderColor
                              .withOpacity(0.7),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.local_shipping_outlined,
                                color: Theme.of(context)
                                    .secondaryHeaderColor
                                    .withOpacity(0.7)),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text(
                                "24 hours",
                                style: GoogleFonts.nunito(
                                  color: Theme.of(context)
                                      .secondaryHeaderColor
                                      .withOpacity(0.7),
                                ),
                              ),
                            ),
                          ])
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String latitude = "";
  String longitude = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color color = Color(0xFFbe3144);

    final container = Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Text(
          'Consoles',
          textAlign: TextAlign.start,
          style: GoogleFonts.nunito(
            color: Theme.of(context).secondaryHeaderColor,
            fontSize: 22,
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120), child: CommonAppBar()),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image_carousel(),
              Container(
                color: Theme.of(context).primaryColor,
                child: CategoryScroll(),
              ),
              Container(
                height: 10,
                color: Theme.of(context).primaryColor,
              ),
              customDivider("Deals for you"),
              deals_carousel(),
              Container(
                color: Theme.of(context).primaryColor,
                child: Divider(
                  color: color,
                  height: 10,
                ),
              ),
              ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                        left: 15,
                      ),
                      child: Text(
                        'Mobiles ',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 200.0),
                      child: Divider(
                        thickness: 2,
                        color: color,
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          RentScroll(size),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 15),
                      child: Text(
                        'Musical Instruments',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 200.0),
                      child: Divider(
                        thickness: 2,
                        color: color,
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SingleRentScroll(size, 'images/guitar.jpg',
                                    "Guitar", "₹999/mo"),
                                SingleRentScroll(size, 'images/guitar.jpg',
                                    "Flute", "₹999/mo"),
                                SingleRentScroll(size, 'images/guitar.jpg',
                                    "Violen", "₹999/mo"),
                                SingleRentScroll(size, 'images/guitar.jpg',
                                    "Electric Bass", "₹999/mo"),
                                SingleRentScroll(size, 'images/guitar.jpg',
                                    "Drums", "₹999/mo"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "See more",
                                    style: GoogleFonts.nunito(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 15),
                      child: Text(
                        'Cameras',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 200.0),
                      child: Divider(
                        thickness: 2,
                        color: color,
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SingleRentScroll(size, 'images/dslr.jpg',
                                    "DSLR Camera", "₹999/mo"),
                                SingleRentScroll(size, 'images/dslr.jpg',
                                    "DSLR Camera", "₹999/mo"),
                                SingleRentScroll(size, 'images/dslr.jpg',
                                    "DSLR Camera", "₹999/mo"),
                                SingleRentScroll(size, 'images/dslr.jpg',
                                    "DSLR Camera", "₹999/mo"),
                                SingleRentScroll(size, 'images/dslr.jpg',
                                    "DSLR Camera", "₹999/mo"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "See more",
                                    style: GoogleFonts.nunito(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        'Laptops',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 200.0),
                      child: Divider(
                        thickness: 2,
                        color: color,
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SingleRentScroll(size, 'images/dell.jpg',
                                    "DELL Laptop", "₹999/mo"),
                                SingleRentScroll(size, 'images/dell.jpg',
                                    "DELL Laptop", "₹999/mo"),
                                SingleRentScroll(size, 'images/dell.jpg',
                                    "DELL Laptop", "₹999/mo"),
                                SingleRentScroll(size, 'images/dell.jpg',
                                    "DELL Laptop", "₹999/mo"),
                                SingleRentScroll(size, 'images/dell.jpg',
                                    "DELL Laptop", "₹999/mo"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "See more",
                                    style: GoogleFonts.nunito(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        'Clothing',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 200.0),
                      child: Divider(
                        thickness: 2,
                        color: color,
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SingleRentScroll(size, 'images/clothing.jpeg',
                                    "The Ambitious", "₹999/mo"),
                                SingleRentScroll(size, 'images/clothing.jpeg',
                                    "Traditional dress", "₹999/mo"),
                                SingleRentScroll(size, 'images/clothing.jpeg',
                                    "Outfit", "₹999/mo"),
                                SingleRentScroll(size, 'images/clothing.jpeg',
                                    "Classic", "₹999/mo"),
                                SingleRentScroll(size, 'images/clothing.jpeg',
                                    "Wedding dress", "₹999/mo"),
                                SingleRentScroll(size, 'images/clothing.jpeg',
                                    "Photoshoots", "₹999/mo"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "See more",
                                    style: GoogleFonts.nunito(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        'Air Conditioners',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 200.0),
                      child: Divider(
                        thickness: 2,
                        color: color,
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SingleRentScroll(
                                    size, 'images/ac.png', "LG", "₹999/mo"),
                                SingleRentScroll(size, 'images/ac.png',
                                    "Whirpool", "₹999/mo"),
                                SingleRentScroll(size, 'images/ac.png',
                                    "Hitachi", "₹999/mo"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "See more",
                                    style: GoogleFonts.nunito(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        'TV',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 200.0),
                      child: Divider(
                        thickness: 2,
                        color: color,
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SingleRentScroll(size, 'images/tv.png',
                                    "OnePlus TV", "₹999/mo"),
                                SingleRentScroll(
                                    size, 'images/tv.png', "Mi TV", "₹999/mo"),
                                SingleRentScroll(size, 'images/tv.png',
                                    "Samsung AUE", "₹999/mo"),
                                SingleRentScroll(size, 'images/tv.png',
                                    "Sony Smart TV", "₹999/mo"),
                                SingleRentScroll(size, 'images/tv.png',
                                    "LG Nano", "₹999/mo"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "See more",
                                    style: GoogleFonts.nunito(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        'Drones',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 200.0),
                      child: Divider(
                        thickness: 2,
                        color: color,
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SingleRentScroll(size, 'images/drone.jpg',
                                    "Parrot Mambo", "₹999/mo"),
                                SingleRentScroll(size, 'images/drone.jpg',
                                    "JJRC H45", "₹999/mo"),
                                SingleRentScroll(size, 'images/drone.jpg',
                                    "DJI Spark", "₹999/mo"),
                                SingleRentScroll(size, 'images/drone.jpg',
                                    "Yuneec Typhoon", "₹999/mo"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "See more",
                                    style: GoogleFonts.nunito(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        'Smart Watches',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 200.0),
                      child: Divider(
                        thickness: 2,
                        color: color,
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SingleRentScroll(size, 'images/watch.png',
                                    "Apple Watch Series 6", "₹999/mo"),
                                SingleRentScroll(size, 'images/watch.png',
                                    "Samsung Galaxy Watch 3", "₹999/mo"),
                                SingleRentScroll(size, 'images/watch.png',
                                    "Samsung Galaxy Active 2", "₹999/mo"),
                                SingleRentScroll(size, 'images/watch.png',
                                    "Oppo Watch", "₹999/mo"),
                                SingleRentScroll(size, 'images/watch.png',
                                    "TicWatch Pro 3", "₹999/mo"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "See more",
                                    style: GoogleFonts.nunito(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  container,
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 200.0),
                      child: Divider(
                        thickness: 2,
                        color: color,
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SingleRentScroll(size, 'images/consoles.jpeg',
                                    "PS5", "₹999/mo"),
                                SingleRentScroll(size, 'images/consoles.jpeg',
                                    "Xbox", "₹999/mo"),
                                SingleRentScroll(size, 'images/consoles.jpeg',
                                    "PS4", "₹999/mo"),
                                SingleRentScroll(size, 'images/consoles.jpeg',
                                    "PS3", "₹999/mo"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "See more",
                                    style: GoogleFonts.nunito(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(color: Theme.of(context).primaryColor, height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget RentScroll(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SingleRentScroll(
              size, 'images/redmi.jpg', "Redmi Note 7 Pro", "₹999/mo"),
          SingleRentScroll(
              size, 'images/redmi.jpg', "Redmi Note 7 Pro", "₹999/mo"),
          SingleRentScroll(
              size, 'images/redmi.jpg', "Redmi Note 7 Pro", "₹999/mo"),
          SingleRentScroll(
              size, 'images/redmi.jpg', "Redmi Note 7 Pro", "₹999/mo"),
          SingleRentScroll(
              size, 'images/redmi.jpg', "Redmi Note 7 Pro", "₹999/mo"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "See more",
              style: GoogleFonts.nunito(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget SingleRentScroll(Size size, String image, String title, String rent,
      {Widget navigator}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 320,
        width: 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: Offset(0, 25),
                blurRadius: 25,
                spreadRadius: -10)
          ],
          // border: Border.all(color: Theme.of(context).secondaryHeaderColor),
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                  ),
                  color: Theme.of(context).primaryColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(5.0),
                      topRight: const Radius.circular(5.0))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8.0),
              child: Text(
                title,
                style: GoogleFonts.nunito(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 100, bottom: 8),
              child: Divider(
                color: Colors.blueGrey,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Rent',
                style: GoogleFonts.nunito(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.nunito(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: rent,
                        style: GoogleFonts.nunito(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, left: 8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.local_shipping_outlined,
                    color: Theme.of(context)
                        .secondaryHeaderColor
                        .withOpacity(0.7)),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    "24 hours",
                    style: GoogleFonts.nunito(
                        color: Theme.of(context)
                            .secondaryHeaderColor
                            .withOpacity(0.7)),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 5.0),
                //   child: InkWell(
                //     key: Key("show_more_ink_well"),
                //     onTap: () {
                //       showMoreText("At your doorstep within 24 hours");
                //     },
                //     child: Icon(
                //       Icons.info_outline_rounded,
                // key:key,
                //       color: Colors.lightBlue,
                //       size: 18,
                //     ),
                //   ),
                // ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  // void showMoreText(String text) {
  //   ShowMoreTextPopup popup = ShowMoreTextPopup(context,
  //       text: text,
  //       textStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor),
  //       height: 200,
  //       width: 100,
  //       backgroundColor: Theme.of(context).primaryColor,
  //       padding: EdgeInsets.all(4.0),
  //       borderRadius: BorderRadius.circular(10.0), onDismiss: () {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Dismiss callback!")));
  //   });
  //
  //   popup.show(widgetKey: key);
  // }

  // ignore: non_constant_identifier_names
  Widget CategoryScroll() {
    return Padding(
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CategoriesList(index: index)));
                      },
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context).secondaryHeaderColor,
                                blurRadius: 0.1),
                          ],
                          color: Theme.of(context).primaryColor,
                          // border: Border.all(
                          //   color: Theme.of(context).secondaryHeaderColor,
                          // ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        width: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: SvgPicture.asset(categoriesImg[index],
                                  width: 100, height: 50),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 8, left: 5, right: 5),
                              child: Center(
                                child: Text(
                                  categories[index],
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.mukta(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
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
    );
  }

  Widget SingleCategory(Size size, String image, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).secondaryHeaderColor, blurRadius: 0.1),
          ],
          color: Theme.of(context).primaryColor,
          // border: Border.all(
          //   color: Theme.of(context).secondaryHeaderColor,
          // ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: SvgPicture.asset(image, width: 100, height: 50),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 5, right: 5),
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.mukta(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldControllers extends StatelessWidget {
  final Widget child;

  const TextFieldControllers({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          width: size.width * 0.80,
          height: 35,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 1),
            ],
            border: Border.all(
              color: Colors.black.withAlpha(55),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
