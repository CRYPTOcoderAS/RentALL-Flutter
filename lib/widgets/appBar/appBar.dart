import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:rentall/pages/home/homepage.dart';
import 'package:rentall/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

String pincode = '';
String Aname = ''; //AddressName

String phoneNumber = '';
String houseNumber = '';
String landmark = '';
String address = '';
String latitude = "";
String longitude = "";
List addresses = [];
String userName = '';

String userEmail = '';
String userPhone = '';
int currentIndex = 0;
String Dname = '';
String Dpincode = '';
bool dbLoad = false;

loadAddr() async {
  SharedPreferences addr = await SharedPreferences.getInstance();
  if (addr.containsKey('data')) {
    addresses = await addr.getStringList('data');
  }
  print('---------addr');
  print(Aname);
  print(pincode);
  print(addresses.length);
}

loadData() async {
  final userData = new FlutterSecureStorage();
  userName = await userData.read(key: 'name');
  userPhone = await userData.read(key: 'phone');
  userEmail = await userData.read(key: 'email');
}

//Theme color

class CommonAppBar extends StatefulWidget {
  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  bool loading = false;
  load() async {
    SharedPreferences addr = await SharedPreferences.getInstance();
    if (addr.containsKey('data')) {
      addresses = await addr.getStringList('data');
    }
  }

  saveData(int o) async {
    SharedPreferences addr = await SharedPreferences.getInstance();
    await addr.setInt('index', o);
    setState(() {
      currentIndex = addr.getInt('index');
    });
  }

