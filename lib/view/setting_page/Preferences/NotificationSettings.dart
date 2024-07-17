import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';

class Notification_Settings extends StatefulWidget {
  const Notification_Settings({super.key});

  @override
  State<Notification_Settings> createState() => _Notification_SettingsState();
}

class _Notification_SettingsState extends State<Notification_Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text(
          'Notification Settings',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set notification menually',
              style: GetTextTheme.fs14_regular
                  .copyWith(color: AppColors.greycolor),
            ),
            Common_switch_tile(title: "Do Not Disturb", boolvalue: false),
            Gap(10.h),
            Text(
              'Set notification menually',
              style: GetTextTheme.fs14_regular
                  .copyWith(color: AppColors.greycolor),
            ),
            Gap(10.h),
            Common_switch_tile(title: "Notification Sound", boolvalue: false),
            Common_switch_tile(
                title: "Notification Vibration", boolvalue: false),
            Common_switch_tile(
                title: "Transaction Notification", boolvalue: false),
            Common_switch_tile(title: "Offer Notification", boolvalue: false),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Common_switch_tile extends StatefulWidget {
  String title;

  bool boolvalue;

  Common_switch_tile({
    super.key,
    required this.title,
    required this.boolvalue,
  });

  @override
  State<Common_switch_tile> createState() => _Common_switch_tileState();
}

class _Common_switch_tileState extends State<Common_switch_tile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(widget.title, style: GetTextTheme.fs16_regular),
      trailing: Transform.scale(
        scale: 0.7,
        child: Switch.adaptive(
            trackOutlineColor:
                const WidgetStatePropertyAll(Colors.transparent),
            activeTrackColor: AppColors.orange,
            value: widget.boolvalue,
            activeColor: AppColors.whiteColor,
            inactiveThumbColor: AppColors.whiteColor,
            inactiveTrackColor: AppColors.grey,
            onChanged: (newvalue) {
              setState(() {
                widget.boolvalue = newvalue;
              });
            }),
      ),
    );
  }
}
