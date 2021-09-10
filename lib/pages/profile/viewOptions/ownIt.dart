import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/pages/profile/profile.dart';
import 'package:rentall/widgets/widgets.dart';

class OwnIt extends StatefulWidget {
  final int productIndex;

  const OwnIt({Key key, this.productIndex}) : super(key: key);
  @override
  _OwnItState createState() => _OwnItState();
}

class _OwnItState extends State<OwnIt> {
  List currentOrdersFeatures = [
    ["13-inch Retina Display", "M1 Chip", "16 GB RAM", "1 TB SSD"],
    ["Easy to play", "Small and good", "Elegant & better", "Makes life good"],
    [
      "Super cool stuff",
      " Can enjoy all day",
      "Long life battery",
      "Good drone"
    ]
  ];
  List currentOrdersSpecs = [
    ["13-inch Retina Display", "M1 Chip", "16 GB RAM", "1 TB SSD"],
    ["Easy to play", "Small and good", "Elegant & better", "Makes life good"],
    [
      "Super cool stuff",
      " Can enjoy all day",
      "Long life battery",
      "Good drone"
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Container(
          width: 500,
          height: 451,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 500,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).secondaryHeaderColor,
                          // offset: Offset(0, 25),
                          blurRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    currentOrdersImg[widget.productIndex],
                                  ),
                                  fit: BoxFit.scaleDown,
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 300.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, left: 2, right: 2),
                                  child: Text(
                                      "${currentOrdersName[widget.productIndex]}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: GoogleFonts.nunito(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                      )),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 4.0, right: 2),
                                    child: Text("Qty:",
                                        style: GoogleFonts.nunito(
                                          fontSize: 10,
                                          color: Colors.grey[400],
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 4.0, right: 2),
                                    child: Text(
                                        "${currentOrdersQty[widget.productIndex]}",
                                        style: GoogleFonts.nunito(
                                          fontSize: 10,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                        )),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15.0, bottom: 4),
                                    child: Text(
                                        "\u20b9 ${formatter.format(currentOrdersBuyPrice[widget.productIndex] - discountForBuy[widget.productIndex])}",
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          "Features",
                          style: GoogleFonts.mukta(
                              fontWeight: FontWeight.bold, color: color),
                        ),
                      ),
                      Container(
                        width: 110,
                        height: 100,
                        child: ListView.builder(
                            itemCount:
                                currentOrdersFeatures[widget.productIndex]
                                    .length,
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                            ),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: DottedText(
                                  currentOrdersFeatures[widget.productIndex]
                                      [index],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.nunito(
                                      fontSize: 13,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Specs",
                        style: GoogleFonts.mukta(
                            fontWeight: FontWeight.bold, color: color),
                      ),
                      Container(
                        width: 110,
                        height: 100,
                        child: ListView.builder(
                            itemCount:
                                currentOrdersSpecs[widget.productIndex].length,
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                            ),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: DottedText(
                                  currentOrdersSpecs[widget.productIndex]
                                      [index],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.nunito(
                                      fontSize: 13,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ],
              ),
              // Spacer(flex: 4),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(),
              ),
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
                      child: Text(
                          "\u20b9 ${formatter.format(currentOrdersBuyPrice[widget.productIndex])}",
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
                          color: color,
                          fontSize: 14,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                          "\u20b9 ${formatter.format(discountForBuy[widget.productIndex])}",
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            color: color,
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
                      child: Text(
                          '\u20b9 ${formatter.format(currentOrdersBuyPrice[widget.productIndex] - discountForBuy[widget.productIndex])}',
                          style: GoogleFonts.openSans(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 8,
                  right: 8,
                ),
                child: GestureDetector(
                  onTap: () {
                    print(currentOrdersFeatures[0][0]);
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
              Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.muktaMahee(color: Colors.blue),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'EMI starts from ',
                              style: GoogleFonts.muktaMahee()),
                          TextSpan(
                              text:
                                  '\u20b9 ${formatter.format(currentOrdersMinimiumEMI[widget.productIndex])}/mo',
                              style: GoogleFonts.muktaMahee(
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
