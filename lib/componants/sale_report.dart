import 'package:flutter/material.dart';
import 'package:milkman_manager_app/componants/radio_fun.dart';
import 'package:milkman_manager_app/componants/textformfield.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';

import '../helpers/color_sheet.dart';

class Sale_Report_dailog extends StatefulWidget {
  const Sale_Report_dailog({super.key});

  @override
  State<Sale_Report_dailog> createState() => _Sale_Report_dailogState();
}

class _Sale_Report_dailogState extends State<Sale_Report_dailog> {
  final TextEditingController datemonthyear = TextEditingController();
  String selectedCustomDate = "";
  String selectedCurrentWeek = "";
  String SelectCurrentMonth = "";
  String DeliveryBetweenDates = "";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sale Report',
              style: GetTextTheme.fs24_medium,
            ),
            Radio_fun(
              text: 'Custom Date',
              onDone: (p0) {
                setState(() {
                  selectedCustomDate = p0;
                });
              },
              value: selectedCustomDate,
            ),
            Customtextformfilled(
              prifixicon: Icons.calendar_month,
              hintText: "dd/mm/yyyy",
              controller: datemonthyear,
              style: GetTextTheme.fs14_regular.copyWith(color: AppColors.grey),
              fillcolor: AppColors.tranceparent,
            ),
            Radio_fun(
              text: 'Current Week',
              onDone: (p0) {
                setState(() {
                  selectedCurrentWeek = p0;
                });
              },
              value: selectedCurrentWeek,
            ),
            Radio_fun(
              text: 'Current Month',
              onDone: (p0) {
                setState(() {
                  SelectCurrentMonth = p0;
                });
              },
              value: SelectCurrentMonth,
            ),
            Radio_fun(
              text: 'Between Dates',
              onDone: (p0) {
                setState(() {
                  DeliveryBetweenDates = p0;
                });
              },
              value: DeliveryBetweenDates,
            ),
          ],
        ),
      ),
    );
  }
}
