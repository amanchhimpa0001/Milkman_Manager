import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/model/milk_model.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Today_Milk_tile extends StatefulWidget {
  Today_Milk_tile({super.key, required this.data});
  MilkModel data;

  @override
  State<Today_Milk_tile> createState() => _Today_Milk_tileState();
}

class _Today_Milk_tileState extends State<Today_Milk_tile> {
  List<DateTime> MonthList() {
    List<DateTime> data = [];
    DateTime now = DateTime.now();
    for (var i = 0; i < 30; i++) {
      DateTime Month = now.subtract(Duration(days: i));
      data.add(Month);
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 56,
            width: 46,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.primary)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat("EE").format(
                      DateTime.parse(widget.data.createdate.toString())),
                  style:
                      GetTextTheme.fs14_regular.copyWith(color: AppColors.grey),
                ),
                Gap(10),
                Text(
                  DateFormat('d').format(
                      DateTime.parse(widget.data.createdate.toString())),
                  style: GetTextTheme.fs16_regular
                      .copyWith(color: AppColors.darkgrey),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'Fat',
                style: GetTextTheme.fs14_regular
                    .copyWith(color: AppColors.greycolor),
              ),
              Gap(10.h),
              Text(
                widget.data.fat.toString(),
                style: GetTextTheme.fs16_medium,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Rate',
                style: GetTextTheme.fs14_regular
                    .copyWith(color: AppColors.greycolor),
              ),
              Gap(10.h),
              Text(
                widget.data.Rate.toString(),
                style: GetTextTheme.fs16_medium,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Qty',
                style: GetTextTheme.fs14_regular
                    .copyWith(color: AppColors.greycolor),
              ),
              Gap(10.h),
              Text(
                widget.data.Quantity.toString(),
                style: GetTextTheme.fs16_medium,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Total',
                style: GetTextTheme.fs14_regular
                    .copyWith(color: AppColors.greycolor),
              ),
              Gap(10.h),
              Text(
                "ss",
                style:
                    GetTextTheme.fs16_medium.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
