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

  Answer({this.symptomId, this.ailmentId, this.answer});
}

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
