import 'package:flutter/material.dart';

import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';

// ignore: must_be_immutable
class exptiontilefuction extends StatelessWidget {
  String cardname;

  Function onPressed;

  exptiontilefuction(
      {super.key, required this.cardname, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        trailing: Icon(
          Icons.keyboard_arrow_right_sharp,
        ),
        title: Text(
          cardname,
          style: GetTextTheme.fs14_regular,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Iconexptiontile extends StatefulWidget {
  String cardname;
  IconData? icon;
  String? imageicon;
  Function onPressed;
  Color? color;
  Iconexptiontile(
      {super.key,
      this.color,
      this.imageicon,
      required this.cardname,
      this.icon,
      required this.onPressed});

  @override
  State<Iconexptiontile> createState() => _IconexptiontileState();
}

class _IconexptiontileState extends State<Iconexptiontile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed(),
      child: ListTile(
        leading: widget.icon != null
            ? Icon(
                widget.icon,
              )
            : (widget.imageicon != null)
                ? Image.asset(
                    widget.imageicon!,
                    scale: 2.8,
                  )
                : SizedBox(),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 16,
          color: AppColors.greycolor,
        ),
        title: Text(
          widget.cardname,
          style: GetTextTheme.fs14_regular,
        ),
      ),
    );
  }
}
