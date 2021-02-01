import 'package:flutter/material.dart';

class UiMenuModel {
  String title;
  AssetImage icon;
  String subtitle;
  Color itemColor;

  UiMenuModel({this.title, this.icon, this.subtitle, this.itemColor});
}

List<UiMenuModel> menuItem = [
  UiMenuModel(
      title: "Test & Checkups",
      icon: AssetImage("assets/image/redset.jpg"),
      subtitle: "Diagnostics",
      itemColor: Colors.white),
  UiMenuModel(
      title: "Previous Diagnose",
      icon: AssetImage("assets/image/recod.jpg"),
      subtitle: "History",
      itemColor: Colors.white),
  UiMenuModel(
      title: "Top hospitals",
      icon: AssetImage("assets/image/hosp.jpg"),
      subtitle: "Hospitals",
      itemColor: Colors.white),
  UiMenuModel(
      title: "Medicine & More",
      icon: AssetImage("assets/image/medi.jpg"),
      subtitle: "Pharmacy",
      itemColor: Colors.white),
];