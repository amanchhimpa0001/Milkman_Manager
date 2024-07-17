import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/Utils/routs/routs_name.dart';
import 'package:milkman_manager_app/componants/exptiontile.dart';
import 'package:milkman_manager_app/componants/textformfield.dart';
import 'package:milkman_manager_app/controllers/all_controllers.dart';
import 'package:milkman_manager_app/controllers/authcontrollers.dart';
import 'package:milkman_manager_app/helpers/all_image.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/view/My_Clients.dart/my_clients.dart';
import 'package:milkman_manager_app/view/setting_page/user_account.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthController>(
      context,
    );
    print("===============================");
    print(provider.getuser_data.image);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Settings",
                  style: GetTextTheme.fs24_regular,
                ),
                Gap(10.h),
                leadinghideformfeild(
                  icon: Icons.search,
                  hintText: "Search...",
                  style: GetTextTheme.fs12_regular,
                  fillcolor: AppColors.tranceparent,
                ),
                Gap(10.h),
                Text(
                  "User Account",
                  style: GetTextTheme.fs16_regular
                      .copyWith(color: AppColors.primary),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          onTap: () {
                            Appservices.pushto(context, User_Account());
                          },
                          leading: Consumer<AuthController>(
                            builder: (snap, d, c) {
                              return GestureDetector(
                                  onTap: () async {},
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(1000),
                                      child: (d.getuser_data.image != null ||
                                                  d.getuser_data.image!
                                                      .isNotEmpty) &&
                                              d.getuser_data.image!
                                                  .startsWith('http')
                                          ? Image.network(
                                              d.getuser_data.image!,
                                              height: 60,
                                              width: 60,
                                              fit: BoxFit.cover,
                                            )
                                          : d.getuser_data.image!
                                                  .startsWith('file')
                                              ? Image.file(
                                                  File(d.getuser_data.image!))
                                              : Image.asset(
                                                  Getimage.profileimg)));
                            },
                          ),
                          title: Text(
                            provider.getuser_data.fullname.toString(),
                            style: GetTextTheme.fs14_medium,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.getuser_data.email.toString(),
                                style: GetTextTheme.fs12_regular,
                              ),
                              Gap(5),
                            ],
                          ),
                          trailing: CircularPercentIndicator(
                            radius: 25.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.7,
                            center: new Text(
                              "70%",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10.0),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.green,
                          )),
                    ),
                    Gap(15),
                    Icon(Icons.keyboard_arrow_right_rounded)
                  ],
                ),
                Text(
                  "Business Account",
                  style: GetTextTheme.fs16_regular
                      .copyWith(color: AppColors.primary),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          onTap: () {},
                          leading: Image.asset(Getimage.homeimg),
                          title: Text(
                            "${provider.getuser_data.fullname} Milk Dairy",
                            style: GetTextTheme.fs14_medium,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.getuser_data.business_address
                                    .toString(),
                                style: GetTextTheme.fs12_regular,
                              ),
                              Gap(5),
                            ],
                          ),
                          trailing: CircularPercentIndicator(
                            radius: 25.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.5,
                            center: new Text(
                              "60%",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10.0),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.green,
                          )),
                    ),
                    Gap(15.h),
                    Icon(Icons.keyboard_arrow_right_rounded)
                  ],
                ),
                Text(
                  "Business Operations",
                  style: GetTextTheme.fs16_regular
                      .copyWith(color: AppColors.primary),
                ),
                exptiontilefuction(
                    cardname: 'Manage Pricing',
                    onPressed: () {
                      Navigator.pushNamed(context, Routesname.ManagePricing);
                    }),
                exptiontilefuction(
                    cardname: 'My Customers',
                    onPressed: () {
                      Appservices.pushto(context, MyClients_Buyer());
                    }),
                exptiontilefuction(
                    cardname: 'Transactions',
                    onPressed: () {
                      Navigator.pushNamed(context, Routesname.Transaction);
                    }),
                Text(
                  "Preferences",
                  style: GetTextTheme.fs16_regular
                      .copyWith(color: AppColors.primary),
                ),
                exptiontilefuction(
                    cardname: 'Notification Settings',
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routesname.Notification_Settings);
                    }),
                exptiontilefuction(
                    cardname: 'App Language',
                    onPressed: () {
                      Navigator.pushNamed(context, Routesname.App_Language);
                    }),
                Text(
                  "Legal and Policies",
                  style: GetTextTheme.fs16_regular
                      .copyWith(color: AppColors.primary),
                ),
                exptiontilefuction(
                  cardname: 'Privacy Policy',
                  onPressed: () {
                    Navigator.pushNamed(context, Routesname.PrivacyPolicy);
                  },
                ),
                exptiontilefuction(
                    cardname: 'Terms & Conditions',
                    onPressed: () {
                      Navigator.pushNamed(context, Routesname.TermsConditions);
                    }),
                exptiontilefuction(
                    cardname: 'Help & Support',
                    onPressed: () {
                      Navigator.pushNamed(context, Routesname.HelpSupport);
                    }),
                Padding(
                  padding: const EdgeInsets.only(right: 23),
                  child: GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Refer & Earn',
                        style: GetTextTheme.fs14_regular,
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => Dialog(
                          insetPadding: EdgeInsets.symmetric(
                            horizontal: 40,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: AppColors.whiteColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Appservices.goback(context);
                                  },
                                  child: Text(
                                    "Cancal",
                                    style: GetTextTheme.fs16_regular,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await AllFuntion(provider, context)
                                        .logoutUser(context);
                                  },
                                  child: Text(
                                    "OK",
                                    style: GetTextTheme.fs16_regular
                                        .copyWith(color: AppColors.darkred),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Logout',
                        style: GetTextTheme.fs14_regular
                            .copyWith(color: AppColors.darkred),
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_right_rounded)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
          //  onTap: () async {
          //     // await AllFuntion(provider, context).uploadFile(imageFile!);
          //     if (imageFile == null) {
          //       if (image.isEmpty) {
          //         await AllFuntion(provider, context).uploadimg(imageFile!);
          //       } else {
          //         await AllFuntion(provider, context).updateimg(
          //           image,
          //           imageFile!,
          //         );
          //       }
          //       provider.updateProfileImage(image);
          //       await provider.getuser_data.copyWith(image: image);
          //     }
          //   }


          //  imageFile == null
          //           ? (image.isEmpty
          //               ? Container(
          //                 child: Image.asset(
          //                     Getimage.profileimg,
          //                     fit: BoxFit.cover,
          //                   ),
          //               )
          //               : Image.network(
          //                   image,
          //                   fit: BoxFit.cover,
          //                 ))
          //           : Image.file(
          //               imageFile!,
          //               fit: BoxFit.cover,
          //             ),