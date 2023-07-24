import 'package:cbiapp/bcc_screen.dart';
import 'package:cbiapp/brp_screen.dart';
import 'package:cbiapp/contact_screen.dart';
import 'package:cbiapp/model/charge_model.dart';
import 'package:cbiapp/model/drawermodel.dart';
import 'package:flutter/material.dart';

import 'model/btn_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _priceController = TextEditingController();
  bool ddmenu = false;
  int seletedindex = 0;
  double transferAttorney = 0;
  double postagesPetties = 0;
  double obtaintran_duty = 0;
  double obtainclear_cert = 0;
  double deedsOffice = 0;
  double vat = 0;
  double deedsofficesSearch = 0;
  double egeneration_fee = 0;
  double fica = 0;
  double total_amount = 0;

  selectbtn(int index) {
    setState(() {
      seletedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<chargeModel> charges = [
      chargeModel("Transfer Attorney Fees", "R $transferAttorney "),
      chargeModel("Postages & Pettis", "R $postagesPetties"),
      chargeModel("Transfer Duty", "R $obtaintran_duty"),
      chargeModel("Deeds Office Fees", "R $deedsOffice"),
      chargeModel("Electronic Geeration Fee", "R $egeneration_fee"),
      chargeModel("FICA", "R $fica"),
      chargeModel("Deeds Office Searche", "R $deedsofficesSearch"),
      chargeModel("Rates Clearence fee", "R $obtainclear_cert"),
      chargeModel("VAT", "R $vat")
    ];
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Customdrawer(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 5, top: 10),
                        child: InkWell(
                          onTap: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          child: Image.asset(
                            'assets/images/menu.png',
                            height: 30,
                            width: 30,
                            color: Color(0xffcd1e25),
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 30,
                        width: 160,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'Transfer Detail',
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: "Arial",
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )),
                    Container(
                        margin: EdgeInsets.only(right: 40),
                        child: Image.asset(
                          'assets/images/i.png',
                          height: 18,
                          width: 18,
                        ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border(
                          right: BorderSide(color: Color(0xffcd1e25)),
                          top: BorderSide(color: Color(0xffcd1e25)),
                          left: BorderSide(color: Color(0xffcd1e25)),
                          bottom: BorderSide(color: Color(0xffcd1e25)))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "R",
                        style: TextStyle(
                            fontSize: 22,
                            color: Color(0xffcd1e25),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Arial"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 40,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: TextField(
                          keyboardAppearance: Brightness.light,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.grey,
                          cursorHeight: 25,
                          controller: _priceController,
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Arial",
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                     calculateValues();
                    },
                    child: Image.asset(
                      'assets/images/calculater.png',
                      height: 57,
                      width: 170,
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'Results',
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: "Arial",
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Stack(children: [
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border(
                            right: BorderSide(color: Color(0xffcd1e25)),
                            top: BorderSide(color: Color(0xffcd1e25)),
                            left: BorderSide(color: Color(0xffcd1e25)),
                            bottom: BorderSide(color: Color(0xffcd1e25)))),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        color: Colors.transparent,
                        showLeading: false,
                        showTrailing: false,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 20),
                            itemCount: charges.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 20),
                                            child: Text(
                                              '${charges[index].title}  ',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: "Arial",
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(right: 40),
                                              child: Image.asset(
                                                'assets/images/i.png',
                                                height: 12,
                                                width: 12,
                                              )),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Text(
                                          '${charges[index].costprice}  ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Arial",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 0.4,
                                    width: MediaQuery.of(context).size.width / 1.5,
                                    color: Colors.grey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xffc01a1e), Color(0xff98090c)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'Total Transfer Cost \n (incl. VAT)  ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Arial",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                'R $total_amount ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Arial",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ))
                ]),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text.rich(TextSpan(
                      text:
                          "Approximate transfer quotation for purchase price at  ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "Arial",
                          fontSize: 11),
                      children: [
                        TextSpan(
                            text: "R ${_priceController.text} ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffcd1e25),
                                fontFamily: "Arial",
                                fontSize: 11))
                      ])),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/images/download.png",
                          height: 70,
                          width: 70,
                        ),
                        Image.asset(
                          "assets/images/print.png",
                          height: 70,
                          width: 70,
                        ),
                        Image.asset(
                          "assets/images/gmail.png",
                          height: 70,
                          width: 70,
                        ),
                        Image.asset(
                          "assets/images/whatsapp.png",
                          height: 70,
                          width: 70,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Color(0xffcd1e25),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          selectbtn(0);
                        },
                        child: seletedindex == 0
                            ? Container(
                                height: 35,
                                width: 80,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        blurRadius: 10,
                                        offset: Offset(3,
                                            8), // changes the position of the shadow
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffbb161b),
                                          Color(0xffad1015),
                                          Color(0xff96060a),
                                        ],
                                        begin: Alignment.center,
                                        end: Alignment.bottomCenter),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "TCC",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Arial",
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            : Container(
                                height: 35,
                                width: 80,
                                color: Colors.transparent,
                                child: Center(
                                  child: Text(
                                    "TCC",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Arial",
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ),
                              )),
                    InkWell(
                        onTap: () {
                          selectbtn(1);
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => BccScreen(),
                          ));
                        },
                        child: seletedindex == 1
                            ? Container(
                                height: 35,
                                width: 80,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        blurRadius: 10,
                                        offset: Offset(3,
                                            8), // changes the position of the shadow
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffbb161b),
                                          Color(0xffad1015),
                                          Color(0xff96060a),
                                        ],
                                        begin: Alignment.center,
                                        end: Alignment.bottomCenter),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "BCC",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Arial",
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            : Container(
                                height: 35,
                                width: 80,
                                color: Colors.transparent,
                                child: Center(
                                  child: Text(
                                    "BCC",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Arial",
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ),
                              )),
                    InkWell(
                        onTap: () {
                          selectbtn(2);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BrpScreen(),
                          ));
                        },
                        child: seletedindex == 2
                            ? Container(
                                height: 35,
                                width: 80,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        blurRadius: 10,
                                        offset: Offset(3,
                                            8), // changes the position of the shadow
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffbb161b),
                                          Color(0xffad1015),
                                          Color(0xff96060a),
                                        ],
                                        begin: Alignment.center,
                                        end: Alignment.bottomCenter),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "BRP",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Arial",
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            : Container(
                                height: 35,
                                width: 80,
                                color: Colors.transparent,
                                child: Center(
                                  child: Text(
                                    "BRP",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Arial",
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ),
                              )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<drawermodel> draweritem = [
    drawermodel("Home"),
    drawermodel("About Us"),
    drawermodel("Property Law"),
    drawermodel("Debt Collection"),
    drawermodel("Litigation"),
    drawermodel("Estate & Estete Planning"),
    drawermodel("Contact Us"),
  ];

  List<btnmodel> drawerbtn = [
    btnmodel("Cost Calculator"),
    btnmodel("Document Checklist"),
    btnmodel("Wht Appoint Us"),
    btnmodel("FAQ's"),
    btnmodel("Property Transfer Process"),
  ];

  Widget Customdrawer() {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 700,
              width: 200,
              child: ListView.builder(
                itemCount: draweritem.length,
                itemBuilder: (context, index) {
                  if (index != 2) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${draweritem[index].title}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: "Arial",
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            height: 0.3,
                            width: MediaQuery.of(context).size.width / 2.2,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              ddmenu = !ddmenu;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "  ${draweritem[index].title}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xffcd1e25),
                                    fontFamily: "Arial",
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ddmenu == false
                                  ? Image.asset(
                                      "assets/images/right-arrow.png",
                                      height: 19,
                                      width: 19,
                                      color: Color(0xffcd1e25),
                                    )
                                  : Image.asset(
                                      "assets/images/down-aerrow.png",
                                      height: 19,
                                      width: 19,
                                      color: Color(0xffcd1e25),
                                    )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ddmenu == false ? 0 : 15,
                        ),
                        Visibility(
                          visible: ddmenu,
                          child: Container(
                            height: 280,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                color: Color(0xfffaedef),
                                borderRadius: BorderRadius.circular(30)),
                            child: ListView.builder(
                              itemCount: drawerbtn.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      margin:
                                          EdgeInsets.only(top: 12, left: 20),
                                      child: Container(
                                        height: 30,
                                        width: 160,
                                        decoration: BoxDecoration(
                                            color: seletedindex != index
                                                ? Colors.transparent
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              seletedindex = index;
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 12, left: 1),
                                            child: Text(
                                              "  ${draweritem[index].title}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: seletedindex != index
                                                      ? Colors.black
                                                      : Color(0xffcd1e25),
                                                  fontFamily: "Arial",
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 0.3,
                          width: MediaQuery.of(context).size.width / 2.2,
                          color: Colors.grey,
                        )
                      ],
                    );
                  }
                },
              ),
            )
          ],
        ));
  }

  void calculateValues() {
    int price = int.tryParse(_priceController.text) ?? 0;

    if (price > 0 && price < 105000) {
      transferAttorney = 7110;
      deedsOffice = 45;
      vat = 1506;
    } else if (price >= 105000 && price < 155000) {
      transferAttorney = 8085;
      vat = 1652.25;
      if (price >= 105000 && price < 205000) {
        deedsOffice = 101;
      }
    } else if (price >= 155000 && price < 205000) {
      transferAttorney = 9060;
      vat = 1798.50;
    } else if (price >= 205000 && price < 325000) {
      transferAttorney = 10035;
      vat = 1944.75;
      if (price >= 205000 && price < 255000) {
        deedsOffice = 642;
      }
    } else if (price >= 255000 && price < 325000) {
      transferAttorney = 11010;
      vat = 2091;
      if (price >= 625000 && price < 825000) {
        deedsOffice = 1126;
      }
    } else if (price >= 325000 && price < 375000) {
      transferAttorney = 11985;
      vat = 2237.25;
      if (price >= 825000 && price < 1050000) {
        deedsOffice = 1293;
      }
    } else if (price >= 375000 && price < 405000) {
      transferAttorney = 12960;
      vat = 2383.50;
      if (price >= 1050000 && price < 2050000) {
        deedsOffice = 1453;
      }
    } else if (price >= 405000 && price < 475000) {
      transferAttorney = 13935;
      vat = 2529.75;
      if (price >= 2050000 && price < 4100000) {
        deedsOffice = 2014;
      }
    } else if (price >= 475000 && price < 525000) {
      transferAttorney = 14910;
      vat = 2676.00;
      if (price >= 4100000 && price < 6200000) {
        deedsOffice = 2443;
      }
    } else if (price >= 525000 && price < 625000) {
      transferAttorney = 16195;
      vat = 2958.75;
      if (price >= 6200000 && price < 8200000) {
        deedsOffice = 2909;
      }
    } else if (price >= 625000 && price < 725000) {
      transferAttorney = 18680;
      vat = 3241.50;
      if (price >= 8200000 && price < 10000000) {
        deedsOffice = 3401;
      }
    } else if (price >= 725000 && price < 825000) {
      transferAttorney = 20565;
      vat = 3524.25;
    } else if (price >= 825000 && price < 925000) {
      transferAttorney = 22450;
      vat = 3807.00;
    } else if (price >= 925000 && price < 1050000) {
      transferAttorney = 24335;
      vat = 4089.75;
    } else if (price >= 1050000 && price < 1250000) {
      transferAttorney = 26220;
      vat = 4372.50;
    } else if (price >= 1250000 && price < 1450000) {
      transferAttorney = 28105;
      vat = 4655.25;
    } else if (price >= 1450000 && price < 1650000) {
      transferAttorney = 29990;
      vat = 4938;
    } else if (price >= 1650000 && price < 1850000) {
      transferAttorney = 31875;
      vat = 5220.75;
    } else if (price >= 1850000 && price < 2050000) {
      transferAttorney = 33760;
      vat = 5503.50;
    } else if (price >= 2050000 && price < 2250000) {
      transferAttorney = 35645;
      vat = 5786.25;
    } else if (price >= 2250000 && price < 2500000) {
      transferAttorney = 37530;
      vat = 6069;
    } else if (price >= 2500000 && price < 2650000) {
      transferAttorney = 39415;
      vat = 6351.75;
    } else if (price >= 2650000 && price < 2850000) {
      transferAttorney = 41300;
      vat = 6634.50;
    } else if (price >= 2850000 && price < 3100000) {
      transferAttorney = 43185;
      vat = 6917.25;
    } else if (price >= 3100000 && price < 3300000) {
      transferAttorney = 45070;
      vat = 7200;
    } else if (price >= 3300000 && price < 3500000) {
      transferAttorney = 46955;
      vat = 7482.75;
    } else if (price >= 3500000 && price < 3700000) {
      transferAttorney = 48840;
      vat = 7765.50;
    } else if (price >= 3700000 && price < 3900000) {
      transferAttorney = 50725;
      vat = 8048.25;
    } else if (price >= 3900000 && price < 4100000) {
      transferAttorney = 52610;
      vat = 8331;
    } else if (price >= 4100000 && price < 4300000) {
      transferAttorney = 54495;
      vat = 8613.75;
    } else if (price >= 4300000 && price < 4500000) {
      transferAttorney = 56380;
      vat = 8896.50;
    } else if (price >= 4500000 && price < 4700000) {
      transferAttorney = 58265;
      vat = 9179.25;
    } else if (price >= 4700000 && price < 4900000) {
      transferAttorney = 60150;
      vat = 9462;
    } else if (price >= 4900000 && price < 5200000) {
      transferAttorney = 62035;
      vat = 9744.75;
    } else if (price >= 5200000 && price < 6200000) {
      transferAttorney = 66785;
      vat = 10457.25;
    } else if (price >= 6200000 && price < 7200000) {
      transferAttorney = 71535;
      vat = 11169.75;
    } else if (price >= 7200000 && price < 8200000) {
      transferAttorney = 76285;
      vat = 11882.25;
    } else if (price >= 8200000 && price < 9200000) {
      transferAttorney = 81035;
      vat = 12594.75;
    } else if (price >= 9200000 && price <= 10000000) {
      transferAttorney = 85785;
      vat = 13307.25;
    }

    setState(() {
      transferAttorney = transferAttorney;
      postagesPetties = 980;
      obtaintran_duty = 250;
      obtainclear_cert = 250;
      egeneration_fee = 450;
      fica = 700;
      deedsofficesSearch = 300;
      deedsOffice = deedsOffice;
      vat = vat;
      total_amount = transferAttorney +
          postagesPetties +
          obtainclear_cert +
          obtaintran_duty +
          egeneration_fee +
          fica +
          deedsofficesSearch +
          deedsOffice +
          vat;
    });
  }
}
