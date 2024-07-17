import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:milkman_manager_app/Utils/Utils.dart';
import 'package:milkman_manager_app/controllers/app_state.dart';
import 'package:milkman_manager_app/model/milk_model.dart';
import 'package:provider/provider.dart';

class Milk_controllers extends ChangeNotifier {
  List<MilkModel> _Milk = [];
  List<MilkModel> get getmilk => _Milk;
  add_milk_model(List<MilkModel> model) {
    _Milk = model;
    notifyListeners();
  }

  int _index = 0;
  int get getindex => _index;
  set_index(int index) {
    _index = index;
    notifyListeners();
  }

  final firestore = FirebaseFirestore.instance;

  Future<void> receivemilk(
    Map<String, dynamic> data,
    BuildContext context,
  ) async {
    var loadingstate =
        Provider.of<App_state_controllers>(context, listen: false);
    loadingstate.set_loader(true);
    try {
      await firestore.collection("Milkdata").add(data);

      final model = MilkModel.from_basic_Milkmodel(data);
      _Milk.add(model);
      Utils.snackbar("Form Successful", context);
    } catch (e) {
      print(
          "============================================${e.toString()}===========================================");
    } finally {
      notifyListeners();
      loadingstate.set_loader(false);
    }
  }

  Future<void> fetchreceivemilk(BuildContext context) async {
    var loadingstate =
        Provider.of<App_state_controllers>(context, listen: false);
    loadingstate.set_loader(true);
    try {
      final milk = await firestore.collection('Milkdata').get();
      print("Step1:::::::::::");
      print(milk.docs.map((e) => e.data()));
      _Milk = milk.docs.isEmpty
          ? []
          : milk.docs
              .map((e) => MilkModel.from_basic_Milkmodel(e.data()))
              .toList();

      print("Step2:::::::::::");
      // print(customers.docs.map((e) => e.data()));

      notifyListeners();
      loadingstate.set_loader(false);
    } catch (e) {
      print(e.toString());
      loadingstate.set_loader(false);
    }
  }
}
