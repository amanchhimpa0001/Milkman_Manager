// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:milkman_manager_app/helpers/color_sheet.dart';

class CustomElevatedButton extends StatelessWidget {
  String btnName;
  Function onTap;
  Color? color;

  bool? loading;
  Color? bordercolor;

  bool isExpanded;
  Color foreground_clr;
  TextStyle? style;
  double? peddingh, peddingv;

  CustomElevatedButton(
      {this.isExpanded = false,
      this.peddingh = 10,
      this.peddingv = 14,
      this.loading = false,
      required this.btnName,
      required this.onTap,
      this.bordercolor = const Color.fromARGB(31, 249, 248, 248),
      this.color,
      this.style,
      this.foreground_clr = AppColors.blackColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    final btnexpended = Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    side: WidgetStatePropertyAll(
                        BorderSide(color: bordercolor!)),
                    padding: WidgetStateProperty.all(EdgeInsets.symmetric(
                      vertical: peddingv!,
                      horizontal: peddingh!,
                    )),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                    backgroundColor:
                        WidgetStateProperty.all(color ?? AppColors.primary),
                    foregroundColor: WidgetStateProperty.all(foreground_clr)),
                onPressed: () => onTap(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loading!
                        ? SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                              color: AppColors.whiteColor,
                            ))
                        : Text(
                            btnName,
                            style: style,
                            textAlign: TextAlign.center,
                          )
                  ],
                )),
          ),
        )
      ],
    );
    return isExpanded ? Expanded(child: btnexpended) : btnexpended;
  }
}
