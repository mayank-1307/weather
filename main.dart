import 'package:flutter/material.dart';
import 'package:mausam/screens/home.dart';
import 'package:mausam/screens/location.dart';
import 'package:mausam/screens/loading.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(),
    routes: {
      "/" : (context) => Loading(),
      "/home" :(context) => Home(),
      "/loading" :(context) => Loading(),
    },
  ));
}