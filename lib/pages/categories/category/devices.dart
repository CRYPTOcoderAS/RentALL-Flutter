import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/widgets/widgets.dart';

class Devices extends StatefulWidget {
  @override
  _DevicesState createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  List itemNames = [
    "Smart Phones",
    "Laptops",
    "Television",
    "Cameras",
    "Smart Watches",
    "VR Glasses",
  ];
  List itemImg = [
    "images/noimage.png",
    "images/category/devices/laptop.jpg",
    "images/category/devices/tv.jpg",
    "images/category/devices/dslr.jpg",
    "images/category/devices/smartwatch.jpg",
    "images/category/devices/vr.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "“Prove it, make a remark on it.”",
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                ),
                Divider(
                  indent: 100,
                  endIndent: 100,
                  color: color,
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                  ),
                  itemCount: itemNames.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return CardsStack(
                      lightCardChild: Center(
                        child: Text(
                          itemNames[index],
                          style: GoogleFonts.nunito(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                      darkCardChild: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(itemImg[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
