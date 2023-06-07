import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weusers/userClass.dart';
import 'package:weusers/users.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'form.dart';
import 'formClass.dart';

class SearchWidget extends StatefulWidget {
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String text = "";
  List<Welcome> entry = [];
  Future<dynamic> getForm(String phone,String email,String fbid) async {
    if(phone ==''){
      phone = "123";
    }
    if(email ==''){
      email = "123";
    }
    if(fbid ==''){
      fbid = "123";
    }
    var response = await http.get(
        Uri.parse("http://192.168.10.8:8000/we/admin/getForm/$phone/$email/$fbid"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      var d;
      setState(() {
        d = FormClassFromJson(response.body);
      });

      return d;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
  Future<String> getUsers() async {
    print("hi");
    var response = await http.get(
        Uri.parse("http://192.168.10.8:8000/we/admin/findUsersMatchingText/$text"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      var d = welcomeFromJson(response.body);
      setState(() {
        entry = d;
      });
      return "success";
      // jsonResponse = Future.value(jsonRes);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return "error";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search The WEusers here!'),
        leading: IconButton(
          onPressed: () {
            if (context != null) {
              setState(() {
                text = "";
                entry = [];
              });
              Navigator.pop(context);
            }
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 30.0),
        child: Column(
          children: [
            TextField(
                onChanged: (value) async{
                  setState(() {
                    text = value;
                  });
                  await getUsers();
                },
                decoration: InputDecoration(
                    hintText: "Search by name or phone or email",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ))),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 40,
            ),
            entry.length == 0
            ?Center(
              child: Text("No results found",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            )
            :Expanded(
              child: ListView.builder(
                    itemCount: entry.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          var form = await getForm(entry[index].phone,entry[index].email,entry[index].fbid);
                          Get.to(Formwidget(title: entry[index].name),
                              arguments: form);
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200],
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Icon(Icons.person),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Name",
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(entry[index].name),
                                  ]),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(children: [
                                    Icon(Icons.email),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Email",
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      entry[index].email,
                                    )
                                  ]),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Phone",
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      entry[index].phone,
                                    )
                                  ]),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(children: [
                                    Icon(Icons.star),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "IsPremiumUser",
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      entry[index].isPremiumUser,
                                    )
                                  ]),
                                ]),
                          ),
                        ),
                      );
                    })
            )
          ],
        ),
      ),
    );
  }
}
