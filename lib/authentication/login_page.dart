import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';
import 'package:milkman_manager_app/Utils/routs/routs_name.dart';
import 'package:milkman_manager_app/componants/custum_elevated_btn.dart';
import 'package:milkman_manager_app/componants/textformfield.dart';
import 'package:milkman_manager_app/controllers/all_controllers.dart';
import 'package:milkman_manager_app/controllers/app_state.dart';
import 'package:milkman_manager_app/helpers/all_image.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';

import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/helpers/text_validotor.dart';
import 'package:milkman_manager_app/loaders/btn_loaders.dart';
import 'package:provider/provider.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  var _passwordVisible = false;

  bool isChecked = false;
  bool colorchange = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthController>(context);
    var loading_state = Provider.of<App_state_controllers>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: loading_state.get_loader
          ? Center(child: Btn_loader())
          : Form(
              key: _formKey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Getimage.login_background),
                        fit: BoxFit.cover)),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(40.h),
                        Image.asset(
                          Getimage.cowimg,
                          scale: 2,
                        ),
                        Gap(90.h),
                        Text(
                          "Let’s Login",
                          style: GetTextTheme.fs22_medium,
                        ),
                        Gap(40.h),
                        Customtextformfilled(
                          validator: (value) =>
                              TextValidatioinController.isEmail(value),
                          prifixicon: Icons.person_2_outlined,
                          controller: _emailController,
                          hintText: "Username",
                          style: GetTextTheme.fs14_regular
                              .copyWith(color: AppColors.grey),
                          fillcolor: AppColors.whiteColor,
                        ),
                        Gap(20.h),
                        Customtextformfilled(
                          validator: (value) =>
                              TextValidatioinController.isPassword(value),
                          obsecure: _passwordVisible,
                          prifixicon: Icons.lock_outlined,
                          controller: _passwordController,
                          onSufixPressed: () => setState(
                              () => _passwordVisible = !_passwordVisible),
                          icon: _passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          hintText: "***********",
                          style: GetTextTheme.fs14_regular
                              .copyWith(color: AppColors.grey),
                          fillcolor: AppColors.whiteColor,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot password?",
                              style: GetTextTheme.fs14_regular
                                  .copyWith(color: AppColors.blackColor),
                            ),
                          ),
                        ),
                        CheckboxListTile.adaptive(
                          checkColor: Colors.black,
                          activeColor: Colors.white,
                          side: WidgetStateBorderSide.resolveWith((states) {
                            if (states.contains(WidgetState.pressed)) {
                              return BorderSide(color: Colors.black);
                            } else {
                              return BorderSide(color: Colors.black, width: 2);
                            }
                          }),
                          value: colorchange,
                          checkboxShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          visualDensity: VisualDensity(horizontal: -4),
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "By Logging in you agreed ",
                                style: GetTextTheme.fs14_regular
                                    .copyWith(color: AppColors.blackColor)),
                            TextSpan(
                                text:
                                    "to our terms of services and privacy policy",
                                style: GetTextTheme.fs14_medium
                                    .copyWith(color: AppColors.blackColor)),
                          ])),
                          onChanged: (value) => setState(() {
                            colorchange = value!;
                          }),
                        ),
                        CustomElevatedButton(
                            peddingv: 16,
                            foreground_clr: AppColors.whiteColor,
                            btnName: "Login",
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                if (colorchange == true) {
                                  await auth.loginUser(
                                    context,
                                    _emailController.text,
                                    _passwordController.text,
                                  );
                                }
                              }
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don’t have an account ?",
                                style: GetTextTheme.fs12_medium),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routesname.Sign_up_page);
                                },
                                child: Text("Sign up",
                                    style: GetTextTheme.fs12_bold
                                        .copyWith(color: AppColors.primary)))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    ));
  }
}
