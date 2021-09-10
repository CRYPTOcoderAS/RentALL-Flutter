import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/widgets/navbar/navBar.dart';
import 'package:rentall/widgets/widgets.dart';

class Refunds extends StatefulWidget {
  @override
  _RefundsState createState() => _RefundsState();
}

class _RefundsState extends State<Refunds> {
  List refunds = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: refunds.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          bottom: 45,
                        ),
                        child: SvgPicture.asset(
                          'images/requestEmpty.svg',
                          width: 250,
                          height: 250,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 5, top: 25),
                        child: Text(
                          "Seems like there's no issues. Good luck with your new adventure!",
                          style: GoogleFonts.nunito(
                            color:
                                Theme.of(context).primaryColor == Colors.black
                                    ? Colors.grey
                                    : Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 80,
                          right: 80,
                          top: 50,
                          // bottom: 8,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => new NavigationBar(
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
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Text("RETURN TO HOMEPAGE",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              )),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
