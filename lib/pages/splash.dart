import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/widgets/navbar/navBar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool state = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    checkState();
  }

  checkState() async {
    final store = new FlutterSecureStorage();
    if (FirebaseAuth.instance.currentUser == null) {
      if (await store.containsKey(key: 'sn')) {
        if (await store.read(key: 'sn') == 'true') {
          setState(() {
            state = true;
          });
        } else {
          setState(() {
            state = false;
          });
        }
      } else {
        setState(() {
          state = false;
        });
      }
    } else {
      setState(() {
        state = true;
      });
    }
    print('-----------store');
    print(await store.read(key: 'sn'));
  }

  @override
  startTimer() async {
    var duration = Duration(
        seconds:
            1); // After 1 seconds, it is re-directed to the sign-in screen if the user is not authenticated, else it takes him into the app.
    return Timer(duration, callback);
  }

  callback() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return NavigationBar(index: 0, page: "Home");
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              width: 300,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 120),
              child: Text(
                "Dream it. Get it.",
                style: GoogleFonts.mukta(color: Color(0xFFbe3144)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
