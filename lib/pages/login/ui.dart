import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/widgets/widgets.dart';

import 'login_screen.dart';
import 'register_screen.dart';

bool isLoading = false;

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  int switchTab = 0; //  this variable is used for switching tabs

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: null,
      body: Container(
        decoration: BoxDecoration(
          color: color,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'images/logo.png',
                width: 300,
                height: 200,
              ),
              Container(
                height: height * 0.72,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(100), blurRadius: 10.0),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                switchTab = 0;
                              });
                            },
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Register',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: switchTab == 0 ? color : Colors.grey,
                                ),
                              ),
                            )),
                          ),
                          Container(
                            height: 30,
                            child: VerticalDivider(
                              thickness: 1.0,
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                          SizedBox(width: 10),
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                switchTab = 1;
                              });
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: switchTab == 1 ? color : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      switchTab == 0 ? RegisterScreen() : LoginScreen(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
