import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/widgets/navbar/navBar.dart';
import 'package:rentall/widgets/widgets.dart';

class Requests extends StatefulWidget {
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  List requests = [];
  List queries = [
    'Account related',
    'Order Related',
    'Payment Related',
    'Delivery and Pickup related',
    'Refund information',
    'Other'
  ];
  List accountRelatedIssue = ['Update mobile number', 'Update email'];
  List orderRelatedIssue = [
    'Add item/Change quantity',
    'Remove an item',
  ];
  int issue = 1;
  void showRequestSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (builder) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter bsState) {
          return Container(
            height: 600,
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
                  child: Text(
                      "Facing any issues? Let's sort it out as soon as possible!",
                      style: GoogleFonts.nunito(color: Colors.grey)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Query",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: DropdownButton(
                            hint: Text('Choose the issue'),
                            // value: issue,
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  '${queries[0]}',
                                  style: GoogleFonts.francoisOne(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  '${queries[1]}',
                                  style: GoogleFonts.francoisOne(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  '${queries[2]}',
                                  style: GoogleFonts.francoisOne(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                value: 3,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  '${queries[3]}',
                                  style: GoogleFonts.francoisOne(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                value: 4,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  '${queries[4]}',
                                  style: GoogleFonts.francoisOne(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                value: 5,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  '${queries[5]}',
                                  style: GoogleFonts.francoisOne(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                value: 6,
                              ),
                            ],
                            dropdownColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Divider(),
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(
                //           top: 8.0, bottom: 8, left: 15, right: 15),
                //       child: Icon(
                //         CupertinoIcons.mail,
                //         // Icons.mail,
                //         color: color,
                //       ),
                //     ),
                //     Text("Send an email",
                //         style: GoogleFonts.nunito(
                //             color: Theme.of(context).secondaryHeaderColor)),
                //   ],
                // ),
                Divider(),
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(
                //           top: 8.0, bottom: 8, left: 15, right: 15),
                //       child: Icon(
                //         CupertinoIcons.chat_bubble,
                //         color: color,
                //         // size: 20,
                //       ),
                //     ),
                //     Text("Chat with us",
                //         style: GoogleFonts.nunito(
                //             color: Theme.of(context).secondaryHeaderColor)),
                //   ],
                // ),
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: requests.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          "Any queries, requests, updates? Ask here, let's start a new adventure.",
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: FloatingActionButton.extended(
          backgroundColor: color,
          onPressed: () {
            showRequestSheet();
          },
          label: Text('Request'),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
