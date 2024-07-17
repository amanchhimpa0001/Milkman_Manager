import 'package:flutter/material.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';

import 'package:milkman_manager_app/helpers/text_theme.dart';

// ignore: must_be_immutable
class tittlebar extends StatelessWidget {
  String tittle, btnname;
  Color tittlecolor;
  Function? ontap;
  tittlebar(
      {super.key,
      this.ontap,
      required this.tittle,
      required this.btnname,
      required this.tittlecolor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tittle,
                style: GetTextTheme.fs16_regular.copyWith(color: tittlecolor),
              ),
            ],
          ),
        ),
        InkWell(
          hoverColor: AppColors.tranceparent,
          splashColor: AppColors.tranceparent,
          highlightColor: AppColors.tranceparent,
          onTap: () => ontap!(),
          child: Text(btnname,
              style: GetTextTheme.fs16_regular.copyWith(color: AppColors.blue)),
        )
        // GestureDetector(
        //
        //   child:
        // ),
      ],
    );
  }
}
