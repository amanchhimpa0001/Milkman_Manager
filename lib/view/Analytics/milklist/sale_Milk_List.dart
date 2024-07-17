import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/componants/sale_report.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';

class SaleMilkList extends StatelessWidget {
  const SaleMilkList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        title: Text(
          "Milk Sale Chart",
          style: GetTextTheme.fs24_medium,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Sale_Report_dailog(),
              );
            },
            child: Text(
              "Download\nReport",
              style: GetTextTheme.fs12_regular.copyWith(color: AppColors.blue),
              textAlign: TextAlign.center,
            ),
          ),
          Appservices.addWidth(15)
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                //selectedDate the new date selected.
              },
              activeColor: const Color(0xffF8EDE2),
              headerProps: const EasyHeaderProps(
                dateFormatter: DateFormatter.monthOnly(),
              ),
              dayProps: const EasyDayProps(
                // height: 56.0,
                // width: 56.0,
                dayStructure: DayStructure.dayNumDayStr,
                inactiveDayStyle: DayStyle(
                  decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                          BorderSide(color: AppColors.greycolor))),
                  borderRadius: 26.0,
                  dayNumStyle: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                activeDayStyle: DayStyle(
                  dayNumStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Gap(10.h),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "53.6 Ltr",
                        style: GetTextTheme.fs20_medium
                            .copyWith(color: AppColors.whiteColor),
                      ),
                      Text(
                        "Total Milk",
                        style: GetTextTheme.fs10_regular
                            .copyWith(color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "₹ 3112.00",
                        style: GetTextTheme.fs20_medium
                            .copyWith(color: AppColors.whiteColor),
                      ),
                      Text(
                        "Total Bill",
                        style: GetTextTheme.fs10_regular
                            .copyWith(color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(10.h),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "John Smith",
                  style: GetTextTheme.fs14_medium
                      .copyWith(color: AppColors.blackColor)),
              TextSpan(
                  text: ", #3, New Rishi Nagar, Hisar",
                  style: GetTextTheme.fs14_regular
                      .copyWith(color: AppColors.greycolor)),
            ])),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Cattle',
                        style: GetTextTheme.fs14_regular
                            .copyWith(color: AppColors.greycolor),
                      ),
                      Text(
                        'Cow',
                        style: GetTextTheme.fs16_medium,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Fat',
                        style: GetTextTheme.fs14_regular
                            .copyWith(color: AppColors.greycolor),
                      ),
                      Text(
                        '60%',
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
                      Text(
                        '₹58',
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
                      Text(
                        '2 L',
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
                      Text(
                        '₹ 116',
                        style: GetTextTheme.fs16_medium
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(10.h),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Jordan Milk Dairy",
                  style: GetTextTheme.fs14_medium
                      .copyWith(color: AppColors.blackColor)),
              TextSpan(
                  text: ", #3, New Rishi Nagar, Hisar",
                  style: GetTextTheme.fs14_regular
                      .copyWith(color: AppColors.greycolor)),
            ])),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Cattle',
                        style: GetTextTheme.fs14_regular
                            .copyWith(color: AppColors.greycolor),
                      ),
                      Text(
                        'Buffalo',
                        style: GetTextTheme.fs16_medium,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Fat',
                        style: GetTextTheme.fs14_regular
                            .copyWith(color: AppColors.greycolor),
                      ),
                      Text(
                        '60%',
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
                      Text(
                        '₹58',
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
                      Text(
                        '2 L',
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
                      Text(
                        '₹ 116',
                        style: GetTextTheme.fs16_medium
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
