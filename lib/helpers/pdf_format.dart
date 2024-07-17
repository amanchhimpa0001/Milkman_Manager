import 'package:flutter/material.dart';

import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';

class pdf extends StatelessWidget {
  const pdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'INVOICE',
                        style: GetTextTheme.fs20_medium,
                      ),
                      Text(
                        '#0001',
                        style: GetTextTheme.fs16_medium,
                      ),
                      Text(
                        'Bill Date : 01-01-2024',
                        style: GetTextTheme.fs10_medium,
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jordan Milk Dairy',
                          style: GetTextTheme.fs16_medium,
                        ),
                        Appservices.addheight(10),
                        Text(
                          '#01, Talaki Gate, Near Bus Stand,\nRishi Nagar, Hisar (Haryana)',
                          style: GetTextTheme.fs10_regular,
                        ),
                        Appservices.addheight(10),
                        Text(
                          '+91 - 890*****11',
                          style: GetTextTheme.fs10_regular,
                        ),
                        Appservices.addheight(10),
                        Text(
                          'Bill Duration : 01 Dec to 31 Mar',
                          style: GetTextTheme.fs10_regular
                              .copyWith(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Bill To:',
                          style: GetTextTheme.fs10_medium,
                        ),
                        Appservices.addheight(10),
                        Text(
                          'Will Smith',
                          style: GetTextTheme.fs14_medium,
                        ),
                        Appservices.addheight(10),
                        Text(
                          '#1230, Sector-14, Opp Shopping Complex, Hisar (Haryana)',
                          style: GetTextTheme.fs10_regular,
                          textAlign: TextAlign.end,
                        ),
                        Appservices.addheight(10),
                        Text(
                          '+91 - 890*****11',
                          style: GetTextTheme.fs10_regular,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Appservices.addheight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/scner.png",
                          scale: 3,
                        ),
                        Text(
                          "Scan the QR Code to make UPI payment.",
                          style: GetTextTheme.fs10_regular,
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sub Total:",
                        style: GetTextTheme.fs10_regular,
                      ),
                      Text(
                        "Previous Balance:",
                        style: GetTextTheme.fs10_regular,
                      ),
                      Text(
                        "Grand Total:",
                        style: GetTextTheme.fs10_medium,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹ 4,030.00",
                        style: GetTextTheme.fs10_regular,
                      ),
                      Text(
                        "₹ 3,030.00",
                        style: GetTextTheme.fs10_regular,
                      ),
                      Text(
                        "₹ 7,210.00",
                        style: GetTextTheme.fs10_medium,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
