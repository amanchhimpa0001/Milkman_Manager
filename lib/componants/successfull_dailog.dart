import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/componants/custum_elevated_btn.dart';
import 'package:milkman_manager_app/componants/navbar.dart';
import 'package:milkman_manager_app/helpers/all_image.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';

class Registration_successful_dailog extends StatefulWidget {
  const Registration_successful_dailog({super.key});

  @override
  State<Registration_successful_dailog> createState() =>
      _Registration_successful_dailogState();
}

class _Registration_successful_dailogState
    extends State<Registration_successful_dailog> {
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(20.h),
            Image.asset(
              Getimage.successful,
              scale: 3,
            ),
            Gap(10.h),
            Center(
              child: Text(
                'Registration Successful',
                style: GetTextTheme.fs24_medium,
                textAlign: TextAlign.center,
              ),
            ),
            Gap(10.h),
            Text(
              'You can now use the application.',
              style: GetTextTheme.fs14_regular
                  .copyWith(color: AppColors.blackColor),
            ),
            Gap(10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomElevatedButton(
                  peddingv: 15,
                  foreground_clr: AppColors.whiteColor,
                  btnName: 'Next',
                  onTap: () async {
                    Appservices.pushto(context, BottomBarScreen());
                    // var loginaccount = {
                    //   'email': _emailController,
                    //   'password': _passwordController
                    // };

                    // await AuthController().loginUser(context, loginaccount);
                  }),
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
