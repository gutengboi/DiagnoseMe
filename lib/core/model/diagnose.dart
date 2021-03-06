import 'package:flutter/material.dart';

class AILMENT {
  int id;
  String ailmentName;
  String prevention;
  String dosage;
  String causeName;
  String treatment;

  AILMENT(
      {this.id,
      this.ailmentName,
      this.causeName,
      this.prevention,
      this.dosage,
      this.treatment});
}

class SYMPTOM {
  int id;
  String symptomsName;
  double weight;
  int ailmentid;

  SYMPTOM({this.id, this.symptomsName, this.weight, this.ailmentid});
}

class Answer {
  int symptomId;
  int ailmentId;
  bool answer;
  double weight;
  String question;

  Answer(
      {this.symptomId,
      this.ailmentId,
      this.answer,
      this.weight,
      @required this.question});

  Answer.fromJson(Map<String, dynamic> json) {
    symptomId = json['symptomId'];
    ailmentId = json['ailmentId'];
    answer = json['answer'];
    weight = json['weight'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symptomId'] = this.symptomId;
    data['ailmentId'] = this.ailmentId;
    data['answer'] = this.answer;
    data['weight'] = this.weight;
    data['question'] = this.weight;
    // data['id'] = this.id;
    return data;
  }
}

class ResponseString {
  List<Answer> responseJSON;
  int id;

  ResponseString({this.responseJSON, this.id});

  ResponseString.fromJson(Map<String, dynamic> json) {
    if (json['responseJSON'] != null) {
      responseJSON = new List<Answer>();
      json['responseJSON'].forEach((v) {
        responseJSON.add(new Answer.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responseJSON != null) {
      data['challenges'] = this.responseJSON.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

// class ResponseString {
//   int id;
//   List<Answer> responseJSON;
//
//   ResponseString({this.id, this.responseJSON});
//
//   ResponseString.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     responseJSON = json['responseJSON'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['responseJSON'] = this.responseJSON;
//     return data;
//   }
// }

List<AILMENT> ailmentItems = [
  AILMENT(
      id: 1,
      ailmentName: "ASTHMA",
      dosage: "1 to 2 puffs every 4 to 6 hours OR 2.5mg nebulized TID to QID",
      prevention: "Early treatment of any chest infection can help.",
      causeName: "Allergy; idiophatic(unknow cause).",
      treatment:
          "Inhalers;Aminophine;Ventolin Tablet; Treat any underline infection with appropriate antibiotics."),
  AILMENT(
      id: 2,
      ailmentName: "CHOLERA",
      dosage:
          "12 years old, Doxycyline 2-4mg/kg \n >=12years old,Adults And Pregnate woman should take Doxycyline 300mg(Single Dose)",
      prevention:
          "Clean and wash hands after using tiolet: Boil drinking water.",
      causeName: "Bacteria:Cholera Vibro",
      treatment:
          "Salt and Water Solution; Hospital Admission;Treatcycline capsules."),
  AILMENT(
      id: 3,
      ailmentName: "Diabetes Mellitus",
      treatment: "Reduce carbohydrate intake;Exercise Also see a doctor.",
      prevention: "Weight Control Exercise and Regular Medical Checkup",
      causeName: "Disease of pancreas leading to reduced insulin production.",
      dosage:
          "Glucophage 500mg BID OR 850mg Daily, Tolinase, 100 to 250mg daily with the first meal of the day."),
];

List<SYMPTOM> symptomsItems = [
  SYMPTOM(
      id: 1,
      symptomsName: "Difficulty in breathing in",
      weight: 1.00,
      ailmentid: 1),
  SYMPTOM(
      id: 2, symptomsName: "Flaring of the nose", weight: 1.00, ailmentid: 1),
  SYMPTOM(id: 3, symptomsName: "Dry Cough", weight: 0.70, ailmentid: 1),
  SYMPTOM(id: 4, symptomsName: "Chest Pain", weight: 0.80, ailmentid: 1),
  SYMPTOM(id: 5, symptomsName: "Frequent Stooling", weight: 1.00, ailmentid: 2),
  SYMPTOM(id: 6, symptomsName: "Watery Stooling", weight: 1.00, ailmentid: 2),
  SYMPTOM(
      id: 7, symptomsName: "Loss of Consciousness", weight: 0.90, ailmentid: 2),
  SYMPTOM(
      id: 8, symptomsName: "Frequent Urination", weight: 1.00, ailmentid: 3),
  SYMPTOM(id: 9, symptomsName: "Excessive thirst", weight: 1.00, ailmentid: 3),
  SYMPTOM(
      id: 10,
      symptomsName: "Excessive water intake",
      weight: 1.00,
      ailmentid: 3),
  SYMPTOM(id: 11, symptomsName: "Weight loss", weight: 0.85, ailmentid: 3),
  SYMPTOM(id: 12, symptomsName: "Numbness", weight: 0.60, ailmentid: 3),
  SYMPTOM(
      id: 13, symptomsName: "Ants Arround Urine", weight: 0.70, ailmentid: 3),
  SYMPTOM(id: 14, symptomsName: "Sugary Sweet", weight: 0.70, ailmentid: 3),
];

List<String> healthTips = [
  "Eat a variety of foods,",
  "Base your diet on plenty of foods rich in carbohydrates.",
  "Replace saturated with unsaturated fat.",
  "Enjoy plenty of fruits and vegetables.",
  "Reduce salt and sugar intake.",
  "Eat regularly, control the portion size.",
  "Drink plenty of fluids.",
  "Maintain a healthy body weight.",
  "Don’t drink sugar calories",
  "Eat nuts regularly",
  "Avoid processed junk food (eat real food instead)",
  "Don’t fear coffee",
  "Eat fatty fish",
  "Get enough sleep",
  "Take care of your gut health with probiotics and fiber",
  "Drink some water, especially before meals",
  "Don’t overcook or burn your meat",
  "Avoid bright lights before sleep.",
  "Take vitamin D3 if you don’t get much sun exposure",
  "Eat vegetables and fruits",
  " Make sure to eat enough protein",
  "Do some cardio",
  "Don’t smoke or do drugs, and only drink in moderation.",
  " Use extra virgin olive oil",
  " Minimize your sugar intake",
  "Don’t eat a lot of refined carbs",
  "Don’t fear saturated fat",
  "Lift heavy things",
  "Avoid artificial trans fats",
  "Use plenty of herbs and spices",
  "Take care of your relationships.",
  "Track your food intake every now and then.",
  "If you have excess belly fat, get rid of it.",
  "Don’t go on a diet.",
  "Eat eggs, yolk and all."
];
