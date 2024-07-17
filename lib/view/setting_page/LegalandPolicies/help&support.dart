import 'package:flutter/material.dart';
import 'package:milkman_manager_app/componants/exptiontile.dart';
import 'package:milkman_manager_app/helpers/all_icons.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.tranceparent,
        leadingWidth: 30,
        title: Text(
          'Help & Suppport',
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
      body: Column(
        children: [
          Iconexptiontile(
              imageicon: Appicons.customer,
              cardname: 'Customer Service',
              onPressed: () {}),
          Iconexptiontile(
              imageicon: Appicons.whatsapp,
              cardname: 'Whatsapp Support',
              onPressed: () {}),
          Iconexptiontile(
              imageicon: Appicons.accountdelete,
              cardname: 'Request Account Delete',
              onPressed: () {}),
          Iconexptiontile(
              imageicon: Appicons.info,
              cardname: 'App Info',
              icon: Icons.phone,
              onPressed: () {}),
        ],
      ),
    );
  }
}
