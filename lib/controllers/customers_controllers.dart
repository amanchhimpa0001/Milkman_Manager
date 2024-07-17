import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:milkman_manager_app/Utils/Utils.dart';
import 'package:milkman_manager_app/controllers/all_controllers.dart';
import 'package:milkman_manager_app/controllers/app_state.dart';
import 'package:milkman_manager_app/model/customer_model.dart';
import 'package:provider/provider.dart';

// Add Customers controllers
class Add_Customers extends ChangeNotifier {
  List<Customer_model>? _customer = [];
  List<Customer_model>? get getcustomer => _customer;

  addcustomer(List<Customer_model> model) {
    _customer = model;
    notifyListeners();
  }

  // -------------------------screen change controllers-----------------------------------------------------

  int _index = 0;
  int get getindex => _index;
  set_index(int index) {
    _index = index;
    notifyListeners();
  }

//   screen main provider ka data remove kerne ka function
  clearcustomer(String id) {
    _customer!.removeWhere((element) => element.uid == id);
    notifyListeners();
  }

  final firestore = FirebaseFirestore.instance;

// Add customers Function
  Future<void> addcustomers(
      BuildContext context, Map<String, dynamic> data) async {
    var loadingstate =
        Provider.of<App_state_controllers>(context, listen: false);
    loadingstate.set_loader(true);
    try {
      //This adds customer data to Firestore's 'Customers' collection.After successfully adding data, creates new Customer_model and adds it to _customer list.Uses Utils.snackbar to show a success message to the user.
      await firestore.collection("Customers").add(data).then((value) async {
        final model = Customer_model.form_basic_custamer_model(data, value.id);
        _customer!.add(model);
        Utils.snackbar("Form Successful", context);
      });
    } catch (e) {
    } finally {
      loadingstate.set_loader(false);
    }
  }

  /// Add customers data fetch funtion ///  firebase se data lene ka funtion
  Future<void> fetchcustomers(BuildContext context) async {
    var loadingstate =
        Provider.of<App_state_controllers>(context, listen: false);
    var userprovider = Provider.of<AuthController>(context, listen: false);
    print("---------------");
    print(userprovider.getuser_data.uid);
    print("---------------");
    loadingstate.set_loader(true);
    try {
      final customers = await firestore
          .collection('Customers')
          .where("uid", isEqualTo: userprovider.getuser_data.uid)
          .get();

      print(customers.docs.map((e) => e.data()));

      // _customer LIST KO UPDATES KERNE KE LIYE
      // ager docs khali h to yah ak khali list deta h
      _customer = customers.docs.isEmpty
          ? []
          : customers.docs

              // changes each document to Customer_model and adds it to the _customer list.
              // document ko Customer_model main badel ker customer list main add ker deta h
              .map((e) =>
                  Customer_model.form_basic_custamer_model(e.data(), e.id))
              .toList();

      notifyListeners();
    } catch (e) {
      print(e.toString());
    } finally {
      loadingstate.set_loader(false);
    }
  }

  //  FIRBASE per data delete kerne ka function

  Future<void> Deletecustomers(String uid) async {
    await firestore.collection('Customers').doc(uid).delete();
  }
}
