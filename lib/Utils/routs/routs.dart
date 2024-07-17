import 'package:flutter/material.dart';
import 'package:milkman_manager_app/Deshborad/Deshborad.dart';
import 'package:milkman_manager_app/Deshborad/receive_milk.dart';
import 'package:milkman_manager_app/Deshborad/sale_milk.dart';
import 'package:milkman_manager_app/Utils/routs/routs_name.dart';
import 'package:milkman_manager_app/authentication/login_page.dart';
import 'package:milkman_manager_app/authentication/sign_up.dart';
import 'package:milkman_manager_app/on_boarding/splash_page.dart';
import 'package:milkman_manager_app/view/setting_page/Business_page/ManagePricing.dart';
import 'package:milkman_manager_app/view/setting_page/Business_page/Transaction.dart';
import 'package:milkman_manager_app/view/setting_page/LegalandPolicies/PrivacyPolicy.dart';
import 'package:milkman_manager_app/view/setting_page/LegalandPolicies/help&support.dart';
import 'package:milkman_manager_app/view/setting_page/LegalandPolicies/terms&conditions.dart';
import 'package:milkman_manager_app/view/setting_page/Preferences/App_Language.dart';
import 'package:milkman_manager_app/view/setting_page/Preferences/NotificationSettings.dart';

class Routes {
  static MaterialPageRoute zgenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routesname.SplashScreenView:
        return MaterialPageRoute(builder: (context) => SplashScreenView());
      case Routesname.Login_page:
        return MaterialPageRoute(builder: (context) => Login_page());
      case Routesname.Sign_up_page:
        return MaterialPageRoute(builder: (context) => Sign_up_page());
      case Routesname.DashBorad:
        return MaterialPageRoute(builder: (context) => DashBorad());
      case Routesname.Receive_Milk:
        return MaterialPageRoute(builder: (context) => Receive_Milk());
      case Routesname.Sale_Milk:
        return MaterialPageRoute(builder: (context) => Sale_Milk());
      case Routesname.ManagePricing:
        return MaterialPageRoute(builder: (context) => ManagePricing());
      case Routesname.Transaction:
        return MaterialPageRoute(builder: (context) => Transaction());
      case Routesname.App_Language:
        return MaterialPageRoute(builder: (context) => App_Language());
      case Routesname.Notification_Settings:
        return MaterialPageRoute(builder: (context) => Notification_Settings());
      case Routesname.PrivacyPolicy:
        return MaterialPageRoute(builder: (context) => PrivacyPolicy());
      // ignore: unreachable_switch_case
      case Routesname.Notification_Settings:
        return MaterialPageRoute(builder: (context) => Notification_Settings());
      case Routesname.TermsConditions:
        return MaterialPageRoute(builder: (context) => TermsConditions());
      case Routesname.HelpSupport:
        return MaterialPageRoute(builder: (context) => HelpSupport());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Column(
              children: [Text("no route difined")],
            ),
          ),
        );
    }
  }
}
