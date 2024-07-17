import 'package:flutter/material.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';

// ignore: must_be_immutable
class Radio_fun extends StatefulWidget {
  String text;
  final Function(String)? onDone;

  String value;
  Radio_fun({
    super.key,
    required this.text,
    this.onDone,
    this.value = "",
  });

  @override
  State<Radio_fun> createState() => _Radio_funState();
}

class _Radio_funState extends State<Radio_fun> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onDone;
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 0,
        title: Text(
          widget.text,
          style: GetTextTheme.fs14_regular,
        ),
        leading: Radio(
          value: widget.text,
          activeColor: AppColors.blackColor,
          groupValue: widget.value,
          onChanged: (value) {
            widget.onDone != null ? widget.onDone!(value.toString()) : null;
          },
        ),
      ),
    );
  }
}
