import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/widget_model_dummy/Milkmodel/milk_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: must_be_immutable
class MilkVariantsChart extends StatelessWidget {
  MilkVariantsChart({super.key, required this.data});
  Milk_model data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: AppColors.greycolor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gap(10.h),
            CircularPercentIndicator(
              radius: 60.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 8.0,
              percent: 0.6,
              center: new Text(
                data.milk,
                style: GetTextTheme.fs16_medium,
                textAlign: TextAlign.center,
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: AppColors.primary,
              progressColor: AppColors.orange,
            ),
            Gap(5.h),
            RichText(
              text: TextSpan(
                  text: "Total : ",
                  style: GetTextTheme.fs16_medium
                      .copyWith(color: AppColors.blackColor),
                  children: [TextSpan(text: data.totallter)]),
            ),
            Gap(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(data.delivery, style: GetTextTheme.fs12_medium),
                    Text(
                      data.deliveryltr,
                      style: GetTextTheme.fs14_regular
                          .copyWith(color: AppColors.greycolor),
                    ),
                  ],
                ),
                Gap(40.h),
                Column(
                  children: [
                    Text(data.sale, style: GetTextTheme.fs12_medium),
                    Text(
                      data.saleltr,
                      style: GetTextTheme.fs14_regular
                          .copyWith(color: AppColors.greycolor),
                    ),
                  ],
                ),
              ],
            ),
            // Container(
            //   width: AppConfig.screenWidth,
            //   height: 2,
            //   decoration: BoxDecoration(color: AppColors.blue),
            // ),
            Gap(10.h),
          ],
        ),
      ),
    );
  }
}
