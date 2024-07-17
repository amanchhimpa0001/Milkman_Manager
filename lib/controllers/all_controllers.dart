import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:milkman_manager_app/authentication/login_page.dart';
import 'package:milkman_manager_app/controllers/app_state.dart';

import 'package:milkman_manager_app/model/user_model.dart';
import 'package:provider/provider.dart';

import '../componants/navbar.dart';
import '../helpers/app_services.dart';
import '../main.dart';

class AuthController extends ChangeNotifier {
  // FIREBASE INSTANCE HANDLER
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  // USER DATA HANDLER
  dynamic _user_data;
  user_model get getuser_data => _user_data;
  set_user_data(user_model model) {
    _user_data = model;
    notifyListeners();
  }

  /// singal image update kerne ka funtion
  userimageupdate(String url) {
    user_model d = _user_data as user_model;
    d.image = url;
    notifyListeners();
  }

  //   user ki image ko update kerna
  String _profileImage = "";
  String get profileImage => _profileImage;

  updateProfileImage(String img) {
    _user_data!.image = img;
    notifyListeners();
  }

// delete kerne ka funtion
  Future<void> resetuser() async {
    _user_data = null;

    notifyListeners();
  }

  // CHECK IF WE HAVE USER ID IN OUR LOCAL STORAGE
  bool isLoggedIn() {
    final uid = prefs.getString("userID");
    return (uid ?? " ").isNotEmpty;
  }

//Customer controller******//

  Future<void> loginUser(
    BuildContext context,
    String email,
    password,
  ) async {
    var provider = Provider.of<App_state_controllers>(context, listen: false);
    provider.set_loader(true);
    try {
      final value = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // user login ho jata h to uska data firebase pe get kre
      if (value.user != null) {
        final snapshot =
            await firestore.collection("users").doc(value.user!.uid).get();
        prefs.setString("userID", value.user!.uid);
        _user_data =
            user_model.fromuser_basic_model(snapshot.data()!, value.user!.uid);

        // or user ko home page pe bhaj de
        Appservices.pushto(context, BottomBarScreen());
      }
    } catch (e) {
      //TO DO;; ERROR HANDLING
    } finally {
      provider.set_loader(false);
    }
  }

  // WHEN USER IS ALREADY LOGGED  IN
  Future<bool> reLoginUser(BuildContext context) async {
    var provider = Provider.of<App_state_controllers>(context, listen: false);
    provider.set_loader(true);
    final uid = prefs.getString("userID");
    bool isLogin = false;
    try {
      /// aager user(uid) hai to ya khali nhi h to data get kre
      if (uid != null && uid.isNotEmpty) {
        final localUser = await firestore.collection("users").doc(uid).get();
        if (localUser.exists) {
          print("wE ARE HERE");
          //  Save Data In Provider
          _user_data =
              user_model.fromuser_basic_model(localUser.data()!, localUser.id);
          isLogin = true;
        } else {
          print(
              '=====================================================dfgj22222222222;');
          // userr(uid) nhi h to login page per bhaj de
          Appservices.pushandremoveuntil(context, Login_page());

          prefs.remove("userID");
        }
      } else {
        print(
            '=====================================================dfgjkl111111111111;');
        // aager user(uid) nhi h ya khali h to bi user ko login bhaj pe bhajde

        Appservices.pushandremoveuntil(context, Login_page());
      }
    } catch (e) {
//  HANDLE FUNCTION ERRORS HERE.
    } finally {
      provider.set_loader(false);
    }
    return isLogin;
  }
}
