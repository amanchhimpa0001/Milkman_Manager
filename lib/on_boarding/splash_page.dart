import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/componants/navbar.dart';
import 'package:milkman_manager_app/controllers/Milk_controllers.dart';
import 'package:milkman_manager_app/controllers/all_controllers.dart';
import 'package:milkman_manager_app/controllers/customers_controllers.dart';
import 'package:milkman_manager_app/helpers/all_image.dart';
import 'package:milkman_manager_app/helpers/app_config.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:provider/provider.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override

//   _init(BuildContext context) async {
//     var email = prefs.getString("email") ?? '';

//     if (email.isEmpty) {
//       Appservices.pushto(context, Login_page());
//     } else {

//       Appservices.pushto(context, BottomBarScreen());
//     }
// }
  void initState() {
    initalState();
    super.initState();
  }

  initalState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final user = await Provider.of<AuthController>(context, listen: false)
          .reLoginUser(context);

      if (user) {
        await Provider.of<Add_Customers>(context, listen: false)
            .fetchcustomers(context);
        await Provider.of<Milk_controllers>(context, listen: false)
            .fetchreceivemilk(context);
        Appservices.pushandremoveuntil(context, BottomBarScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Getimage.splashimg), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: SizedBox()),
          Text(
            "MILKMAN’S\nMANAGER",
            style: GetTextTheme.fs35_bold.copyWith(color: AppColors.whiteColor),
          ),
          Gap(50.h),
          CircularProgressIndicator(
            color: AppColors.whiteColor,
          ),
          Expanded(child: SizedBox()),
          Image.asset(
            Getimage.cowimg,
          ),
          SizedBox(
            height: AppConfig.screenHeight * 0.12,
          ),
        ],
      ),
    ));
  }
}
