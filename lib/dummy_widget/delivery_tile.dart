import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/widget_model_dummy/deliverymodel/delivery_model.dart';

// ignore: must_be_immutable
class Delivery_tile extends StatelessWidget {
  Delivery_tile({super.key, required this.deliverydata});
  Delivery_model deliverydata;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.lightorange),
            child: Text(
              deliverydata.shortname,
              style:
                  GetTextTheme.fs14_regular.copyWith(color: AppColors.orange),
            ),
          ),
          Gap(10.h),
          Text(
            deliverydata.name,
            style: GetTextTheme.fs14_medium,
          ),
          Gap(8.h),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: deliverydata.ltr,
                style: GetTextTheme.fs14_medium
                    .copyWith(color: AppColors.blackColor)),
            TextSpan(
                text: deliverydata.fat,
                style: GetTextTheme.fs14_regular
                    .copyWith(color: AppColors.greycolor)),
          ])),
          Gap(4.h),
          Text(
            deliverydata.address,
            style: GetTextTheme.fs10_medium,
          ),
          Gap(8.h),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 32, right: 32, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.lightprimary),
              child: Center(
                  child: Text(deliverydata.btnname,
                      style: GetTextTheme.fs14_medium)),
            ),
          )
        ],
      ),
    );
  }
}
