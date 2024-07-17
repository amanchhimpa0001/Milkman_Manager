import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/dummy_widget/transactiontile.dart';
import 'package:milkman_manager_app/helpers/app_config.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';

import '../../../helpers/text_theme.dart';
import '../../../widget_model_dummy/transaction/transaction_model.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text(
          'Transactions',
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              width: AppConfig.screenWidth,
              decoration: BoxDecoration(color: AppColors.textformfieldcolor),
              child: Text(
                "March 2024",
                style: GetTextTheme.fs16_regular,
              ),
            ),
            Gap(10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                shrinkWrap: true,
                itemCount: Transation_data.transationlist.length,
                itemBuilder: (context, index) => Transaction_tile(
                    data: Transation_data.transationlist[index]),
              ),
            ),
            Gap(10.h),
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              width: AppConfig.screenWidth,
              decoration: BoxDecoration(color: AppColors.textformfieldcolor),
              child: Text(
                "April 2024",
                style: GetTextTheme.fs16_regular,
              ),
            ),
            Gap(15.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                shrinkWrap: true,
                itemCount: Transation_data.aprilist.length,
                itemBuilder: (context, index) =>
                    Transaction_tile(data: Transation_data.aprilist[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
