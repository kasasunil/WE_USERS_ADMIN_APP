import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weusers/search.dart';
import 'package:weusers/userClass.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'form.dart';
import 'formClass.dart';

class Users extends StatefulWidget {
  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final List<Welcome> entry = Get.arguments;
  Future<dynamic> getForm(String phone, String email, String fbid) async {
    print("http://192.168.10.8:8000/we/admin/getForm/$phone/$email/$fbid"+phone+email+fbid);
    if (phone == '') {
      phone = "123";
    }
    if (email == '') {
      email = "123";
    }
    if (fbid == '') {
      fbid = "123";
    }
    var response = await http.get(
        Uri.parse(
            "http://192.168.10.8:8000/we/admin/getForm/$phone/$email/$fbid"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response.body);
    print(response.statusCode);
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

  @override
  Widget build(BuildContext context) {
    if (entry.length == 0) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Search Users Here'),
          leading: IconButton(
            onPressed: () {
              if (context != null) {
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 30.0),
          child: Text("NO RESULTS FOUND"),
        )),
      );
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text('WholesomeEten Users'),
          leading: IconButton(
            onPressed: () {
              if (context != null) {
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(SearchWidget());
              },
              icon: Icon(Icons.search),
            )
          ]),
      body: ListView.builder(
          itemCount: entry.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                print(
                    "${entry[index].phone}${entry[index].email}${entry[index].fbid}");
                var form = await getForm(
                    entry[index].phone, entry[index].email, entry[index].fbid);
                Get.to(Formwidget(title: entry[index].name), arguments: form);
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
          }),
    );
  }
}
