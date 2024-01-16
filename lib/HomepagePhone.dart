import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Frostedglass.dart';

class HomepagePhone extends StatefulWidget {
  const HomepagePhone({super.key});

  @override
  State<HomepagePhone> createState() => _HomepagePhoneState();
}

class _HomepagePhoneState extends State<HomepagePhone> {
  int otp = 0;
  String inputotp = "";
  String otpinstringform = "";
  String shareviacode = "Share via Code";
  bool codeclick = true;
  bool linkclick = true;
  String errormessage = "";
  final firestore = FirebaseFirestore.instance.collection('users');
    late DocumentSnapshot documentSnapshot;
    String inputnotes = "";
    String copymessage = "Copy";
    String notes = "";
  Color col = const Color.fromRGBO(38, 36, 45, 1);
  void reversetext() {
    setState(() {
      col = const Color.fromRGBO(38, 36, 45, 1);
      notes = "";
      codeclick = true;
      linkclick = true;
      shareviacode = "Share via Code";
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Scaffold(
        // scrollabe yahi tha...
        body: Container(
          height: 800,
          decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/bg10.jpg"),
            fit: BoxFit.cover,
          )
          ),
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(150, 0, 0, 0),
                height: screenHeight*0.03,
              ),
              Container(
                width: screenWidth,
                height: screenHeight*0.07,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.13),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 10,
                        color: Color.fromARGB(192, 0, 0, 0),
                        offset: Offset(0, 0),
                        blurStyle: BlurStyle.normal,
                      ),
                    ]),
                child: Center(
                    child: Text(
                  "QuickShare",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 214, 214, 214),
                        fontSize: 30),
                  ),
                )),
              ),
              SizedBox(
                width: screenWidth,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                      color: const Color.fromARGB(0, 255, 255, 255),
                      width: screenWidth,
                      child: SizedBox(
                        height: screenHeight * 0.37,
                        child: FrostedGlassBox(
                          theHeight: screenHeight * 0.4,
                          theWidth: 400.0,
                          theChild: Container(
                            width: 700.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color.fromARGB(0, 255, 255, 255),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(192, 151, 151, 151),
                                          blurRadius: 10,
                                          offset: Offset(0, 0),
                                          blurStyle: BlurStyle.outer,
                                        )
                                      ]),
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                                onTap: () {
                                  showGeneralDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    transitionDuration:
                                        const Duration(milliseconds: 200),
                                    pageBuilder:
                                        (context, animation1, animation2) {
                                      return Container();
                                    },
                                    transitionBuilder: (context, a1, a2, widget) {
                                      return ScaleTransition(
                                        scale:
                                            Tween<double>(begin: 0.5, end: 1.0)
                                                .animate(a1),
                                        child: FadeTransition(
                                          opacity:Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                                          child: StatefulBuilder(
                                              builder: (context, setState) {
                                            return BackdropFilter(
                                              filter: ImageFilter.blur(
                                                    sigmaX: 5, sigmaY: 5),
                                              child: AlertDialog(
                                                backgroundColor:  const Color.fromRGBO(
                                                      54, 54, 54, 1),
                                                insetPadding: EdgeInsets.zero,
                                                scrollable: true,
                                                alignment: Alignment.center,
                                                content: SizedBox(
                                                  width: screenWidth,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                          ),
                                                          Container(
                                                            alignment: Alignment.center,
                                                            child: Text(
                                                            "Write & Share",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          214,
                                                                          214,
                                                                          214),
                                                                  fontSize: 20),
                                                            ),
                                                          ),
                                                          ),
                                                          Container(
                                                              alignment: Alignment.center,
                                                              child: IconButton(
                                                                  onPressed: () {
                                                                    reversetext();
                                                                    Navigator.pop(
                                                                        context, false);
                                                                  },
                                                                  icon: const Icon(
                                                              Icons.close,
                                                              color: Color.fromARGB(255, 214, 214, 214),
                                                            ))),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextField(
                                                      onChanged: (value) {
                                                        notes =
                                                            value.toString();
                                                        setState(() {
                                                          errormessage = "";
                                                          col = const Color
                                                                  .fromARGB(
                                                              255, 0, 0, 0);
                                                        });
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              filled: true,
                                                              fillColor: const Color
                                                                      .fromRGBO(
                                                                  38,
                                                                  36,
                                                                  45,
                                                                  1),
                                                              alignLabelWithHint:
                                                                  true,
                                                              labelText:
                                                                  'Write your notes here ',
                                                              labelStyle:
                                                                  const TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        158,
                                                                        158,
                                                                        158),
                                                              ),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10),
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      width:
                                                                          1,
                                                                      color:
                                                                          col)),
                                                              focusedBorder:
                                                                  const OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                width: 1,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        214,
                                                                        214,
                                                                        214),
                                                              ))),
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        color: Color.fromARGB(
                                                            255,
                                                            214,
                                                            214,
                                                            214),
                                                      ),
                                                      maxLines: 13,
                                                      minLines: 13,
                                                      ),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                      ElevatedButton(
                                                        style:
                                                              ElevatedButton
                                                                  .styleFrom(
                                                            textStyle: const TextStyle(
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    AutofillHints
                                                                        .birthday),
                                                            backgroundColor:
                                                                const Color
                                                                        .fromRGBO(
                                                                    38,
                                                                    36,
                                                                    45,
                                                                    1),
                                                            foregroundColor:
                                                                const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    179,
                                                                    179,
                                                                    179),
                                                            minimumSize:
                                                                const Size(
                                                                    200, 55),
                                                          ),
                                                        onPressed: () async {
                                                          if (codeclick) {
                                                            if (notes.isEmpty == false) {
                                                              showDialog<void>(
                                                                barrierDismissible: false,
                                                                context: context,
                                                                builder: (context) {
                                                                  return const Center(
                                                                    child: SpinKitFadingFour(
                                                                      color: Colors.white,
                                                                      size: 50.0,
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              otp = genetor();
                                                              otpinstringform =
                                                                  otp.toString();
                                                              var doc = await firestore
                                                                  .doc(otpinstringform)
                                                                  .get();
                                                              while (doc.exists) {
                                                                otp = genetor();
                                                                otpinstringform =
                                                                    otp.toString();
                                                                doc = await firestore
                                                                    .doc(otpinstringform)
                                                                    .get();
                                                              }
                                                                  
                                                              firestore
                                                                  .doc(otpinstringform)
                                                                  .set({
                                                                'Notes': notes,
                                                                'id': otpinstringform
                                                              }).then((value) async {
                                                                await Clipboard.setData(
                                                                    ClipboardData(
                                                                        text:
                                                                            otpinstringform));
                                                                setState(() {
                                                                  codeclick = false;
                                                                  shareviacode =
                                                                      otpinstringform;
                                                                });
                                                                // ignore: use_build_context_synchronously
                                                                Navigator.pop(
                                                                    context, false);
                                                                Fluttertoast.showToast(
                                                                  msg: "Code Copied",
                                                                  toastLength: Toast.LENGTH_SHORT,
                                                                  gravity: ToastGravity.BOTTOM,
                                                                  timeInSecForIosWeb: 1,
                                                                  backgroundColor: Colors.white,
                                                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                                                  fontSize: 16.0);
                                                              }).onError(
                                                                      (error, stackTrace) {
                                                                Navigator.pop(
                                                                    context, false);
                                                                Fluttertoast.showToast(
                                                                    msg: notes,
                                                                    toastLength:
                                                                        Toast.LENGTH_SHORT,
                                                                    gravity:
                                                                        ToastGravity.BOTTOM,
                                                                    timeInSecForIosWeb: 1,
                                                                    backgroundColor: Colors.white,
                                                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                                                    fontSize: 16.0);
                                                              });
                                                            } else {
                                                              Fluttertoast.showToast(
                                                                  msg:
                                                                      "Notes cannot be empty !",
                                                                  toastLength:
                                                                      Toast.LENGTH_SHORT,
                                                                  gravity:
                                                                      ToastGravity.BOTTOM,
                                                                  timeInSecForIosWeb: 1,
                                                                  backgroundColor: Colors.white,
                                                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                                                  fontSize: 16.0);
                                                            }
                                                            FocusManager
                                                                .instance.primaryFocus
                                                                ?.unfocus();
                                                          }
                                                        },
                                                        child: Text(
                                                          shareviacode,
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      ElevatedButton(
                                                        style:
                                                              ElevatedButton
                                                                  .styleFrom(
                                                            textStyle: const TextStyle(
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    AutofillHints
                                                                        .birthday),
                                                            backgroundColor:
                                                                const Color
                                                                        .fromRGBO(
                                                                    38,
                                                                    36,
                                                                    45,
                                                                    1),
                                                            foregroundColor:
                                                                const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    179,
                                                                    179,
                                                                    179),
                                                            minimumSize:
                                                                const Size(
                                                                    200, 55),
                                                          ),
                                                        onPressed: () async {
                                                          if (linkclick) {
                                                            if (notes.isEmpty == false) {
                                                              showDialog<void>(
                                                                  barrierDismissible: false,
                                                                  context: context,
                                                                  builder: (context) {
                                                                    return const Center(
                                                                      child: SpinKitFadingFour(
                                                                        color: Colors.white,
                                                                        size: 50.0,
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              otp = genetor();
                                                              otpinstringform =
                                                                  otp.toString();
                                                              var doc = await firestore
                                                                  .doc(otpinstringform)
                                                                  .get();
                                                              while (doc.exists) {
                                                                otp = genetor();
                                                                otpinstringform =
                                                                    otp.toString();
                                                                doc = await firestore
                                                                    .doc(otpinstringform)
                                                                    .get();
                                                              }
                                                                  
                                                              firestore
                                                                  .doc(otpinstringform)
                                                                  .set({
                                                                'Notes': notes,
                                                                'id': otpinstringform
                                                              }).then((value) async {
                                                                await Clipboard.setData(
                                                                    ClipboardData(
                                                                        text:
                                                                            "www.quickshare.fun/?code=$otpinstringform"));
                                                                setState(() {
                                                                  linkclick = false;
                                                                });
                                                                // ignore: use_build_context_synchronously
                                                                Navigator.pop(
                                                                    context, false);
                                                                Fluttertoast.showToast(
                                                                    msg: "Link Copied",
                                                                    toastLength:
                                                                        Toast.LENGTH_SHORT,
                                                                    gravity:
                                                                        ToastGravity.BOTTOM,
                                                                    timeInSecForIosWeb: 1,
                                                                    backgroundColor: Colors.white,
                                                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                                                    fontSize: 16.0);
                                                              }).onError(
                                                                      (error, stackTrace) {
                                                                Navigator.pop(
                                                                    context, false);
                                                              });
                                                            } else {
                                                              Fluttertoast.showToast(
                                                                  msg:
                                                                      "Notes cannot be empty !",
                                                                  toastLength:
                                                                      Toast.LENGTH_SHORT,
                                                                  gravity:
                                                                      ToastGravity.BOTTOM,
                                                                  timeInSecForIosWeb: 1,
                                                                  backgroundColor: Colors.white,
                                                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                                                  fontSize: 16.0);
                                                            }
                                                            FocusManager
                                                                .instance.primaryFocus
                                                                ?.unfocus();
                                                          }
                                                        },
                                                        child: const Text(
                                                          "Share via Link",
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.cloud_upload,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        size: 90,
                                      ),
                                      Text(
                                        "SEND",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                      color: const Color.fromARGB(0, 255, 255, 255),
                      width: screenWidth,
                      child: SizedBox(
                        height: screenHeight * 0.4,
                        child: FrostedGlassBox(
                          theHeight: screenHeight * 0.4,
                          theWidth: 400.0,
                          theChild: Container(
                            width: 700.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color.fromARGB(0, 255, 255, 255),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(192, 151, 151, 151),
                                        blurRadius: 10,
                                        offset: Offset(0, 0),
                                        blurStyle: BlurStyle.outer,
                                      )
                                    ]),
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                                splashColor: const Color.fromARGB(255, 228, 228, 228),
                                onTap: () {
                                  if (inputotp.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Cannot be Empty",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.white,
                                        textColor: const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16.0);
                                  }
                                  else{
                                    showDialog<void>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return const Center(
                                        child: SpinKitFadingFour(
                                          color: Colors.white,
                                          size: 50.0,
                                        ),
                                      );
                                    },
                                  );
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(inputotp)
                                      .get()
                                      .then((value) {
                                    documentSnapshot = value;
                                    inputnotes = documentSnapshot['Notes'];
                                    Navigator.pop(context, false);
                                    _dialogBuilder(context);
                                  }).onError((error, stackTrace) {
                                    Navigator.pop(context, false);
                                    FocusManager
                                    .instance
                                    .primaryFocus
                                    ?.unfocus();
                                    Fluttertoast.showToast(
                                        msg: "Invalid Code",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.white,
                                        textColor: const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16.0);
                                  });
                                }
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(30, 10, 30, 10),
                                      child: TextField(
                                        onChanged: (value) {
                                          inputotp = value.toString();
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(30, 20, 20, 20),
                                          hintText: 'Enter your Code',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Icon(
                                      CupertinoIcons.cloud_download,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 90,
                                    ),
                                    const Text(
                                      "RECIEVE",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int genetor() {
    var rand = Random();
    int opt = rand.nextInt(88888) + 10000;

    return opt;
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showGeneralDialog(
      barrierDismissible: false,
      context: context,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (BuildContext context, a1, a2, widget) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: StatefulBuilder(
                builder: (context, setState) {
              return AlertDialog(
                backgroundColor: const Color.fromRGBO(54, 54, 54, 1),
                insetPadding: EdgeInsets.zero,
                scrollable: true,
                alignment: Alignment.center,
                content: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Your Notes",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color.fromARGB(255, 214, 214, 214),
                                fontFamily:
                                    AutofillHints.birthday,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(
                                      context, false);
                                  setState(() {
                                    copymessage = "Copy";
                                  });
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Color.fromARGB(255, 214, 214, 214),
                                ))),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(
                          5, 15, 0, 15),
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: 600,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(10),
                        color: const Color.fromRGBO(38, 36, 45, 1),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(
                                  10, 0, 18, 0),
                          child: SelectableText(
                            inputnotes,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 214, 214, 214),
                              fontFamily:
                                  AutofillHints.birthday,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontFamily:
                                AutofillHints.birthday),
                        backgroundColor:
                              const Color.fromRGBO(38, 36, 45, 1),
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        minimumSize: const Size(140, 45),
                      ),
                      onPressed: () async {
                        await Clipboard.setData(
                            ClipboardData(
                                text: inputnotes));
                        setState(() {
                          copymessage = "Copied";
                        });
                      },
                      child: Text(
                        copymessage,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }

}
