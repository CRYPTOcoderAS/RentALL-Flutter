import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/widgets/appBar/appBar.dart';
import 'package:rentall/widgets/widgets.dart';

List cartItemName = [
  "Apple Watch Series 6",
  "Nikon D3400 Mirrorless",
  "2020 Headphones Outfit",
  "2020 Headphones Outfit",
  "2020 Headphones Outfit",
  "2020 Headphones Outfit",
  "2020 Headphones Outfit",
  "2020 Headphones Outfit",
  "2020 Headphones Outfit",
  "2020 Headphones Outfit"
];
List cartItemCount = [
  1,
  2,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
];
List cartItemPrice = [1099, 999, 499, 499, 499, 499, 499, 499, 499, 499];
List cartItemImg = [
  "images/watch.png",
  "images/dslr.jpg",
  "images/clothing.jpeg",
  "images/clothing.jpeg",
  "images/clothing.jpeg",
  "images/clothing.jpeg",
  "images/clothing.jpeg",
  "images/clothing.jpeg",
  "images/clothing.jpeg",
  "images/clothing.jpeg"
];

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalAmount = 0;
  int discount = 999;
  int subTotal;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      cartItemPrice.forEach((element) {
        totalAmount = totalAmount + element;
      });
      subTotal = totalAmount - discount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CommonAppBar(),
      ),
      body: cartItemName.length == 0
          ? Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 35.0),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SvgPicture.asset(
                    'images/emptycart.svg',
                    width: 300,
                    height: 300,
                  ),
                ),
                Spacer(),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.muktaMahee(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: '${cartItemName.length}',
                            style: GoogleFonts.muktaMahee(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' The cart seems empty',
                            style: GoogleFonts.muktaMahee(
                                fontSize: 20,
                                color: Theme.of(context).secondaryHeaderColor,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                // Text('The cart is empty',
                //     textAlign: TextAlign.start,
                //     style: GoogleFonts.muktaMahee(
                //       color: Theme.of(context).secondaryHeaderColor,
                //       fontSize: 22,
                //     )),
                Spacer(),
                Text('Your adventure has not started yet,',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.mukta(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 22,
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 50,
                    right: 50,
                    bottom: 15,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print("Browse now");
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
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text("EXPLORE NOW",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        )),
                  ),
                ),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 18.0),
                Text('Your Cart',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunito(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 22,
                    )),
                SizedBox(height: 5.0),
                Expanded(
                  flex: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: cartItemName.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    // offset: Offset(0, 25),
                                    blurRadius: 2,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                          // offset: Offset(0, 25),
                                          blurRadius: 2,
                                        )
                                      ],
                                      color: Theme.of(context).primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              cartItemImg[index],
                                            ),
                                            fit: BoxFit.scaleDown,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.0),
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 300.0,
                                          child: Text(cartItemName[index],
                                              style: GoogleFonts.nunito(
                                                  color: Theme.of(context)
                                                      .secondaryHeaderColor,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Icon(
                                                    CupertinoIcons.minus,
                                                    color: Colors.white,
                                                    size: 15.0)),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(
                                                  '${cartItemCount[index]}',
                                                  style: GoogleFonts.ubuntu(
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16)),
                                            ),
                                            Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color: color,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Icon(Icons.add,
                                                    color: Colors.white,
                                                    size: 15.0)),
                                            Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0),
                                              child: Text(
                                                  "\u20b9 ${formatter.format(cartItemPrice[index])}",
                                                  style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
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
                SizedBox(height: 21.0),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                          style: GoogleFonts.nunito(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child:
                            Text("\u20b9 ${formatter.format(totalAmount)}/mo",
                                style: GoogleFonts.openSans(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Discount",
                          style: GoogleFonts.nunito(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: 14,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text("\u20b9 ${formatter.format(discount)}",
                            style: GoogleFonts.openSans(
                              color: Theme.of(context).secondaryHeaderColor,
                              fontSize: 14,
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200.0),
                  child: Divider(
                    color: Colors.blueGrey,
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub Total",
                          style: GoogleFonts.nunito(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text("\u20b9 ${formatter.format(subTotal)}/mo",
                            style: GoogleFonts.openSans(
                              color: Theme.of(context).secondaryHeaderColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 8,
                    right: 8,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print("Proceed to checkout");
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
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text("PROCEED TO CHECKOUT",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        )),
                  ),
                ),
                SizedBox(height: 18.0),
              ],
            ),
    );
  }
}
