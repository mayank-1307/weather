import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:http/http.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:cupertino_icons/cupertino_icons.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    // const IconData thermometer = IconData(0xf864, fontFamily: iconFont, fontPackage: iconFontPackage);
    var city_name = ["Mumbai", "Delhi", "Chennai", "Indore", "Srinagar", "Shamli","Banglore"];
    final _random = new Random();
    var lcity = city_name[_random.nextInt(city_name.length)];
    TextEditingController searchController = new TextEditingController();
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String? temp = info?['temp-value'].toString().substring(0,4);
    String icon = info?['icon_value'];
    String getcity = info?['city_value'];
    String hum = info?['hum_value'];
    String air = ((info?['air_speed_value']).toString()).substring(0,4);
    String des = info?['des_value'];
    print("temperature is ${info?['temp_value'].toString().substring(0,4)}");
    // print("temperature is ${temp}");

    // if (kDebugMode) {
    //   print(info?['temp_value']);
    // }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: GradientAppBar(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.blue.shade200,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          //Gradient decoration
          decoration: BoxDecoration(
            gradient: LinearGradient(
                //Linear Gradient
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade50,
                  // Colors.pinkAccent,
                  // Colors.greenAccent
                ]),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    // Icon(Icons.search),
                    GestureDetector(
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.blueAccent,
                        ),
                        margin: EdgeInsets.fromLTRB(3, 0, 8, 0),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/loading",arguments: {
                          "searchText":searchController.text,
                        }
                        );
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search ${lcity}',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: EdgeInsets.all(26),
                      child: Row(
                        children: [
                          Image.network("http://openweathermap.org/img/wn/$icon@2x.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                // ${info['desciption']},
                                "${des}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'In ${getcity}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 230,
                      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(CupertinoIcons.thermometer),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${info?['temp_value'].toString().substring(0,4)}',
                                style: TextStyle(
                                  fontSize: 80,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('C',
                              style: TextStyle(
                                fontSize: 30
                              ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 160,
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(CupertinoIcons.wind),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '$air',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('km/hr'),
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 160,
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(CupertinoIcons.drop),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '$hum',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('%'),
                          ],
                        )
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Made by Mayank',
                ),
              ),
              Container(
                child: Text(
                  'Data provided By OpenWeatherMap.com'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

