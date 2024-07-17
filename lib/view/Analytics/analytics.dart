import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/componants/tittlebar.dart';
import 'package:milkman_manager_app/dummy_widget/MilkVariants_widget.dart';
import 'package:milkman_manager_app/dummy_widget/dailymilkflow_tile.dart';
import 'package:milkman_manager_app/helpers/app_config.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/widget_model_dummy/Milkmodel/milk_model.dart';
import 'package:milkman_manager_app/view/Analytics/carts.dart';

class Analytics_page extends StatelessWidget {
  const Analytics_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: AppConfig.screenWidth,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.lightprimary),
                        child: Column(
                          children: [
                            Text(
                              "Debtors",
                              style: GetTextTheme.fs12_regular,
                            ),
                            Gap(10.h),
                            Text(
                              "₹ 16,860.00",
                              style: GetTextTheme.fs18_medium
                                  .copyWith(color: AppColors.green),
                            ),
                            Divider(
                              color: AppColors.green,
                            ),
                            Text(
                              "View All",
                              style: GetTextTheme.fs12_regular
                                  .copyWith(color: AppColors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(10.h),
                    Expanded(
                      child: Container(
                        width: AppConfig.screenWidth,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.lightorange),
                        child: Column(
                          children: [
                            Text(
                              "Debtors",
                              style: GetTextTheme.fs12_regular,
                            ),
                            Gap(10.h),
                            Text(
                              "₹ 16,860.00",
                              style: GetTextTheme.fs18_medium
                                  .copyWith(color: AppColors.darkred),
                            ),
                            Divider(
                              color: AppColors.darkred,
                            ),
                            Text(
                              "View All",
                              style: GetTextTheme.fs12_regular
                                  .copyWith(color: AppColors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Comparison View",
                  style: GetTextTheme.fs14_regular,
                ),
              ),
              LineChartSample7(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: Image.asset(Getimage.graphimg),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: tittlebar(
                    ontap: () {},
                    tittle: "Daily Milk Flow",
                    btnname: "March 2024",
                    tittlecolor: AppColors.blackColor),
              ),
              Gap(15.h),
              SizedBox(
                height: AppConfig.screenHeight / 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: Milkmodel_helper.dailymilkflowlist.length,
                    itemBuilder: (context, index) => DailyMilkFlow_tile(
                        data: Milkmodel_helper.dailymilkflowlist[index]),
                  ),
                ),
              ),
              Gap(10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: tittlebar(
                    ontap: () {},
                    tittle: "Milk Variants Chart",
                    btnname: "March 2024",
                    tittlecolor: AppColors.blackColor),
              ),
              Gap(10.h),
              SizedBox(
                height: AppConfig.screenHeight / 3.8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: Milkmodel_helper.MilkVariantsChartlist.length,
                    itemBuilder: (context, index) => MilkVariantsChart(
                        data: Milkmodel_helper.MilkVariantsChartlist[index]),
                  ),
                ),
              ),
              Gap(10.h)
            ],
          ),
        ),
      ),
    );
  }
}
