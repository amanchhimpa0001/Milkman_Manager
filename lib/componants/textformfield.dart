import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:milkman_manager_app/helpers/color_sheet.dart';

import '../helpers/text_theme.dart';

// ignore: must_be_immutable
class Customtextformfilled extends StatefulWidget {
  TextEditingController? controller;
  IconData? icon;
  IconData? prifixicon;
  String? imageicon;
  Icon? icons;
  bool darkHint;
  Function? onSufixPressed;
  bool isExpanded;
  String? hintText;
  Function(String?)? validator;
  bool obsecure;
  Color? fillcolor;
  Function(String?)? onchange;
  TextStyle? style;
  TextInputType? Keyboradtype;
  int? maxlength;

  Customtextformfilled(
      {super.key,
      this.icon,
      this.imageicon,
      this.prifixicon,
      this.isExpanded = false,
      this.onSufixPressed,
      this.darkHint = false,
      this.obsecure = false,
      this.controller,
      this.hintText,
      this.onchange,
      this.validator,
      this.style,
      this.fillcolor,
      this.Keyboradtype,
      this.maxlength});

  @override
  State<Customtextformfilled> createState() => _CustomtextformfilledState();
}

class _CustomtextformfilledState extends State<Customtextformfilled> {
  @override
  Widget build(BuildContext context) {
    final textfield = TextFormField(
        maxLength: widget.maxlength,
        keyboardType: widget.Keyboradtype,
        style: GetTextTheme.fs12_medium.copyWith(color: AppColors.greycolor),
        controller: widget.controller,
        obscureText: widget.obsecure,
        onChanged: widget.onchange,
        validator: widget.validator == null
            ? null
            : (value) => widget.validator!(value),
        decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillcolor,
            hintText: widget.hintText,
            hintStyle: widget.style,
            prefixIcon: widget.prifixicon != null
                ? Icon(
                    widget.prifixicon,
                  )
                : (widget.imageicon != null)
                    ? Image.asset(
                        widget.imageicon!,
                        scale: 2.8,
                      )
                    : SizedBox(),
            suffixIcon: IconButton(
                color: AppColors.greyscale,
                onPressed: widget.onSufixPressed != null
                    ? () => widget.onSufixPressed!()
                    : null,
                icon: Icon(
                  widget.icon,
                  color: AppColors.grey,
                )),
            contentPadding:
                EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: AppColors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 219, 217, 217),
                    width: 1.5))));
    return widget.isExpanded ? Expanded(child: textfield) : textfield;
  }
}

// ignore: must_be_immutable
class leadinghideformfeild extends StatefulWidget {
  TextEditingController? controller;
  IconData? icon;

  String? imageicon;
  bool darkHint;
  Function? onSufixPressed;
  bool isExpanded;
  String? hintText;
  Function(String?)? validator;
  bool obsecure;
  Color? fillcolor;
  Function(String?)? onchange;
  TextStyle? style;

  leadinghideformfeild({
    super.key,
    this.icon,
    this.imageicon,
    this.isExpanded = false,
    this.onSufixPressed,
    this.darkHint = false,
    this.obsecure = false,
    this.controller,
    this.hintText,
    this.onchange,
    this.validator,
    this.style,
    this.fillcolor,
  });

  @override
  State<leadinghideformfeild> createState() => _leadinghideformfeildState();
}

class _leadinghideformfeildState extends State<leadinghideformfeild> {
  Icon? icons;

  @override
  Widget build(BuildContext context) {
    final textfield = TextFormField(
        style: GetTextTheme.fs12_medium.copyWith(color: AppColors.greycolor),
        controller: widget.controller,
        obscureText: widget.obsecure,
        onChanged: widget.onchange,
        validator: widget.validator == null
            ? null
            : (value) => widget.validator!(value),
        decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillcolor,
            hintText: widget.hintText,
            hintStyle: widget.style,
            suffixIcon: IconButton(
                color: AppColors.greyscale,
                onPressed: widget.onSufixPressed != null
                    ? () => widget.onSufixPressed!()
                    : null,
                icon: Icon(
                  widget.icon,
                  color: AppColors.greycolor,
                )),
            contentPadding:
                EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 219, 217, 217),
                    width: 1.5))));
    return widget.isExpanded ? Expanded(child: textfield) : textfield;
  }
}