  @override
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    load();
    appbarData();
  }

  appbarData() async {
    SharedPreferences addr = await SharedPreferences.getInstance();
    if (addr.containsKey('data')) {
      addresses = await addr.getStringList('data');
      setState(() {
        currentIndex = addr.getInt('index');
      });
      print('-index');
      print(currentIndex);
      load() async {
        Dname = await json.decode(addresses[currentIndex])['name'];
        Dpincode = await json.decode(addresses[currentIndex])['pincode'];
      }

      setState(() {
        load();
      });
    }
  }

  Future<String> getCurrentLocation(String ans) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = address.first;
    setState(() {
      ans = first.addressLine.toString();
      pincode = first.postalCode;
      pincodeController.text = pincode;
    });
    print(ans);
    return ans;
  }

  addressDetails(StateSetter bsState) {
    print("addr controller: ${addressController.text}");
    print("pincode controllre : ${pincodeController.text}");

    Size size = MediaQuery.of(context).size;
    String loc;

    return Container(
      decoration: new BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          TextFieldControllerPage(
            child: TextField(
              autofocus: true,
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ],
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                setState(() {
                  Aname = value.trim();
                });
              },
              style: GoogleFonts.montserrat(),
              decoration: InputDecoration(
                hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                icon: Icon(
                  Icons.person,
                  color: color,
                ),
                hintText: "Name",
                border: InputBorder.none,
              ),
            ),
          ),
          TextFieldControllerPage(
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly,
              ],
              autofocus: true,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  phoneNumber = value.trim();
                });
              },
              style: GoogleFonts.montserrat(),
              decoration: InputDecoration(
                hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                icon: Icon(
                  Icons.phone,
                  color: color,
                ),
                hintText: "Alternate Phone No(Optional)",
                border: InputBorder.none,
              ),
            ),
          ),
          TextFieldControllerPage(
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  houseNumber = value.trim();
                });
              },
              style: GoogleFonts.montserrat(),
              decoration: InputDecoration(
                hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                icon: Icon(
                  Icons.home_filled,
                  color: color,
                ),
                hintText: "House Number and Name",
                border: InputBorder.none,
              ),
            ),
          ),
          TextFieldControllerPage(
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  landmark = value.trim();
                });
              },
              style: GoogleFonts.montserrat(),
              decoration: InputDecoration(
                hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                icon: Icon(Icons.home_outlined, color: color),
                hintText: "Landmark",
                border: InputBorder.none,
              ),
            ),
          ),
          TextFieldControllerPage(
            child: TextField(
              controller: addressController,
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  address = value.trim();
                });
              },
              style: GoogleFonts.montserrat(),
              decoration: InputDecoration(
                hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                suffixIcon: InkWell(
                    onTap: () async {
                      bsState(() {
                        loading = true;
                      });
                      loc = await getCurrentLocation(address);
                      bsState(() {
                        loading = false;
                      });
                      setState(() {
                        addressController.text = loc;
                        address = loc;
                      });
                    },
                    child: Icon(Icons.my_location, color: color)),
                hintText: "Address",
                border: InputBorder.none,
              ),
            ),
          ),
          TextFieldControllerPage(
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
              ],
              controller: pincodeController,
              autofocus: true,
              keyboardType: TextInputType.numberWithOptions(),
              onChanged: (value) {
                setState(() {
                  pincode = value.trim();
                });
              },
              style: GoogleFonts.montserrat(),
              decoration: InputDecoration(
                hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                hintText: "Pincode",
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
                  if (Aname == null ||
                      Aname == '' ||
                      landmark == null ||
                      landmark == '' ||
                      houseNumber == null ||
                      houseNumber == '' ||
                      address == null ||
                      address == '' ||
                      addressController.text == '' ||
                      pincodeController.text == '') {
                    Fluttertoast.showToast(
                      msg: 'Please enter all the fields',
                      textColor: Colors.white,
                      backgroundColor: Colors.red,
                      // style: GoogleFonts.montserrat(color: Colors.red),
                    );
                  } else if (!validatePincode(pincode)) {
                    print(validatePincode(pincode));
                    print(pincode);
                    Fluttertoast.showToast(
                      msg: 'Invalid Pincode',
                      textColor: Colors.white,
                      backgroundColor: Colors.red,
                      // style: GoogleFonts.montserrat(color: Colors.red),
                    );
                  } else if (phoneNumber.length > 0 &&
                      phoneNumber.length < 10) {
                    Fluttertoast.showToast(
                      msg: 'Invalid phone number',
                      textColor: Colors.white,
                      backgroundColor: Colors.red,
                      // style: GoogleFonts.montserrat(color: Colors.red),
                    );
                  } else if (dbLoad == true) {
                    Fluttertoast.showToast(
                      msg: 'Loading',
                      textColor: Colors.white,
                      backgroundColor: Colors.red,
                      // style: GoogleFonts.montserrat(color: Colors.red),
                    );
                  } else {
                    bsState(() {
                      loading = true;
                    });

                    var db = await mongo.Db.create(
                        'mongodb+srv://rentall_ecom:Dog.lov%23r2021@cluster0.kdcp7.mongodb.net/test?retryWrites=true&w=majority');
                    await db.open();
                    final collections = await db.collection('users');
                    bsState(() async {
                      dbLoad = true;
                      print(Aname);
                      print(phoneNumber);
                      print(landmark);
                      print(address);
                      print(houseNumber);
                      print(pincode);
                      print("saved");
                      SharedPreferences addr =
                          await SharedPreferences.getInstance();
                      String value =
                          """{"name":"$Aname", "phone":"$phoneNumber", "houseNo":"$houseNumber", "landmark":"$landmark", "address":"$address", "pincode":"$pincode"}""";
                      List<String> data = [];
                      if (addr.containsKey('data') == true) {
                        data = addr.getStringList('data');
                        print('---------data');
                        print(data);
                        data.add(value);
                        print('---------data');
                        print(data);
                      } else {
                        data.add(value);
                        print('---------data2');
                        print(data);
                      }
                      print('--update');
                      print(userPhone);
                      print(userEmail);
                      await collections.updateMany({
                        'email': userEmail,
                        'phone': '+91${userPhone.trim()}'
                      }, mongo.modify.set('addresses', data.toList())).then(
                          (value) {
                        bsState(() {
                          dbLoad = false;
                          print('-------over');
                        });
                      });
                      print(value);
                      addr.setStringList('data', data);
                      data.removeRange(0, data.length);
                      setState(() {
                        Dname = Aname;
                        Dpincode = pincode;
                        currentIndex = addresses.length;
                        currentIndex = addresses.length;
                      });
                      saveData(addresses.length);
                      loadAddr();
                      bsState(() {
                        loading = false;
                      });
                      clearAddressPin(bsState);
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text(
                  dbLoad ? 'Loading' : 'Save',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          loading ? linearProgress(context) : Container(),
        ],
      ),
    );
  }

  clearAddressPin(StateSetter bsState) {
    bsState(() {
      addressController.clear();
      pincodeController.clear();
    });
  }

  void showLocation(context) {
    bool isVisible = true;
    String ans;
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (builder) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter bsState) {
          bsState(() {
            print("addr controller: ${addressController.text}");
            print("pincode controllre : ${pincodeController.text}");
            print("pincode $pincode");
            print("address $address");
          });
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: new BoxDecoration(
              color:Theme.of(context).primaryColor,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0))),
            child: SingleChildScrollView(
              child: Visibility(
                visible: isVisible,
                replacement: addressDetails(bsState),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Deliver to',
                              style: GoogleFonts.nunito(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 20.0),
                      child: addresses.isEmpty
                          ? GestureDetector(
                              onTap: () {
                                bsState(() {
                                  Aname = '';
                                  phoneNumber = '';
                                  houseNumber = '';
                                  landmark = '';
                                  address = null;
                                  // addressController.text = null;
                                  // pincodeController.text = null;
                                  pincode = null;
                                  // print(
                                  //     "addr controller: ${addressController.text}");
                                  // print(
                                  //     "pincode controllre : ${pincodeController.text}");
                                  print("pincode $pincode");
                                  print("address $address");
                                  isVisible = !isVisible;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 50, left: 20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withAlpha(100),
                                          blurRadius: 10.0),
                                    ],
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  height: 200,
                                  width: size.width * 0.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Icon(
                                          Icons.add,
                                          size: 35,
                                          color: color,
                                        ),
                                      ),
                                      Center(
                                          child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 50.0, left: 50, right: 20),
                                        child: Text(
                                            'Add an address or pick-up location',
                                            style: GoogleFonts.nunito(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                            )),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 200,
                              child: ListView.builder(
                                itemCount: addresses.length + 1,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index == addresses.length) {
                                    print(addresses.length);
                                    print(index);
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20.0,
                                        right: 20,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          bsState(() {
                                            Aname = '';
                                            phoneNumber = '';
                                            houseNumber = '';
                                            landmark = '';

                                            address = null;

                                            pincode = null;
                                            isVisible = !isVisible;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withAlpha(100),
                                                  blurRadius: 10.0),
                                            ],
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          height: 180,
                                          width: size.width * 0.5,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20.0),
                                                child: Icon(
                                                  Icons.add,
                                                  size: 35,
                                                  color: color,
                                                ),
                                              ),
                                              Center(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 50.0,
                                                    left: 50,
                                                    right: 20),
                                                child: Text(
                                                    'Add an address or pick-up location',
                                                    style: GoogleFonts.nunito(
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor,
                                                    )),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5.0,
                                        right: 5,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          print('presses');
                                          print(index);

                                          setState(() {
                                            bsState(() {
                                              currentIndex = index;
                                              saveData(index);
                                              Dname = json.decode(
                                                  addresses[index])['name'];
                                              houseNumber = json.decode(
                                                  addresses[index])['houseNo'];
                                              landmark = json.decode(
                                                  addresses[index])['landmark'];
                                              address = json.decode(
                                                  addresses[index])['address'];
                                              Dpincode = json.decode(
                                                  addresses[index])['pincode'];
                                              Navigator.pop(context);
                                            });
                                          });
                                        },
                                        onLongPress: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'Delete Address?',
                                                  ),
                                                  content: Text(
                                                      'Would you like to delete the address, this cannot be undone!'),
                                                  actions: [
                                                    TextButton(
                                                      child: Text(
                                                        'Delete',
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                      onPressed: () async {
                                                        bsState(() {
                                                          addresses
                                                              .removeAt(index);
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                        SharedPreferences addr =
                                                            await SharedPreferences
                                                                .getInstance();
                                                        addr.remove('data');
                                                        addr.setStringList(
                                                            'data', addresses);
                                                      },
                                                    )
                                                  ],
                                                );
                                              });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: currentIndex == index
                                                ? Border.all(
                                                    color: color,
                                                  )
                                                : Border.all(
                                                    color: Theme.of(context)
                                                        .secondaryHeaderColor,
                                                  ),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withAlpha(100),
                                                  blurRadius: 10.0),
                                            ],
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          height: 180,
                                          width: size.width * 0.5,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                  json.decode(
                                                      addresses[index])['name'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SingleChildScrollView(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: Text(
                                                      '${json.decode(addresses[index])['houseNo']} - ${json.decode(addresses[index])['address']}',
                                                      softWrap: true,
                                                      style:
                                                          GoogleFonts.nunito()),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8.0,
                                                    top: 4),
                                                child: Text(
                                                  json.decode(addresses[index])[
                                                      'landmark'],
                                                  softWrap: true,
                                                  style: GoogleFonts.nunito(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8.0,
                                                    top: 4),
                                                child: Text(
                                                  json.decode(addresses[index])[
                                                      'phone'],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(20.0, 10, 10, 10),
                    //   child: GestureDetector(
                    //     onTap: () async {
                    //       String loc;
                    //       loc = await getCurrentLocation(ans);
                    //       bsState(() {
                    //         ans = loc;
                    //       });
                    //     },
                    //     child: Text(
                    //       'Select A Delivery Location',
                    //       style: GoogleFonts.merriweather(),
                    //     ),
                    //   ),
                    // ),
                    // ans != null
                    //     ? Padding(
                    //         padding: const EdgeInsets.all(20.0),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             boxShadow: [
                    //               BoxShadow(
                    //                   color: Colors.black.withAlpha(100),
                    //                   blurRadius: 10.0),
                    //             ],
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(5),
                    //           ),
                    //           width: size.width * 0.5,
                    //           child: Column(
                    //             children: [
                    //               Center(
                    //                   child: Padding(
                    //                 padding: const EdgeInsets.all(20.0),
                    //                 child: Text(ans,
                    //                     style: GoogleFonts.merriweather()),
                    //               )),
                    //             ],
                    //           ),
                    //         ),
                    //       )
                    //     : SizedBox(),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 15,
      ),
      color: color,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: TextFieldControllers(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      textCapitalization: TextCapitalization.words,
                      style: GoogleFonts.montserrat(),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          bottom: 14,
                        ),
                        hintStyle:
                            GoogleFonts.montserrat(color: Colors.grey.shade600),
                        icon: Icon(
                          Icons.search,
                          size: 20,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mic,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                loadAddr();
                print(currentIndex);
                showLocation(context);
              },
              child: Container(
                height: 20,
                child: GestureDetector(
                  onTap: () {
                    loadAddr();
                    print(currentIndex);
                    showLocation(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.location_pin,
                                  // size: 10,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 2),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.montserrat(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Deliver to ',
                                      ),
                                      Dname != null && Dname != ''
                                          ? TextSpan(
                                              text: '$Dname - ',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : TextSpan(
                                              text: '',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                      Dpincode != null && Dpincode != ''
                                          ? TextSpan(
                                              text: '$Dpincode',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.bold))
                                          : TextSpan(
                                              text: '',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              // Text(
                              //   '${}',
                              //   softWrap: true,
                              //
                              //
                              // ),
                            ),
                          ]),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              loadAddr();
                              print(currentIndex);
                              showLocation(context);
                            },
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
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

class TextFieldControllerPage extends StatelessWidget {
  final Widget child;

  const TextFieldControllerPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.85,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
        ],
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: child,
    );
  }
}
