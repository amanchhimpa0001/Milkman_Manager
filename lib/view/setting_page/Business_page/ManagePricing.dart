import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/componants/custum_elevated_btn.dart';
import 'package:milkman_manager_app/componants/textformfield.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';

class ManagePricing extends StatelessWidget {
  const ManagePricing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text(
          'Manage Pricing',
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
            Gap(10.h),
            Center(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.lightprimary),
                child: Column(
                  children: [
                    Text(
                      'Price Today',
                      style: GetTextTheme.fs14_regular,
                    ),
                    Text(
                      '₹ 72.00',
                      style: GetTextTheme.fs18_medium,
                    )
                  ],
                ),
              ),
            ),
            Gap(10.h),
            Text('Basic Fat Value', style: GetTextTheme.fs14_regular),
            Gap(10.h),
            leadinghideformfeild(
              hintText: '₹ 0.00',
              fillcolor: AppColors.tranceparent,
            ),
            Gap(10.h),
            Text('Basic Price', style: GetTextTheme.fs14_regular),
            Gap(10.h),
            leadinghideformfeild(
              hintText: '₹ 0.00',
              fillcolor: AppColors.tranceparent,
            ),
            Gap(10.h),
            Text('Price Per Additional Fat Percentage',
                style: GetTextTheme.fs14_regular),
            Gap(10.h),
            leadinghideformfeild(
              hintText: '₹ 0.00',
              fillcolor: AppColors.tranceparent,
            ),
            Gap(10.h),
            CustomElevatedButton(
              btnName: 'Update Price',
              onTap: () {},
              foreground_clr: AppColors.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
