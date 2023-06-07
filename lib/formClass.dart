// To parse this JSON data, do
//
//     final FormClass = FormClassFromJson(jsonString);

import 'dart:convert';

FormClass FormClassFromJson(String str) => FormClass.fromJson(json.decode(str));

String FormClassToJson(FormClass data) => json.encode(data.toJson());

class FormClass {

  FormClass({
    required this.userId,
    required this.gender,
    required this.height,
    required this.weight,
    required this.goalWeight,
    required this.targetCalories,
    required this.age,
    required this.sleep,
    required this.physicalActivityAtWork,
    required this.physicalActivityAtLeisure,
    required this.dietPref,
    required this.water,
    required this.allergies,
    required this.healthConditions,
  });

  String userId;
  String gender;
  String height;
  String weight;
  String goalWeight;
  String targetCalories;
  String age;
  String sleep;
  String physicalActivityAtWork;
  String physicalActivityAtLeisure;
  String dietPref;
  String water;
  String allergies;
  String healthConditions;
  factory FormClass.fromJson(Map<String, dynamic> json) => FormClass(
        userId: json["userId"],
        gender: json["gender"],
        height: json["height"],
        weight: json["weight"],
        goalWeight: json["goalWeight"],
        targetCalories: json["targetCalories:"],
        age: json["age"],
        sleep: json["sleep"],
        physicalActivityAtWork: json["physicalActivityAtWork"],
        physicalActivityAtLeisure: json["physicalActivityAtLeisure"],
        dietPref: json["dietPref"],
        water: json["water"],
        allergies: json["allergies"],
        healthConditions: json["healthConditions"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "gender": gender,
        "height": height,
        "weight": weight,
        "goalWeight": goalWeight,
        "targetCalories:": targetCalories,
        "age": age,
        "sleep": sleep,
        "physicalActivityAtWork": physicalActivityAtWork,
        "physicalActivityAtLeisure": physicalActivityAtLeisure,
        "dietPref": dietPref,
        "water": water,
        "allergies": allergies,
        "healthConditions": healthConditions,
      };
}
