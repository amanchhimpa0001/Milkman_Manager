import 'package:flutter/material.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/view/setting_page/Preferences/NotificationSettings.dart';

class App_Language extends StatefulWidget {
  const App_Language({super.key});

  @override
  State<App_Language> createState() => _App_LanguageState();
}

class _App_LanguageState extends State<App_Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text(
          'App Language ',
          style: GetTextTheme.fs16_regular,
        ),
        leading: IconButton(
            onPressed: () {
              Appservices.goback(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 30,
            )),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SafeArea(
              child: Column(
            children: [
              Common_switch_tile(title: "Hindi", boolvalue: false),
              Common_switch_tile(title: "English", boolvalue: false),
            ],
          ))),
    );
  }
}
