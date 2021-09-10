import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/pages/profile/profile.dart';
import 'package:rentall/widgets/widgets.dart';

class IncreaseTime extends StatefulWidget {
  final int productIndex;

  const IncreaseTime({Key key, this.productIndex}) : super(key: key);
  @override
  _IncreaseTimeState createState() => _IncreaseTimeState();
}

class _IncreaseTimeState extends State<IncreaseTime> {
  int totalPrice;
  int indexTop = 1;
  double timeAdded = 6;
  int totalTime;
  final labels = [
    1,
    3,
    6,
    12,
  ];

  @override
  void initState() {
    setState(() {
      totalPrice = currentOrdersRentPrice[widget.productIndex];
      totalTime =
          timeAdded.toInt() + currentOrdersRentingTime[widget.productIndex];
    });
    super.initState();
  }

  Widget buildLabel({
    @required String label,
    @required double width,
    @required Color color,
  }) =>
      Container(
        width: width,
        child: Text(
          label.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );

  Widget build(BuildContext context) {
    Widget buildSliderTopLabel() {
      final double min = 0;
      final double max = labels.length - 1.0;
      final divisions = labels.length - 1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Utils.modelBuilder(
                labels,
                (index, label) {
                  Color ThemeColor = Color(0xFFbe3144);
                  final selectedColor = ThemeColor;
                  final unselectedColor = Colors.grey;
                  final isSelected = index <= indexTop;
                  final color = isSelected ? selectedColor : unselectedColor;

                  return buildLabel(
                      label: label.toString(), color: color, width: 30);
                },
              ),
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 1.0,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 18.0),
            ),
            child: Slider(
              value: indexTop.toDouble(),
              min: min,
              max: max,
              divisions: divisions,
              activeColor: color,
              inactiveColor: Colors.blueGrey.shade50,
              // label: labels[indexTop].toString(),
              onChanged: (value) => setState(() {
                this.indexTop = value.toInt();
                totalTime = labels[indexTop] +
                    currentOrdersRentingTime[widget.productIndex];
                if (labels[indexTop] == 1) {
                  totalPrice =
                      currentOrdersRentPrice[widget.productIndex] + 200;
                } else if (labels[indexTop] == 3) {
                  totalPrice = currentOrdersRentPrice[widget.productIndex];
                } else if (labels[indexTop] == 6) {
                  totalPrice =
                      currentOrdersRentPrice[widget.productIndex] - 100;
                } else if (labels[indexTop] == 12) {
                  totalPrice =
                      currentOrdersRentPrice[widget.productIndex] - 300;
                }
              }),
            ),
          ),
        ],
      );
    }
    // buildSliderTopLabel() {
    //   List time = [1, 3, 6, 12];
    //   double min = 1.0;
    //   double max = 12.0;
    //   final divisions = time.length - 1;
    //   return Column(
    //     children: [
    //       Container(
    //           margin: EdgeInsets.symmetric(horizontal: 15),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: Utils.modelBuilder(time, (index, label) {
    //               Color ThemeColor = Color(0xFFbe3144);
    //               final selectedColor = ThemeColor;
    //               final unselectedColor = Colors.grey;
    //               final isSelected = index <= indexTop;
    //               final color = isSelected ? selectedColor : unselectedColor;
    //               return buildLabel(label: label.toString(), color: color);
    //             }),
    //           )),
    //       Slider(
    //           activeColor: color,
    //           min: min,
    //           max: max,
    //           divisions: divisions,
    //           // showLabels: true,
    //           // showDividers: true,
    //           inactiveColor:
    //               Theme.of(context).secondaryHeaderColor.withOpacity(0.2),
    //           // interval: 3,
    //           // stepSize: 3,
    //           // label: "${timeAdded.round().toString()}",
    //           // showTicks: true,
    //           // minorTicksPerInterval: 1,
    //           value: indexTop.toDouble(),
    //           // interval: 1,
    //           // labelPlacement: LabelPlacement.betweenTicks,
    //           // showLabels: true,
    //           onChanged: (newTime) {
    //             setState(() {
    //               this.indexTop = newTime.toInt();
    //
    //               totalTime = time[indexTop] +
    //                   currentOrdersRentingTime[widget.productIndex];
    //             });
    //           }),
    //     ],
    //   );
    // }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
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
                                    "\u20b9 ${formatter.format(currentOrdersRentPrice[widget.productIndex])}/mo",
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
          Center(
            child: Text(
              "Remaining,",
              style: GoogleFonts.muktaMahee(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 20,
              ),
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.muktaMahee(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${currentOrdersRentingTime[widget.productIndex]}',
                      style: GoogleFonts.muktaMahee(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 30,
                      )),
                  TextSpan(
                      text: ' month(s)',
                      style: GoogleFonts.muktaMahee(
                        fontSize: 15,
                        color: Theme.of(context).secondaryHeaderColor,
                      )),
                  TextSpan(
                      text: ' +',
                      style: GoogleFonts.muktaMahee(
                        fontSize: 20,
                        color: Theme.of(context).secondaryHeaderColor,
                      )),
                  TextSpan(
                      text: ' ${labels[indexTop]}',
                      style: GoogleFonts.muktaMahee(
                        fontSize: 40,
                        color: Theme.of(context).secondaryHeaderColor,
                      )),
                  TextSpan(
                      text: ' month(s)',
                      style: GoogleFonts.muktaMahee(
                        fontSize: 15,
                        color: Theme.of(context).secondaryHeaderColor,
                      )),
                ],
              ),
            ),
          ),
          buildSliderTopLabel(),
          // Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Center(
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.muktaMahee(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\u20b9 ${formatter.format(totalPrice)}/mo',
                        style: GoogleFonts.muktaMahee(
                          fontWeight: FontWeight.bold,
                          color: color,
                          fontSize: 25,
                        )),
                    TextSpan(
                        text: ' for ',
                        style: GoogleFonts.muktaMahee(
                          fontSize: 20,
                          color: Theme.of(context).secondaryHeaderColor,
                        )),
                    TextSpan(
                        text: '$totalTime month(s)',
                        style: GoogleFonts.muktaMahee(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).secondaryHeaderColor,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  style: GoogleFonts.muktaMahee(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        //TODO GET THE TOTAL NUMBER OF DAYS AFTER N MONTHS FROM NOW
                        text: ' N',
                        style: GoogleFonts.muktaMahee(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).secondaryHeaderColor,
                        )),
                    TextSpan(
                        text: ' days',
                        style: GoogleFonts.muktaMahee(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          color: Theme.of(context).secondaryHeaderColor,
                        )),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 10,
              // bottom: 8,
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
        ],
      ),
    );
  }
}
