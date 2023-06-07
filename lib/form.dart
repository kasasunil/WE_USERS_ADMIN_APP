import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import "formClass.dart";

class Formwidget extends StatefulWidget {
  const Formwidget({super.key,required this.title});
  final String title;
  @override
  State<Formwidget> createState() => _FormwidgetState();
}

class _FormwidgetState extends State<Formwidget> {
  FormClass entry=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text("UserId: ",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.orange[600])),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(entry.userId,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            )),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                        children: [
                          Text("Gender: ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.orange[600])),
                          SizedBox(
                            width: 10,
                          ),
                          Text(entry.gender,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              )),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                          children: [
                            Text("Height: ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.orange[600])),
                            SizedBox(
                              width: 10,
                            ),
                            Text(entry.height,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                )),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                            children: [
                              Text("Weight: ",
                                  style:
                                      TextStyle(fontSize: 20, color: Colors.orange[600])),
                              SizedBox(
                                width: 10,
                              ),
                              Text(entry.weight,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                              children: [
                                Text("GoalWeight: ",
                                    style:
                                        TextStyle(fontSize: 20, color: Colors.orange[600])),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(entry.goalWeight,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    )),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                                  children: [
                                    Text("targetCalories: ",
                                        style:
                                            TextStyle(fontSize: 20, color: Colors.orange[600])),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(entry.targetCalories,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                    children: [
                                      Text("Age: ",
                                          style:
                                              TextStyle(fontSize: 20, color: Colors.orange[600])),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(entry.age,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                children: [
                  Text("sleep: ",
                      style:
                          TextStyle(fontSize: 20, color: Colors.orange[600])),
                  SizedBox(
                    width: 10,
                  ),
                  Text(entry.sleep,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("physicalActivityAtWork: ",
                      style:
                          TextStyle(fontSize: 20, color: Colors.orange[600])),
                  SizedBox(
                    width: 10,
                  ),
                  Text(entry.physicalActivityAtWork,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("physicalActivityAtLeisure: ",
                      style:
                          TextStyle(fontSize: 20, color: Colors.orange[600])),
                  SizedBox(
                    width: 10,
                  ),
                  Text(entry.physicalActivityAtLeisure,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("DietPref: ",
                      style:
                          TextStyle(fontSize: 20, color: Colors.orange[600])),
                  SizedBox(
                    width: 10,
                  ),
                  Text(entry.dietPref,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Water: ",
                      style:
                          TextStyle(fontSize: 20, color: Colors.orange[600])),
                  SizedBox(
                    width: 10,
                  ),
                  Text(entry.water,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
              
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text("Allergies: ",
                        style:
                            TextStyle(fontSize: 20, color: Colors.orange[600])),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(entry.allergies,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text("HealthConditions: ",
                        style:
                            TextStyle(fontSize: 20, color: Colors.orange[600])),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(entry.healthConditions,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                  ],
                ),
              ),
                  ],
                ),
              ),
      ),
    );
  }
}
