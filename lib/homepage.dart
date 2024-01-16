import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Frostedglass.dart';
// import 'package:otp_text_field/otp_text_field.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int otp = 0;
  double x = 0;
  double y = 0;
  double amplitude = 0.3;

  String inputotp = "";
  String otpinstringform = "";
  String shareviacode = "Share via Code";
  String sharevialink = "Share via Link";
  bool codeclick = true;
  bool linkclick = true;
  String inputnotes = "";
  String notes = "";
  String codedisplay = "";
  String linkdisplay = "";
  String copynotes = "Copy";
  String errormessage = "";
  String codeerrormessage = "";
  Color errorcolor = const Color.fromARGB(255, 0, 0, 0);
  Color col = const Color.fromRGBO(38, 36, 45, 1);
  
  void reversetext() {
    setState(() {
      col = const Color.fromRGBO(38, 36, 45, 1);
      notes = "";
      codedisplay = "";
      linkdisplay = "";
      errormessage = "";
      codeclick = true;
      linkclick = true;
      shareviacode = "Share via Code";
      sharevialink = "Share via Link";
    });
  }

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance.collection('users');
  late DocumentSnapshot documentSnapshot;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("QuickShare"),
      //   centerTitle: true,
      //   backgroundColor: Color.fromARGB(255, 0, 0, 0),
      // ),
      body: SingleChildScrollView(
        child: Container(
          height: 660,
          decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/bg10.jpg"),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Container(
                width: screenWidth,
                height: 60.0,
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
                height: 550.0,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(50, 150, 25, 150),
                      color: Colors.transparent,
                      width: screenWidth * 0.5,
                      child: FrostedGlassBox(
                        theWidth: 700.0,
                        theHeight: 400.0,
                        theChild: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(0, 172, 26, 26),
                          ),
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
                                      scale: Tween<double>(begin: 0.5, end: 1.0)
                                          .animate(a1),
                                      child: FadeTransition(
                                        opacity:
                                            Tween<double>(begin: 0.5, end: 1.0)
                                                .animate(a1),
                                        child: StatefulBuilder(
                                            builder: (context, setState) {
                                          return BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 5, sigmaY: 5),
                                            child: AlertDialog(
                                              scrollable: true,
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      54, 54, 54, 1),
                                              alignment: Alignment.center,
                                              content: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 20,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
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
                                                            alignment: Alignment
                                                                .center,
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  reversetext();
                                                                  Navigator.pop(
                                                                      context,
                                                                      false);
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          214,
                                                                          214,
                                                                          214),
                                                                ))),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.5,
                                                      width: 600,
                                                      child: TextField(
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
                                                        maxLines: 10,
                                                        minLines: 10,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
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
                                                          onPressed:
                                                              () async {
                                                            if (codeclick) {
                                                              if (notes
                                                                      .isEmpty ==
                                                                  false) {
                                                                showDialog<
                                                                    void>(
                                                                  barrierDismissible:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return const Center(
                                                                      child:
                                                                          SpinKitFadingFour(
                                                                        color:
                                                                            Colors.white,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                                otp =
                                                                    genetor();
                                                                otpinstringform =
                                                                    otp.toString();
                                                                var doc =
                                                                    await firestore
                                                                        .doc(
                                                                            otpinstringform)
                                                                        .get();
                                                                while (doc
                                                                    .exists) {
                                                                  otp =
                                                                      genetor();
                                                                  otpinstringform =
                                                                      otp.toString();
                                                                  doc = await firestore
                                                                      .doc(
                                                                          otpinstringform)
                                                                      .get();
                                                                }

                                                                firestore
                                                                    .doc(
                                                                        otpinstringform)
                                                                    .set({
                                                                  'Notes':
                                                                      notes,
                                                                  'id':
                                                                      otpinstringform
                                                                }).then(
                                                                        (value) async {
                                                                  await Clipboard.setData(
                                                                      ClipboardData(
                                                                          text:
                                                                              otpinstringform));
                                                                  setState(
                                                                      () {
                                                                    codeclick =
                                                                        false;
                                                                    shareviacode =
                                                                        "Copied";
                                                                  });

                                                                  // ignore: use_build_context_synchronously
                                                                  Navigator.pop(
                                                                      context,
                                                                      false);
                                                                  setState(
                                                                      () {
                                                                    errorcolor =
                                                                        const Color.fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0);
                                                                    codedisplay =
                                                                        otpinstringform;
                                                                  });
                                                                }).onError((error,
                                                                        stackTrace) {
                                                                  Navigator.pop(
                                                                      context,
                                                                      false);
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  errorcolor =
                                                                      const Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          0,
                                                                          0);
                                                                  errormessage =
                                                                      "Notes Cannot be Empty";
                                                                  col = const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      255,
                                                                      0,
                                                                      0);
                                                                });
                                                              }
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            }
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              if (codeclick ==
                                                                  false)
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                              Text(
                                                                shareviacode,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              if (codeclick ==
                                                                  false)
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                              if (codeclick ==
                                                                  false)
                                                                const Icon(
                                                                  Icons.check,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                  size: 20,
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        ElevatedButton(
                                                          style:
                                                              ElevatedButton
                                                                  .styleFrom(
                                                            textStyle: const TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        214,
                                                                        214,
                                                                        214),
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
                                                          onPressed:
                                                              () async {
                                                            if (linkclick) {
                                                              if (notes
                                                                      .isEmpty ==
                                                                  false) {
                                                                showDialog<
                                                                    void>(
                                                                  barrierDismissible:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return const Center(
                                                                      child:
                                                                          SpinKitFadingFour(
                                                                        color:
                                                                            Colors.white,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                                otp =
                                                                    genetor();
                                                                otpinstringform =
                                                                    otp.toString();
                                                                var doc =
                                                                    await firestore
                                                                        .doc(
                                                                            otpinstringform)
                                                                        .get();
                                                                while (doc
                                                                    .exists) {
                                                                  otp =
                                                                      genetor();
                                                                  otpinstringform =
                                                                      otp.toString();
                                                                  doc = await firestore
                                                                      .doc(
                                                                          otpinstringform)
                                                                      .get();
                                                                }

                                                                firestore
                                                                    .doc(
                                                                        otpinstringform)
                                                                    .set({
                                                                  'Notes':
                                                                      notes,
                                                                  'id':
                                                                      otpinstringform
                                                                }).then(
                                                                        (value) async {
                                                                  await Clipboard.setData(
                                                                      ClipboardData(
                                                                          text:
                                                                              "www.quickshare.fun/?code=$otpinstringform"));
                                                                  setState(
                                                                      () {
                                                                    linkclick =
                                                                        false;
                                                                    sharevialink =
                                                                        "Copied";
                                                                    linkdisplay =
                                                                        "www.quickshare.fun/?code=$otpinstringform";
                                                                  });
                                                                  // ignore: use_build_context_synchronously
                                                                  Navigator.pop(
                                                                      context,
                                                                      false);
                                                                  setState(
                                                                      () {
                                                                    errorcolor =
                                                                        const Color.fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0);
                                                                  });
                                                                }).onError((error,
                                                                        stackTrace) {
                                                                  Navigator.pop(
                                                                      context,
                                                                      false);
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  errorcolor =
                                                                      const Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          0,
                                                                          0);
                                                                  errormessage =
                                                                      "Notes Cannot be Empty";
                                                                  col = const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      255,
                                                                      0,
                                                                      0);
                                                                });
                                                              }
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            }
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              if (codeclick ==
                                                                  false)
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                              Text(
                                                                sharevialink,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              if (linkclick ==
                                                                  false)
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                              if (linkclick ==
                                                                  false)
                                                                const Icon(
                                                                  Icons.check,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                  size: 20,
                                                                ),
                                                            ],
                                                          ),
                                                          // child: Text(
                                                          //   sharevialink,
                                                          //   textAlign:
                                                          //       TextAlign
                                                          //           .center,
                                                          // ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    if (errormessage.isNotEmpty)
                                                      Center(
                                                        child: Text(
                                                          errormessage,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  errorcolor),
                                                        ),
                                                      ),
                                                    if (codedisplay.isNotEmpty)
                                                      Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      9,
                                                                      6,
                                                                      9,
                                                                      6),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9),
                                                                color: const Color
                                                                        .fromRGBO(
                                                                    38,
                                                                    36,
                                                                    45,
                                                                    1),
                                                              ),
                                                              child:
                                                                  SelectableText(
                                                                codedisplay[0],
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 7,
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      9,
                                                                      6,
                                                                      9,
                                                                      6),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9),
                                                                color: const Color
                                                                        .fromRGBO(
                                                                    38,
                                                                    36,
                                                                    45,
                                                                    1),
                                                              ),
                                                              child:
                                                                  SelectableText(
                                                                codedisplay[1],
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 7,
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      9,
                                                                      6,
                                                                      9,
                                                                      6),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9),
                                                                color: const Color
                                                                        .fromRGBO(
                                                                    38,
                                                                    36,
                                                                    45,
                                                                    1),
                                                              ),
                                                              child:
                                                                  SelectableText(
                                                                codedisplay[2],
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 7,
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      9,
                                                                      6,
                                                                      9,
                                                                      6),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9),
                                                                color: const Color
                                                                        .fromRGBO(
                                                                    38,
                                                                    36,
                                                                    45,
                                                                    1),
                                                              ),
                                                              child:
                                                                  SelectableText(
                                                                codedisplay[3],
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 7,
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      9,
                                                                      6,
                                                                      9,
                                                                      6),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9),
                                                                color: const Color
                                                                        .fromRGBO(
                                                                    38,
                                                                    36,
                                                                    45,
                                                                    1),
                                                              ),
                                                              child:
                                                                  SelectableText(
                                                                codedisplay[4],
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    if (linkdisplay.isNotEmpty)
                                                      Center(
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  14, 7, 14, 7),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        13),
                                                            color: const Color
                                                                    .fromRGBO(
                                                                38, 36, 45, 1),
                                                          ),
                                                          child: SelectableText(
                                                            linkdisplay,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 17),
                                                          ),
                                                        ),
                                                      )
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
                    Container(
                      padding: const EdgeInsets.fromLTRB(25, 150, 50, 150),
                      color: Colors.transparent,
                      width: screenWidth * 0.5,
                      child: FrostedGlassBox(
                        theHeight: 400.0,
                        theWidth: 700.0,
                        theChild: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color.fromARGB(0, 218, 150, 150),
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
                              splashColor:
                                  const Color.fromARGB(255, 228, 228, 228),
                              onTap: () {
                                if (inputotp.isEmpty) {
                                  setState(() {
                                    codeerrormessage = "Code cannot be empty";
                                  });
                                } else {
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
                                    setState(() {
                                      codeerrormessage = "Code Invalid";
                                    });
                                  });
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(50, 0, 0, 0),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      codeerrormessage,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 255, 0, 0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 3, 30, 10),
                                    child: TextField(
                                      onChanged: (value) {
                                        inputotp = value.toString();
                                        setState(() {
                                          codeerrormessage = "";
                                        });
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                30, 20, 20, 20),
                                        hintText: 'Enter your Code',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
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
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              )),
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
            child: StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                scrollable: true,
                alignment: Alignment.center,
                backgroundColor: const Color.fromRGBO(54, 54, 54, 1),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Your Notes",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 214, 214, 214),
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                    setState(() {
                                      copynotes = "Copy";
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
                        padding: const EdgeInsets.fromLTRB(15, 15, 7, 15),
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: 600,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(38, 36, 45, 1),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SizedBox(
                            width: 600,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
                              child: SelectableText(
                                inputnotes,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 214, 214, 214),
                                    fontFamily: AutofillHints.birthday,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 17,
                              fontFamily: AutofillHints.birthday),
                          backgroundColor:
                              const Color.fromRGBO(38, 36, 45, 1),
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          minimumSize: const Size(140, 45),
                        ),
                        onPressed: () async {
                          setState(() {
                            copynotes = "Copied";
                          });
                          await Clipboard.setData(
                              ClipboardData(text: inputnotes));
                        },
                        child: Text(
                          copynotes,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
