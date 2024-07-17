import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:milkman_manager_app/helpers/app_config.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';

class Btn_loader extends StatelessWidget {
  Btn_loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: AppConfig.screenHeight,
      width: AppConfig.screenWidth,
      child: Center(
        child: LoadingAnimationWidget.hexagonDots(
            color: AppColors.primary, size: 60),
      ),
    );
  }
}
