import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/widgets/widgets.dart';

class LegalAndAbout extends StatefulWidget {
  @override
  _LegalAndAboutState createState() => _LegalAndAboutState();
}

class _LegalAndAboutState extends State<LegalAndAbout> {
  @override
  void initState() {
    // hideEmail();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Legal & About',
            style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).secondaryHeaderColor)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp,
              color: Theme.of(context).secondaryHeaderColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme.of(context).primaryColor == Colors.black
                ? Container(width: 100, height: 25)
                : Image.asset(
                    'images/logo.png',
                    width: 200,
                    height: 200,
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 50, right: 50),
              child: Container(
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor == Colors.black
                      ? Colors.white12
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 8),
                      child: Icon(
                        CupertinoIcons.doc_plaintext,
                        color: color,
                      ),
                    ),
                    Container(
                      height: 30,
                      child: VerticalDivider(
                        thickness: 1.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text("Terms and Conditions",
                          style: GoogleFonts.nunito(
                            color: Theme.of(context).secondaryHeaderColor,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 50, right: 50),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor == Colors.black
                        ? Colors.white12
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 8),
                        child: Icon(
                          CupertinoIcons.doc_plaintext,
                          color: color,
                        ),
                      ),
                      Container(
                        height: 30,
                        child: VerticalDivider(
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Text("Privacy Policy",
                            style: GoogleFonts.nunito(
                              color: Theme.of(context).secondaryHeaderColor,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 50, right: 50),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor == Colors.black
                        ? Colors.white12
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 8),
                        child: Icon(
                          CupertinoIcons.repeat,
                          color: color,
                        ),
                      ),
                      Container(
                        height: 30,
                        child: VerticalDivider(
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Text("Returns & Refunds policy",
                            style: GoogleFonts.nunito(
                              color: Theme.of(context).secondaryHeaderColor,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 50, right: 50),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor == Colors.black
                        ? Colors.white12
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 8),
                        child: Icon(
                          Icons.cancel_schedule_send_outlined,
                          color: color,
                        ),
                      ),
                      Container(
                        height: 30,
                        child: VerticalDivider(
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Text("Cancellation Policy",
                            style: GoogleFonts.nunito(
                              color: Theme.of(context).secondaryHeaderColor,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 50, right: 50),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor == Colors.black
                        ? Colors.white12
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 8),
                        child: Icon(
                          Icons.privacy_tip_outlined,
                          color: color,
                        ),
                      ),
                      Container(
                        height: 30,
                        child: VerticalDivider(
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Text("Why we ask for Aadhar info",
                            style: GoogleFonts.nunito(
                              color: Theme.of(context).secondaryHeaderColor,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
              child: Container(
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor == Colors.black
                      ? Colors.white12
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 8),
                      child: Icon(
                        CupertinoIcons.wand_stars,
                        color: color,
                      ),
                    ),
                    Container(
                      height: 30,
                      child: VerticalDivider(
                        thickness: 1.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text("About us",
                          style: GoogleFonts.nunito(
                            color: Theme.of(context).secondaryHeaderColor,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 50, right: 50),
              child: Container(
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor == Colors.black
                      ? Colors.white12
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 8),
                      child: Icon(
                        Icons.star_rate,
                        color: color,
                      ),
                    ),
                    Container(
                      height: 30,
                      child: VerticalDivider(
                        thickness: 1.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text("Rate us",
                          style: GoogleFonts.nunito(
                            color: Theme.of(context).secondaryHeaderColor,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
