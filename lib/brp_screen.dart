import 'dart:math';

import 'package:flutter/material.dart';

import 'bcc_screen.dart';
import 'home_screen.dart';
import 'model/btn_model.dart';
import 'model/charge_model.dart';
import 'model/drawermodel.dart';

class BrpScreen extends StatefulWidget {
  const BrpScreen({Key? key}) : super(key: key);

  @override
  State<BrpScreen> createState() => _BrpScreenState();
}

class _BrpScreenState extends State<BrpScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController price_amt= TextEditingController();
  TextEditingController perc=TextEditingController();
  double monthlyPayment = 0;
  double totalrepay_amount=0;
  int loanTermYears = 5;
  double intrepayment=0;
  bool ddmenu = false;
  int seletedindex = 2;
  int intrest = 0;


  selectbtn(int index) {
    setState(() {
      seletedindex = index;
    });
  }

  selectintpercntage(int perc) {
    setState(() {
      intrest = perc;
    });
  }


  @override
  Widget build(BuildContext context) {
    List<chargeModel> charges = [
      chargeModel("Interest Repayment", "R  $intrepayment"),
      chargeModel("Total Loan Repayment", "R $totalrepay_amount"),

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
                Column(
                  children: [
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
                              controller: price_amt,
                              keyboardType: TextInputType.number,
                              keyboardAppearance: Brightness.light,
                              cursorColor: Colors.grey,
                              cursorHeight: 25,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
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
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              'Years To Repay ',
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
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: () {
                                  selectintpercntage(0);
                                  setState(() {
                                    loanTermYears=5;
                                  });
                                },
                                child: intrest == 0
                                    ? Container(
                                        height: 50,
                                        width: 55,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color(0xffbb161b),
                                                  Color(0xffad1015),
                                                  Color(0xff96060a),
                                                ],
                                                begin: Alignment.center,
                                                end: Alignment.bottomCenter),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            "5",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: "Arial",
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 50,
                                        width: 55,
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Text(
                                            "5",
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
                                  selectintpercntage(1);
                                  setState(() {
                                    loanTermYears=10;
                                  });
                                },
                                child: intrest == 1
                                    ? Container(
                                        height: 50,
                                        width: 55,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color(0xffbb161b),
                                                  Color(0xffad1015),
                                                  Color(0xff96060a),
                                                ],
                                                begin: Alignment.center,
                                                end: Alignment.bottomCenter),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            "10",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: "Arial",
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 50,
                                        width: 55,
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Text(
                                            "10",
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
                                  selectintpercntage(2);
                                  setState(() {
                                    loanTermYears=15;
                                  });
                                },
                                child: intrest == 2
                                    ? Container(
                                        height: 50,
                                        width: 55,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color(0xffbb161b),
                                                  Color(0xffad1015),
                                                  Color(0xff96060a),
                                                ],
                                                begin: Alignment.center,
                                                end: Alignment.bottomCenter),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            "15",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: "Arial",
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 50,
                                        width: 55,
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Text(
                                            "15",
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
                                  selectintpercntage(3);
                                  setState(() {
                                    loanTermYears=20;
                                  });
                                },
                                child: intrest == 3
                                    ? Container(
                                        height: 50,
                                        width: 55,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color(0xffbb161b),
                                                  Color(0xffad1015),
                                                  Color(0xff96060a),
                                                ],
                                                begin: Alignment.center,
                                                end: Alignment.bottomCenter),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            "20",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: "Arial",
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 50,
                                        width: 55,
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Text(
                                            "20",
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
                                  selectintpercntage(4);
                                  setState(() {
                                    loanTermYears=25;
                                  });
                                },
                                child: intrest == 4
                                    ? Container(
                                        height: 50,
                                        width: 55,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color(0xffbb161b),
                                                  Color(0xffad1015),
                                                  Color(0xff96060a),
                                                ],
                                                begin: Alignment.center,
                                                end: Alignment.bottomCenter),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            "25",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: "Arial",
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 50,
                                        width: 55,
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Text(
                                            "25",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: "Arial",
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                          ),
                                        ),
                                      )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              'Interest Rate',
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
                            "%",
                            style: TextStyle(
                                fontSize: 22,
                                color: Color(0xffcd1e25),
                                fontWeight: FontWeight.w600,
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
                              controller: perc,
                              keyboardType: TextInputType.number,
                              keyboardAppearance: Brightness.light,
                              cursorColor: Colors.grey,
                              cursorHeight: 25,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
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
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      calculateMonthlyPayment();
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
                    height: MediaQuery.of(context).size.height / 4.2,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border(
                            right: BorderSide(color: Color(0xffcd1e25)),
                            top: BorderSide(color: Color(0xffcd1e25)),
                            left: BorderSide(color: Color(0xffcd1e25)),
                            bottom: BorderSide(color: Color(0xffcd1e25)))),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ListView.builder(
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
                              margin: EdgeInsets.only(left: 20, top: 0),
                              child: Text(
                                'Total Monthly Cost  ',
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
                                'R ${monthlyPayment} ',
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




  void calculateMonthlyPayment() {
    double principal = double.tryParse(price_amt.text) ?? 0;
    double interestRate = double.tryParse(perc.text) ?? 0;

    double monthlyInterestRate = interestRate / 100 / 12;
    double totalMonths = loanTermYears * 12;

    if (monthlyInterestRate == 0) {
      monthlyPayment = principal / totalMonths;
    } else {
      monthlyPayment = principal *
          (monthlyInterestRate * pow(1 + monthlyInterestRate, totalMonths)) /
          (pow(1 + monthlyInterestRate, totalMonths) - 1);
    }
    monthlyPayment = double.parse(monthlyPayment.toStringAsFixed(2));

    intrepayment=monthlyPayment*totalMonths-principal;
    intrepayment=double.parse(intrepayment.toStringAsFixed(2));
     totalrepay_amount= principal + intrepayment;
     totalrepay_amount= double.parse(totalrepay_amount.toStringAsFixed(2));

  }
}
