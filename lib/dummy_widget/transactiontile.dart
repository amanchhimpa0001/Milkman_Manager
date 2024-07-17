import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/widget_model_dummy/transaction/transaction_model.dart';

// ignore: must_be_immutable
class Transaction_tile extends StatelessWidget {
  Transaction_tile({super.key, required this.data});
  Transaction_model data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.skyblue),
              child: Text(
                data.profilename,
                style:
                    GetTextTheme.fs12_bold.copyWith(color: AppColors.primary),
              ),
            ),
            Gap(10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Row(
                    children: [
                      Text(
                        data.name,
                        style: GetTextTheme.fs14_regular,
                      ),
                      Gap(10.h),
                      Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 2),
                          decoration: BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            data.payment,
                            style: GetTextTheme.fs10_regular
                                .copyWith(color: AppColors.whiteColor),
                          )),
                    ],
                  ),
                ),
                Gap(5.h),
                Text(
                  data.datetime,
                  style: GetTextTheme.fs10_medium,
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                data.transaction,
                style:
                    GetTextTheme.fs14_medium.copyWith(color: AppColors.green),
              ),
            )
          ],
        ),
      ],
    );
  }
}
