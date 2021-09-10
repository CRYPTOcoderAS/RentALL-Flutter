import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentall/pages/login/ui.dart';
import 'package:rentall/widgets/appBar/appBar.dart';
import 'package:rentall/widgets/widgets.dart';

class yourProfile extends StatefulWidget {
  @override
  _yourProfileState createState() => _yourProfileState();
}

class _yourProfileState extends State<yourProfile> {
  bool isPhoneNumberVisible = false;
  bool isEmailVisible = false;
  bool isEmailVerified = false;
  String newNumber = '';

  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  hidePhone() {
    setState(() {
      newNumber = userPhone;
      for (int i = 4; i < userPhone.length; i++) {
        newNumber = replaceCharAt(newNumber, i, "*");
      }
    });
  }

  @override
  void initState() {
    hidePhone();
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
        title: Text('Profile',
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
          children: [
            isEmailVerified
                ? Container()
                : Container(
                    height: 30,
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
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Verify your email address",
                          style: GoogleFonts.nunito(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                            width: 60,
                            height: 20,
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
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 0.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  // offset: Offset(0, 25),
                                  blurRadius: 3,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Verify",
                                style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                  ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        // USE THIS FOR IMAGE
                        image: DecorationImage(
                          image: AssetImage(
                            'images/mac1.png',
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        border: Border.all(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 0.4),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0)),
                        ),
                        child: Icon(
                          CupertinoIcons.photo,
                          size: 35,
                          color: Theme.of(context)
                              .secondaryHeaderColor
                              .withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: Theme.of(context).secondaryHeaderColor, width: 0.1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    // offset: Offset(0, 25),
                    blurRadius: 3,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor == Colors.black
                                    ? Colors.white12
                                    : Colors.grey[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.edit,
                                size: 15,
                                color: Colors.blueGrey,
                              ),
                              Text("Edit",
                                  style: GoogleFonts.nunito(
                                    color: Colors.blueGrey,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 35,
                    ),
                    child: Text(
                      "$userName",
                      softWrap: true,
                      style: GoogleFonts.merriweather(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      isPhoneNumberVisible
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, left: 35),
                              child: Text(
                                "$userPhone",
                                softWrap: true,
                                style: GoogleFonts.nunito(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, left: 35),
                              child: Text(
                                "$newNumber",
                                softWrap: true,
                                style: GoogleFonts.nunito(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isPhoneNumberVisible = !isPhoneNumberVisible;
                          });
                        },
                        child: isPhoneNumberVisible
                            ? Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Icon(
                                  Icons.visibility,
                                  color: color,
                                ))
                            : Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Icon(
                                  Icons.visibility_off,
                                  color: color,
                                ),
                              ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 35),
                    child: Text(
                      "${userEmail}",
                      softWrap: true,
                      style: GoogleFonts.nunito(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 50, right: 50),
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
                        Icons.edit_location_alt_outlined,
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
                      child: Text("Manage your Addresses",
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
                        Icons.payments,
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
                      child: Text("Payments",
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
                        Icons.password,
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
                      child: Text("Change Password",
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
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Theme.of(context).primaryColor,
                          title: Text(
                            'Sign out',
                          ),
                          content: Text('Are you sure you want to sign out?'),
                          actions: [
                            TextButton(
                              child: Text(
                                'Yes',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () async {
                                setState(() async {
                                  await FirebaseAuth.instance
                                      .signOut()
                                      .then((value) async {
                                    final store = new FlutterSecureStorage();
                                    await store.delete(key: 'sn');
                                    Navigator.of(context, rootNavigator: true)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => new Start()));
                                  });
                                });
                              },
                            ),
                            TextButton(
                              child: Text(
                                'No',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                              ),
                              onPressed: () async {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      });
                },
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
                          Icons.logout,
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
                        child: Text("Sign out",
                            style: GoogleFonts.nunito(
                              color: Theme.of(context).secondaryHeaderColor,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
