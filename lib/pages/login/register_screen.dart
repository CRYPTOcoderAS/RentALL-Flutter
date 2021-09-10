import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:rentall/pages/login/ui.dart';
import 'package:rentall/widgets/navbar/navBar.dart';
import 'package:rentall/widgets/widgets.dart';
import 'package:sms_autofill/sms_autofill.dart';

TextEditingController emailController = TextEditingController();
TextEditingController phnumController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController confirmpassController = TextEditingController();

//Declaring these as global variable as I want these values to persist when I return to this screen
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String regemail, username, regpass, confirmpass, phone;
  bool visible1 = true;
  bool visible2 = true;

  bool configured = false;
  // These two variables will make the Password value to be visible or invisible
  bool color_name,
      color_phone,
      color_mail,
      color_pass,
      color_confirmpass = false;
  // For the color change
  bool phoneIcon = false;

  // For the icon change

  Color color = Color(0xFFbe3144);

  @override
  void initState() {
    regemail = '';
    username = '';
    regpass = '';
    confirmpass = '';
    phone = '';
    setState(() {
      isLoading = false;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color color = Color(0xFFbe3144);
    return Material(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isLoading ? linearProgress(context) : Container(),
              SizedBox(height: 20),
              TextFieldController(
                child: TextField(
                  controller: usernameController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (value) {
                    setState(() {
                      username = value.trim();
                      color_name = true;
                    });
                  },
                  style: GoogleFonts.montserrat(),
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                    icon: Icon(
                      Icons.person,
                      color: color_name == true ? color : Colors.grey,
                    ),
                    hintText: "Username",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldController(
                child: TextField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {
                      color_mail = true;
                      regemail = value.trim();
                    });
                  },
                  style: GoogleFonts.montserrat(),
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                    icon: Icon(
                      Icons.mail,
                      color: color_mail == true ? color : Colors.grey,
                    ),
                    hintText: "Email ID",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldController(
                child: TextField(
                  controller: phnumController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      color_phone = true;
                      phone = value.trim();
                    });
                  },
                  style: GoogleFonts.montserrat(),
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                    icon: Icon(
                      Icons.phone,
                      color: color_phone == true ? color : Colors.grey,
                    ),
                    hintText: "Phone Number",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldController(
                child: TextField(
                  controller: passController,
                  obscureText: visible1,
                  onChanged: (value) {
                    setState(() {
                      regpass = value.trim();
                      color_pass = true;
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
              TextFieldController(
                child: TextField(
                  controller: confirmpassController,
                  obscureText: visible2,
                  onChanged: (value) {
                    setState(() {
                      confirmpass = value.trim();
                      color_confirmpass = true;
                    });
                  },
                  style: GoogleFonts.montserrat(),
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                    icon: Icon(
                      Icons.lock,
                      color: color_confirmpass == true ? color : Colors.grey,
                    ),
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            visible2 = !visible2;
                          });
                        },
                        child: Icon(
                            visible2 == true
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: color)),
                    hintText: "Confirm Password",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 40,
                width: size.width * 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: MaterialButton(
                    color: color,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      print(emailController.text);
                      if (usernameController.text == null ||
                          emailController.text == null ||
                          phnumController.text == null ||
                          passController.text == null ||
                          confirmpassController.text == null ||
                          usernameController.text == '' ||
                          emailController.text == '' ||
                          phnumController.text == '' ||
                          passController.text == '' ||
                          confirmpassController.text == '') {
                        final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Container(
                                child: Text(
                              'Please enter all the fields',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            )));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (passController.text !=
                                  confirmpassController.text &&
                              passwordType(passController.text) ||
                          passController.text.length < 6) {
                        final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Container(
                                child: Text(
                              'Passwords do not match or weak password used. Make sure the password contains more than 6 characters.',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            )));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (!isEmail(emailController.text)) {
                        print(emailController.text);
                        final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Container(
                                child: Text(
                              'Please enter a valid Email',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            )));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (validateMobile(phnumController.text)) {
                        var db = await mongo.Db.create(
                            'mongodb+srv://rentall_ecom:Dog.lov%23r2021@cluster0.kdcp7.mongodb.net/test?retryWrites=true&w=majority');
                        await db.open();
                        final collections = await db.collection('users');
                        var exists = await collections.find(
                            {'phone': '+91${phnumController.text}'}).toList();
                        print('-empty: $exists');
                        if (exists.isEmpty) {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          await auth.verifyPhoneNumber(
                              phoneNumber: '+91${phnumController.text}',
                              verificationCompleted:
                                  (AuthCredential credential) async {
                                await auth
                                    .signInWithCredential(credential)
                                    .then((value) =>
                                        print('----completed sign in $value'));
                              },
                              verificationFailed: (FirebaseAuthException e) {
                                print(e);
                              },
                              codeSent: (String verificationId,
                                  int resendToken) async {
                                print('----------ver: $verificationId');
                                final _crller = TextEditingController();
                                String smsCode = '';
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Please enter the OTP",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          PinFieldAutoFill(
                                            decoration: UnderlineDecoration(
                                                colorBuilder: FixedColorBuilder(
                                                  Theme.of(context)
                                                      .secondaryHeaderColor,
                                                ),
                                                textStyle: TextStyle(
                                                    color: Theme.of(context)
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
                                              if (_crller.text.trim() == '' ||
                                                  _crller.text.trim() == null) {
                                                final snackBar = SnackBar(
                                                    backgroundColor: Colors.red,
                                                    content: Container(
                                                        child: Text(
                                                      'Please enter the OTP',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color:
                                                                  Colors.white),
                                                    )));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              } else {
                                                smsCode = _crller.text.trim();
                                                try {
                                                  PhoneAuthCredential
                                                      credential =
                                                      PhoneAuthProvider
                                                          .credential(
                                                              verificationId:
                                                                  verificationId,
                                                              smsCode: smsCode);
                                                  await auth
                                                      .signInWithCredential(
                                                          credential)
                                                      .then((value) async {
                                                    print(
                                                        '------AB sign in $value');
                                                    await collections.insert({
                                                      'name': usernameController
                                                          .text,
                                                      'email':
                                                          emailController.text,
                                                      'pass':
                                                          confirmpassController
                                                              .text,
                                                      'phone':
                                                          '+91${phnumController.text}'
                                                    });
                                                    final userData =
                                                        new FlutterSecureStorage();
                                                    await userData.write(
                                                        key: 'name',
                                                        value:
                                                            usernameController
                                                                .text);
                                                    await userData.write(
                                                        key: 'email',
                                                        value: emailController
                                                            .text);
                                                    await userData.write(
                                                        key: 'pass',
                                                        value:
                                                            confirmpassController
                                                                .text);
                                                    await userData.write(
                                                        key: 'phone',
                                                        value: phnumController
                                                            .text);
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pushReplacement(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        NavigationBar(
                                                                          page:
                                                                              "Home",
                                                                          index:
                                                                              0,
                                                                        )));
                                                  });
                                                } catch (e) {
                                                  final snackBar = SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Container(
                                                          child: Text(
                                                        'The sms verification code entered is invalid. Please try again.',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                color: Colors
                                                                    .white),
                                                      )));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                }
                                              }
                                            },
                                            //TODO: store user data
                                            child: Text("Create Account",
                                                style: GoogleFonts.nunito(
                                                  color: Theme.of(context)
                                                      .secondaryHeaderColor,
                                                )))
                                      ],
                                    );
                                  },
                                  barrierDismissible: false,
                                );
                              },
                              timeout: Duration(seconds: 60),
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {
                                verificationId = verificationId;
                                print(verificationId);
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
                        } else {
                          final snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Container(
                                  child: Text(
                                'User already registered, Please Sign-In',
                                style:
                                    GoogleFonts.montserrat(color: Colors.white),
                              )));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Container(
                                child: Text(
                              'Please enter a valid Email / Phone Number',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            )));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Text(
                      'Create Account',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              // RoundButton(
              //   email: emailController.text,
              //   phone: phnumController.text,
              //   username: usernameController.text,
              //   pass: passController.text,
              //   confirmpass: confirmpassController.text,
              //   setState: setState,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldController extends StatelessWidget {
  final Widget child;

  const TextFieldController({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.85,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).secondaryHeaderColor, blurRadius: 2.0),
        ],
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
