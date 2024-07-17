import 'package:flutter/material.dart';
import 'package:milkman_manager_app/view/Analytics/milklist/receivedMilk_List.dart';
import 'package:milkman_manager_app/view/Analytics/milklist/sale_Milk_List.dart';

class Milk_model {
  String date, milk, totallter, delivery, deliveryltr, sale, saleltr;
  Widget screen;
  Milk_model(this.date, this.milk, this.totallter, this.delivery,
      this.deliveryltr, this.sale, this.saleltr, this.screen);
}

class Milkmodel_helper {
  static var dailymilkflowlist = [
    Milk_model("29, March 2019", "Milk\nReceived", "150 Ltr.", "Home Diary",
        "40 Ltr.", "Milk Plant", "110 Ltr.", ReceivedMilkList()),
    Milk_model("29, March 2019", "Milk\nSale", "78 Ltr.", "Direct Sale",
        "60 Ltr.", "Diary Sale", "180 Ltr.", SaleMilkList())
  ];
  static var MilkVariantsChartlist = [
    Milk_model("29, March 2019", "Cow\nMilk", "150 Ltr.", "Home", "40 Ltr.",
        "Diary", "110 Ltr.", SizedBox()),
    Milk_model("29, March 2019", "Buffalo\nMilk", "78 Ltr.", "Home", "60 Ltr.",
        "Diary", "180 Ltr.", SizedBox())
  ];
}
