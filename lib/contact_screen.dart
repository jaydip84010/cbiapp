import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " Contact",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffcd1e25),
                        fontFamily: "Arial",
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 0.4,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      left: MediaQuery.of(context).size.width / 8,
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xffbb161b),
                                  Color(0xffad1015),
                                  Color(0xff96060a),
                                ],
                                begin: Alignment.center,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "01",
                            textAlign: TextAlign.values[2],
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Arial",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: MediaQuery.of(context).size.width / 24,
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        height: 70,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border(
                                right: BorderSide(color: Color(0xffcd1e25)),
                                top: BorderSide(color: Color(0xffcd1e25)),
                                left: BorderSide(color: Color(0xffcd1e25)),
                                bottom: BorderSide(color: Color(0xffcd1e25)))),
                        child: Container(
                          margin: EdgeInsets.only(right: 20, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      colors: [
                                        Color(0xffbb161b),
                                        Color(0xffad1015),
                                        Color(0xff96060a),
                                      ],
                                      begin: Alignment.center,
                                      end: Alignment.bottomCenter,
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.srcIn,
                                  child: Image.asset(
                                    "assets/images/home.png",
                                    height: 50,
                                    width: 50,
                                  )),
                              SizedBox(
                                width: 70,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3, right: 10),
                                child: Text(
                                  "Head Office",
                                  textAlign: TextAlign.values[2],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Arial",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffcd1e25)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 430,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      left: MediaQuery.of(context).size.width / 8,
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xffbb161b),
                                  Color(0xffad1015),
                                  Color(0xff96060a),
                                ],
                                begin: Alignment.center,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "02",
                            textAlign: TextAlign.values[2],
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Arial",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: MediaQuery.of(context).size.width / 24,
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        height: 400,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border(
                                right: BorderSide(color: Color(0xffcd1e25)),
                                top: BorderSide(color: Color(0xffcd1e25)),
                                left: BorderSide(color: Color(0xffcd1e25)),
                                bottom: BorderSide(color: Color(0xffcd1e25)))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return LinearGradient(
                                          colors: [
                                            Color(0xffbb161b),
                                            Color(0xffad1015),
                                            Color(0xff96060a),
                                          ],
                                          begin: Alignment.center,
                                          end: Alignment.bottomCenter,
                                        ).createShader(bounds);
                                      },
                                      blendMode: BlendMode.srcIn,
                                      child: Image.asset(
                                        "assets/images/home.png",
                                        height: 50,
                                        width: 50,
                                      )),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 3,
                                      left: 20,
                                    ),
                                    child: Text(
                                      "Westrand Office",
                                      textAlign: TextAlign.values[2],
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontFamily: "Arial",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffcd1e25)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 1),
                                height: 0.4,
                                width: MediaQuery.of(context).size.width / 1.35,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width / 1.3,
                              decoration: BoxDecoration(
                                  color: Color(0xfffaedef),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                margin: EdgeInsets.only(top: 10, left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Address",
                                      textAlign: TextAlign.values[2],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Arial",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffbb161b)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "GroundFloor,Gateview House Block A1,Costania Office",
                                      textAlign: TextAlign.values[2],
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "Arial",
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Park, Vakhaas Avenue, Welwreden Park, Roadport",
                                      textAlign: TextAlign.values[2],
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "Arial",
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width / 1.3,
                              decoration: BoxDecoration(
                                  color: Color(0xfffaedef),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                margin: EdgeInsets.only(top: 10, left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Business Hours",
                                      textAlign: TextAlign.values[2],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Arial",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffbb161b)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Monday-Friday : 8:00am-4:00pm",
                                      textAlign: TextAlign.values[2],
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "Arial",
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Saturday-Sunday : On Appointment Only",
                                      textAlign: TextAlign.values[2],
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "Arial",
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.3,
                              decoration: BoxDecoration(
                                  color: Color(0xfffaedef),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                margin: EdgeInsets.only(top: 10, left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Phone",
                                      textAlign: TextAlign.values[2],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Arial",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffbb161b)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Office : (010) 880 4125",
                                      textAlign: TextAlign.values[2],
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "Arial",
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.3,
                              decoration: BoxDecoration(
                                  color: Color(0xfffaedef),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                margin: EdgeInsets.only(top: 10, left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      textAlign: TextAlign.values[2],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Arial",
                                          fontWeight: FontWeight.bold,
                                          color:Color(0xffbb161b)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "westrand@bassoninc.co.za",
                                      textAlign: TextAlign.values[2],
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "Arial",
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      left: MediaQuery.of(context).size.width / 8,
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xffbb161b),
                                  Color(0xffad1015),
                                  Color(0xff96060a),
                                ],
                                begin: Alignment.center,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "03",
                            textAlign: TextAlign.values[2],
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Arial",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: MediaQuery.of(context).size.width / 24,
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        height: 70,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border(
                                right: BorderSide(color: Color(0xffcd1e25)),
                                top: BorderSide(color: Color(0xffcd1e25)),
                                left: BorderSide(color: Color(0xffcd1e25)),
                                bottom: BorderSide(color: Color(0xffcd1e25)))),
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      colors: [
                                        Color(0xffbb161b),
                                        Color(0xffad1015),
                                        Color(0xff96060a),
                                      ],
                                      begin: Alignment.center,
                                      end: Alignment.bottomCenter,
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.srcIn,
                                  child: Image.asset(
                                    "assets/images/home.png",
                                    height: 50,
                                    width: 50,
                                  )),
                              SizedBox(
                                width: 65,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 3,
                                ),
                                child: Text(
                                  " Northrand Office",
                                  textAlign: TextAlign.values[2],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Arial",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffcd1e25)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
