import 'package:flutter/material.dart';
import 'package:weusers/home.dart';
import 'package:weusers/users.dart';
import './form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'search.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'WholesomeEten'),
    );
  }
}
