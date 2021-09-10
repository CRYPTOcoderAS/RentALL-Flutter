import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:rentall/widgets/navbar/navBar.dart';
import 'package:rentall/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../widgets/appBar/appBar.dart';
import 'register_screen.dart';
import 'ui.dart';

TextEditingController loginPhoneController = TextEditingController();

//Declaring these as global variable as I want these values to persist when I return to this screen
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool color_phonemail, color_pass = false;

  bool isVisible = true;

  String phoneNum, loginpass;
  bool visible1 = true;

  Color color = Color(0xFFbe3144);
  TextEditingController textController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool otpDone = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loginPhoneController.text = '';
      phoneNum = '';
      isLoading = false;
    });
  }

  forgotPass() {
    Color color = Color(0xFFbe3144);
    return GestureDetector(
      child: SingleChildScrollView(
        child: Column(
          children: [
            isLoading ? linearProgress(context) : Container(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                "Forgot Password",
                style: GoogleFonts.merriweather(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 20),
              ),
            ),
            TextFieldControllerPage(
              child: TextField(
                controller: textController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.numberWithOptions(),
                onChanged: (value) {
                  setState(() {});
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                  icon: Icon(
                    Icons.phone,
                    color: color,
                  ),
                  hintText: "Phone Number",
                  border: InputBorder.none,
                ),
              ),
            ),
            otpDone == false
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFieldControllerPage(
                      child: TextField(
                        controller: passwordController,
                        //New password textfield
                        style: GoogleFonts.montserrat(),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                          icon: Icon(
                            Icons.lock,
                            color: color,
                          ),
                          hintText: "New Password",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
            otpDone == false
                ? Container()
                : TextFieldControllerPage(
                    child: TextField(
                      controller: confirmpasswordController,
                      //New password textfield,
                      style: GoogleFonts.montserrat(),
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                        icon: Icon(
                          Icons.lock,
                          color: color,
                        ),
                        hintText: "Confirm New Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              GestureDetector(
                  onTap: () async {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Text("Login to your account",
                        style: GoogleFonts.montserrat(color: Colors.blue)),
                  )),
            ]),
            SizedBox(height: 15),
            otpDone
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: MaterialButton(
                        color: color,
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          if (passwordController.text == '' ||
                              confirmpasswordController.text == '') {
                            final snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Container(
                                    child: Text(
                                  'Please enter OTP and the password',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white),
                                )));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (passwordController.text !=
                              confirmpasswordController.text) {
                            final snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Container(
                                    child: Text(
                                  'Passwords do not match',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white),
                                )));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            setState(() async {
                              var db = await mongo.Db.create(
                                  'mongodb+srv://rentall_ecom:Dog.lov%23r2021@cluster0.kdcp7.mongodb.net/test?retryWrites=true&w=majority');
                              await db.open();
                              final collections = await db.collection('users');
                              await collections
                                  .updateOne(
                                      mongo.where.eq('phone',
                                          '+91${textController.text.trim()}'),
                                      mongo.modify.set(
                                          'pass',
                                          confirmpasswordController.text
                                              .trim()))
                                  .then((value) async {
                                print(value);
                                final store = new FlutterSecureStorage();
                                await store.write(key: 'sn', value: 'true');
                              });

                              Navigator.of(context, rootNavigator: true)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => NavigationBar(
                                            page: "Home",
                                            index: 0,
                                          )));
                            });
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Text(
                          'Verify',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: MaterialButton(
                        color: color,
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          if (textController.text == null) {
                            final snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Container(
                                    child: Text(
                                  'Please enter the Email/Phone Number',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white),
                                )));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (validateMobile(textController.text) !=
                                  true &&
                              isEmail(textController.text) != true) {
                            final snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Container(
                                    child: Text(
                                  'Please enter a valid email / phone number',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white),
                                )));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (validateMobile(textController.text) ||
                              isEmail(textController.text)) {
                            var db = await mongo.Db.create(
                                'mongodb+srv://rentall_ecom:Dog.lov%23r2021@cluster0.kdcp7.mongodb.net/test?retryWrites=true&w=majority');
                            await db.open();
                            final collections = await db.collection('users');
                            var exists = await collections.find({
                              'phone': '+91${textController.text.trim()}'
                            }).toList();
                            print('perfect');
                            if (exists.isEmpty) {
                              final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Container(
                                      child: Text(
                                    'User not registered please register',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white),
                                  )));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              FirebaseAuth auth = FirebaseAuth.instance;
                              await auth.verifyPhoneNumber(
                                  phoneNumber:
                                      '+91${textController.text.trim()}',
                                  verificationCompleted:
                                      (AuthCredential credential) {
                                    setState(() {
                                      otpDone = true;
                                    });
                                  },
                                  verificationFailed:
                                      (FirebaseAuthException e) {
                                    final snackBar = SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Container(
                                            child: Text(
                                          'The sms verification code entered is invalid. Please try again.',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                        )));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  codeSent:
                                      (String verificationId, int resendToken) {
                                    final _crller = TextEditingController();
                                    String smsCode = '';
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Enter OTP"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                PinFieldAutoFill(
                                                  decoration:
                                                      UnderlineDecoration(
                                                          colorBuilder:
                                                              FixedColorBuilder(
                                                            Theme.of(context)
                                                                .secondaryHeaderColor,
                                                          ),
                                                          textStyle: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .secondaryHeaderColor)),
                                                  codeLength: 6,
                                                  controller: _crller,
                                                  onCodeChanged: (value) {},
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () async {
                                                    if (_crller.text.trim() ==
                                                            '' ||
                                                        _crller.text.trim() ==
                                                            null) {
                                                      final snackBar = SnackBar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          content: Container(
                                                              child: Text(
                                                            'Please enter the OTP',
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    color: Colors
                                                                        .white),
                                                          )));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    }
                                                    // else if (_crller.text
                                                    //         .trim() !=
                                                    //     smsCode) {
                                                    //   final snackBar = SnackBar(
                                                    //       backgroundColor:
                                                    //           Colors.red,
                                                    //       content: Container(
                                                    //           child: Text(
                                                    //         'The sms verification code entered is invalid. Please try again.',
                                                    //         style: GoogleFonts
                                                    //             .montserrat(
                                                    //                 color: Colors
                                                    //                     .white),
                                                    //       )));
                                                    //   ScaffoldMessenger.of(
                                                    //           context)
                                                    //       .showSnackBar(snackBar);
                                                    // }
                                                    else {
                                                      smsCode =
                                                          _crller.text.trim();
                                                      try {
                                                        PhoneAuthCredential
                                                            credential =
                                                            PhoneAuthProvider
                                                                .credential(
                                                                    verificationId:
                                                                        verificationId,
                                                                    smsCode:
                                                                        smsCode);
                                                        await auth
                                                            .signInWithCredential(
                                                                credential)
                                                            .then((value) {});
                                                        setState(() {
                                                          otpDone = true;
                                                        });
                                                        Navigator.pop(context);
                                                      } catch (_e) {
                                                        final snackBar =
                                                            SnackBar(
                                                                backgroundColor:
                                                                    Colors.red,
                                                                content:
                                                                    Container(
                                                                        child:
                                                                            Text(
                                                                  'Verification failed $_e',
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                          color:
                                                                              Colors.white),
                                                                )));
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);
                                                      }
                                                    }
                                                  },
                                                  child: Text("Verify",
                                                      style: GoogleFonts.nunito(
                                                        color: Theme.of(context)
                                                            .secondaryHeaderColor,
                                                      )))
                                            ],
                                          );
                                        },
                                        barrierDismissible: false);
                                  },
                                  timeout: Duration(seconds: 60),
                                  codeAutoRetrievalTimeout:
                                      (String verificationId) {
                                    verificationId = verificationId;
                                    print(verificationId);
                                    print("Timout");
                                    final snackBar = SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Container(
                                            child: Text(
                                          'Session timed-out. Please try again.',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                        )));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  });
                            }
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Text(
                          'Send OTP',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color color = Color(0xFFbe3144);
    return SingleChildScrollView(
        child: Container(
      child: Visibility(
        visible: isVisible,
        replacement: forgotPass(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLoading ? linearProgress(context) : Container(),
            SizedBox(height: 20),
            TextFieldController(
              child: TextField(
                controller: loginPhoneController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    phoneNum = value;
                    color_phonemail = true;
                  });
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                  icon: Icon(
                    Icons.phone,
                    color: color_phonemail == true ? color : Colors.grey,
                  ),
                  hintText: "Phone Number",
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldController(
              child: TextField(
                obscureText: visible1,
                onChanged: (value) {
                  setState(() {
                    color_pass = true;
                    loginpass = value.trim();
                  });
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                  icon: Icon(
                    Icons.lock,
                    color: color_pass == true ? color : Colors.grey,
                  ),
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          visible1 = !visible1;
                        });
                      },
                      child: Icon(
                          visible1 == true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: color)),
                  hintText: "Password",
                  border: InputBorder.none,
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 25.0),
                    child: Text("Forgot Password?",
                        style: GoogleFonts.montserrat(color: Colors.blue)),
                  )),
            ]),
            SizedBox(height: 70),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 40,
              width: size.width * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: MaterialButton(
                  color: color,
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    if (phoneNum == null ||
                        loginpass == null ||
                        phoneNum == '') {
                      final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Container(
                              child: Text(
                            'Please enter all the fields',
                            style: GoogleFonts.montserrat(color: Colors.white),
                          )));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (loginpass == null) {
                      final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Container(
                              child: Text(
                            'Please enter the password',
                            style: GoogleFonts.montserrat(color: Colors.white),
                          )));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (validateMobile(phoneNum) != true &&
                        isEmail(phoneNum) != true) {
                      final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Container(
                              child: Text(
                            'Please enter a valid Phone Number',
                            style: GoogleFonts.montserrat(color: Colors.white),
                          )));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      var db = await mongo.Db.create(
                          'mongodb+srv://rentall_ecom:Dog.lov%23r2021@cluster0.kdcp7.mongodb.net/test?retryWrites=true&w=majority');
                      await db.open();
                      final collections = await db.collection('users');
                      var data = await collections.find({
                        'pass': loginpass,
                        'phone': '+91${phoneNum}'
                      }).toList();
                      //print('-----------------${data[0]['addresses']}');
                      if (data.isEmpty) {
                        final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Container(
                                child: Text(
                              'Invalid Phone Number (or) Password',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            )));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        final store = new FlutterSecureStorage();
                        final userData = new FlutterSecureStorage();
                        await store.write(key: 'sn', value: 'true');
                        await userData.write(
                            key: 'name', value: data[0]['name']);
                        await userData.write(
                            key: 'email', value: data[0]['email']);
                        await userData.write(
                            key: 'phone',
                            value: data[0]['phone'].toString().substring(3));
                        if (data[0]['addresses'] != null) {
                          SharedPreferences addr =
                              await SharedPreferences.getInstance();
                          List toSave = data[0]['addresses'];
                          await addr.setStringList(
                              'data', toSave.cast<String>());
                          await addr.setInt('index', toSave.length);
                        }
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new NavigationBar(
                                      page: "Home",
                                      index: 0,
                                    )));
                      }
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
