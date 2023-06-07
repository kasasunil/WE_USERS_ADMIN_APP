// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:ffi';
import 'package:get/get.dart';
import 'package:weusers/users.dart';
import "search.dart";
import "userClass.dart";
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  List<Welcome> users = [];
  Future<String> getUsers() async {
    print("http://192.168.10.8:8000/we/admin/getUsers");
    var response = await http.get(
        Uri.parse("http://192.168.10.8:8000/we/admin/getUsers"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      var d = welcomeFromJson(response.body);
      setState(() {
        users = d;
      });
      return "success";
      // jsonResponse = Future.value(jsonRes);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return "error";
    }
  }

  Future<String> getcount() async {
    print("hi");
    var response = await http.get(
        Uri.parse("http://192.168.10.8:8000/we/admin/getCount"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['count'];
      print('Number of books about http: $itemCount.');
      setState(() {
        counter = itemCount;
      });
      return "succes";
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return "Fail";
    }
  }
  @override
  void initState() {
    print("hi");
    getcount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'No of Users:',
              style: TextStyle(
                fontSize: 20.0,
              )
            ),
            SizedBox(
              width: 20.0,
            ),
            Text('$counter',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              )
            ),
            ElevatedButton(
                onPressed: () async {
                  print("Calling getUsers.............");
                  await getUsers();
                  print("It printed");
                  Get.to(Users(), arguments: users);
                },
                child: Text('Show Users')),
            ElevatedButton(onPressed: (){
              Get.to(SearchWidget());
            }, child: Text("Search Users"))
          ],
        ),
      ),
    );
  }
}
