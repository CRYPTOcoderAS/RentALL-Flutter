import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/widgets/widgets.dart';

class MusicalInstruments extends StatefulWidget {
  @override
  _MusicalInstrumentsState createState() => _MusicalInstrumentsState();
}

class _MusicalInstrumentsState extends State<MusicalInstruments> {
  List itemNames = [
    "Guitar",
    "Flute",
    "Electric Bass",
    "Microphone",
    "Drums",
    "Violin",
    "Harmonium",
    "Sarod",
    "Sitar"
  ];
  List itemImg = [
    "images/category/musical/guitar.jpg",
    "images/category/musical/flute.jpg",
    "images/category/musical/elecbass.jpg",
    "images/category/musical/mic.jpg",
    "images/noimage.png",
    "images/category/musical/violin.jpg",
    "images/noimage.png",
    "images/noimage.png",
    "images/noimage.png",
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
                    "“Sometimes all you need is music & you.”",
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
