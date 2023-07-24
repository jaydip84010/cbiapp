import 'package:cbiapp/brp_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'model/btn_model.dart';
import 'model/charge_model.dart';
import 'model/drawermodel.dart';

class BccScreen extends StatefulWidget {
  const BccScreen({Key? key}) : super(key: key);

  @override
  State<BccScreen> createState() => _BccScreenState();
}

class _BccScreenState extends State<BccScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController bondcalcute = TextEditingController();
  bool ddmenu = false;
  int seletedindex = 1;
  double Conveyfee = 0;
  double postagesPetties = 0;
  double deedsOffice = 0;
  double vat = 0;
  double deedsofficesSearch = 0;
  double egeneration_fee = 0;
  double docgenfee = 0;
  double stordocfee = 0;
  double total = 0;

  selectbtn(int index) {
    setState(() {
      seletedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<chargeModel> charges = [
      chargeModel("Convey Fee", "R $Conveyfee "),
      chargeModel("Postages & Pettis", "R $postagesPetties"),
      chargeModel("Deeds Office", "R $deedsOffice"),
      chargeModel("Electronic Geeration Fee", "R $egeneration_fee"),
      chargeModel("Deeds Office Searches", "R $deedsofficesSearch"),
      chargeModel("Document Generation Fee", "R $docgenfee"),
      chargeModel("Store Document Fee", "R $stordocfee"),
      chargeModel("VAT", "R $vat"),
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
                        'Bond Detail',
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: "Arial",
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
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
                          keyboardType: TextInputType.number,
                          controller: bondcalcute,
                          keyboardAppearance: Brightness.light,
                          cursorColor: Colors.grey,
                          cursorHeight: 25,
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
                      double price = double.tryParse(bondcalcute.text) ?? 0;
                      calculateConveyFee(price);
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
                                              margin:
                                                  EdgeInsets.only(right: 40),
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
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
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
                                'R $total ',
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
                            text: "R100 ",
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
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
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
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
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

  void calculateConveyFee(double price) {
    if (price > 0 && price <= 100000) {
      Conveyfee = 7110;
      vat = 1662.75;
    } else if (price > 100000 && price <= 155000) {
      Conveyfee = 8085;
      vat = 1809.00;
    } else if (price > 155000 && price <= 205000) {
      Conveyfee = 9060;
      vat = 1955.25;
    } else if (price > 205000 && price <= 255000) {
      Conveyfee = 10035;
      vat = 2101.50;
    } else if (price > 255000 && price <= 325000) {
      Conveyfee = 11010;
      vat = 2247.75;
    } else if (price > 325000 && price <= 375000) {
      Conveyfee = 11985;
      vat = 2394.00;
    } else if (price > 375000 && price <= 405000) {
      Conveyfee = 12960;
      vat = 2540.25;
    } else if (price > 405000 && price <= 475000) {
      Conveyfee = 13935;
      vat = 2686.50;
    } else if (price > 475000 && price <= 525000) {
      Conveyfee = 14910;
      vat = 2832.75;
    } else if (price > 525000 && price <= 625000) {
      Conveyfee = 16795;
      vat = 3115.50;
    } else if (price > 625000 && price <= 725000) {
      Conveyfee = 18680;
      vat = 3398.25;
    } else if (price > 725000 && price <= 825000) {
      Conveyfee = 20565;
      vat = 3681.00;
    } else if (price > 825000 && price <= 925000) {
      Conveyfee = 22450;
      vat = 3963.75;
    } else if (price > 925000 && price <= 1050000) {
      Conveyfee = 24335;
      vat = 4246.50;
    } else if (price > 1050000 && price <= 1250000) {
      Conveyfee = 26220;
      vat = 4529.25;
    } else if (price > 1250000 && price <= 1450000) {
      Conveyfee = 28105;
      vat = 4812.00;
    } else if (price > 1450000 && price <= 1650000) {
      Conveyfee = 29990;
      vat = 5094.75;
    } else if (price > 1650000 && price <= 1850000) {
      Conveyfee = 31875;
      vat = 5377.50;
    } else if (price > 1850000 && price <= 2050000) {
      Conveyfee = 33760;
      vat = 5660.25;
    } else if (price > 2050000 && price <= 2250000) {
      Conveyfee = 35645;
      vat = 5943.00;
    } else if (price > 2250000 && price <= 2500000) {
      Conveyfee = 37530;
      vat = 6225.75;
    } else if (price > 2500000 && price <= 2650000) {
      Conveyfee = 39415;
      vat = 6508.50;
    } else if (price > 2650000 && price <= 2850000) {
      Conveyfee = 41300;
      vat = 6791.25;
    } else if (price > 2850000 && price <= 3100000) {
      Conveyfee = 43185;
      vat = 7074.00;
    } else if (price > 3100000 && price <= 3300000) {
      Conveyfee = 45070;
      vat = 7356.75;
    } else if (price > 3300000 && price <= 3500000) {
      Conveyfee = 46955;
      vat = 7639.50;
    } else if (price > 3500000 && price <= 3700000) {
      Conveyfee = 48840;
      vat = 7922.25;
    } else if (price > 3700000 && price <= 3900000) {
      Conveyfee = 50725;
      vat = 8205.00;
    } else if (price > 3900000 && price <= 4100000) {
      Conveyfee = 52610;
      vat = 8487.75;
    } else if (price > 4100000 && price <= 4300000) {
      Conveyfee = 54495;
      vat = 8770.50;
    } else if (price > 4300000 && price <= 4500000) {
      Conveyfee = 56380;
      vat = 9053.25;
    } else if (price > 4500000 && price <= 4700000) {
      Conveyfee = 58265;
      vat = 9336.00;
    } else if (price > 4700000 && price <= 4900000) {
      Conveyfee = 60150;
      vat = 9618.75;
    } else if (price > 4900000 && price <= 5200000) {
      Conveyfee = 62035;
      vat = 9901.50;
    } else if (price > 5200000 && price <= 6200000) {
      Conveyfee = 66785;
      vat = 10614.00;
    } else if (price > 6200000 && price <= 7200000) {
      Conveyfee = 71535;
      vat = 11326.50;
    } else if (price > 7200000 && price <= 8200000) {
      Conveyfee = 76285;
      vat = 12039.00;
    } else if (price > 8200000 && price <= 9200000) {
      Conveyfee = 81035;
      vat = 12751.50;
    } else if (price > 9200000) {
      Conveyfee = 85785;
      vat = 13464.00;
    }

    postagesPetties = 980;
    deedsOffice = 496;
    deedsofficesSearch = 30;
    egeneration_fee = 150;
    docgenfee = 750;
    stordocfee = 795;

    total = Conveyfee +
        postagesPetties +
        vat +
        deedsofficesSearch +
        deedsOffice +
        egeneration_fee +
        docgenfee +
        stordocfee;
  }
}
