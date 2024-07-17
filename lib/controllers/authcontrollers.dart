import 'dart:async';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkman_manager_app/authentication/login_page.dart';
import 'package:milkman_manager_app/componants/navbar.dart';
import 'package:milkman_manager_app/controllers/all_controllers.dart';
import 'package:milkman_manager_app/controllers/app_state.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/main.dart';
import 'package:milkman_manager_app/model/user_model.dart';
import 'package:provider/provider.dart';

class AllFuntion {
  BuildContext context;
  AuthController controllers;
  AllFuntion(this.controllers, this.context);
  // FIREBASE INSTANCE HANDLER
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  // user new  create kerne ka funtion

  Future<void> createAccount(
      BuildContext context, Map<String, dynamic> body, String password) async {
    var provider = Provider.of<App_state_controllers>(context, listen: false);
    provider.set_loader(true);
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: body['email'], password: password)
          .then((value) async {
        if (value.user != null) {
          print("IF case Run *****************  ");
          ;
          prefs.setString("userID", value.user!.uid.toString());

          prefs.setString("users", body.toString());
          prefs.setString("email", body['email']);
          await user_detials(value.user!.uid, body);
        } else {
          print("Else case Run *****************  ");
          ;
        }
        provider.set_loader(false);
      });
    } catch (e) {
      print(e.toString());
      provider.set_loader(false);
    }
  }

  /// user Detials
  Future<void> user_detials(String uid, Map<String, dynamic> data) async {
    try {
      final model = user_model.fromuser_basic_model(data, uid);
      await firestore
          .collection("users")
          .doc(uid)
          .set(model.tojson())
          .then((value) async {
        controllers.set_user_data(model);
        Appservices.pushto(context, BottomBarScreen());
      });
    } catch (e) {
      if (e is FirebaseAuthException) {
        print(e.message);
      }
      if (e is TimeoutException) {
        //  WHEN FUNCTION TAKES TOO MUCH TIME TO LOAD.
        //  JAB FUNCTION 20 SECOND SE JYADA TIME LE RHA HAI

        print("Our Server is busy. Please try again leter.");
      }
    }
  }

  ///  p][] account logout ka funtion
  Future<void> logoutUser(BuildContext context) async {
    var provider = Provider.of<App_state_controllers>(context, listen: false);
    await _auth.signOut();

    // prefs.clear();
    prefs.remove("user");
    prefs.remove("uid");
    provider.set_loader(false);
    Appservices.pushto(context, Login_page());
  }

//  Singal Data Update
  Future<void> getupdateuserdata(String uid, String imageUrl) async {
    var provider = Provider.of<App_state_controllers>(context, listen: false);
    provider.set_loader(true);
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .update({"image": imageUrl}).then((value) {
        controllers.userimageupdate(imageUrl);
        Appservices.goback(context);
      });
    } catch (e) {
    } finally {
      provider.set_loader(false);
    }
  }

//   Model Update
  Future<void> getupdateuserdataModel(user_model model) async {
    await firestore.collection("users").doc(model.uid).update(model.tojson());
  }

  ///====================upload file===============================//
  Future<String> uploadFile(File target, String path) async {
    var provider = Provider.of<App_state_controllers>(context, listen: false);
    provider.set_loader(true);
    try {
      Reference reff;
      //path ko aadhaar maanate hue, agar khalii hai, to user kee profail chhavi ka refharens banaata hai. anyatha, url se refharens banaata hai.
      if (path.isEmpty) {
        reff = storage
            .ref("users/profileImage/${controllers.getuser_data.uid}.png");
      } else {
        reff = storage.refFromURL(path);
      }
      //profile image refharens ke saath apalod karata hai.
      await reff.putFile(target);

      // Uploads the target file with references.Gets and returns the download URL.
      final url = await reff.getDownloadURL();

      return url;
    } catch (e) {
      print(e.toString());
      rethrow;
    } finally {
      provider.set_loader(false);
    }
  }

  // Future<void> updateimage(String path, File file, BuildContext context) async {
  //   try {
  //     await storage
  //         .refFromURL(path)
  //         .putFile(file)
  //         .whenComplete(() => Utils.toastmassage("image updated Seccessfully"));
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
