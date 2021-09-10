import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/widgets/widgets.dart';

class Consoles extends StatefulWidget {
  @override
  _ConsolesState createState() => _ConsolesState();
}

class _ConsolesState extends State<Consoles> {
  List itemNames = [
    "PlayStation",
    "Xbox",
    "Drones",
  ];
  List itemImg = [
    "images/category/Consoles/ps.jpg",
    "images/category/Consoles/xbox.jpg",
    "images/category/Consoles/drones.jpg",
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
                    "“If you want to be happy, be.” ",
                    style: GoogleFonts.nunito(
                      fontSize: 20,
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
