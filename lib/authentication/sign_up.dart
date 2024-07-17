import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/Utils/routs/routs_name.dart';
import 'package:milkman_manager_app/componants/custum_elevated_btn.dart';
import 'package:milkman_manager_app/componants/radio_fun.dart';
import 'package:milkman_manager_app/componants/successfull_dailog.dart';
import 'package:milkman_manager_app/componants/textformfield.dart';
import 'package:milkman_manager_app/controllers/all_controllers.dart';
import 'package:milkman_manager_app/controllers/app_state.dart';
import 'package:milkman_manager_app/controllers/authcontrollers.dart';
import 'package:milkman_manager_app/helpers/all_icons.dart';

import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/helpers/text_validotor.dart';
import 'package:milkman_manager_app/loaders/btn_loaders.dart';
import 'package:milkman_manager_app/model/user_model.dart';
import 'package:provider/provider.dart';

class Sign_up_page extends StatefulWidget {
  const Sign_up_page({super.key});

  @override
  State<Sign_up_page> createState() => _Sign_up_pageState();
}

class _Sign_up_pageState extends State<Sign_up_page> {
  bool colorchange = false;
  String Selectform = "";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _ganderControllers = TextEditingController();
  TextEditingController _BusinessNameControllers = TextEditingController();
  TextEditingController _BusinessAddressControllers = TextEditingController();
  TextEditingController _CityControllers = TextEditingController();
  TextEditingController _StateControllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var controller = Provider.of<AuthController>(
      context,
    );
    var loading_state = Provider.of<App_state_controllers>(context);
    return Scaffold(
      body: SafeArea(
        child: loading_state.get_loader
            ? Btn_loader()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(10.h),
                        Text(
                          "Registration",
                          style: GetTextTheme.fs24_medium,
                        ),
                        Gap(10.h),
                        Text(
                          "Fill the below form to get registered with Milkman’s Manager. We may send a confirmation text message on your phone number for verification purpose.",
                          style: GetTextTheme.fs12_regular
                              .copyWith(color: AppColors.blackColor),
                        ),
                        Gap(10.h),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Radio_fun(
                                text: "Individual",
                                onDone: (p0) {
                                  setState(() {
                                    Selectform = p0;
                                  });
                                },
                                value: Selectform,
                              ),
                            ),
                            Expanded(
                              child: Radio_fun(
                                text: "Dairy",
                                onDone: (p0) {
                                  setState(() {
                                    Selectform = p0;
                                  });
                                },
                                value: Selectform,
                              ),
                            ),
                          ],
                        ),
                        Text('Personal Information',
                            style: GetTextTheme.fs14_regular),
                        Gap(15.h),
                        Customtextformfilled(
                          validator: (value) =>
                              TextValidatioinController.isTextValid(value),
                          prifixicon: Icons.person_2_outlined,
                          controller: _fullnameController,
                          hintText: "Username",
                          style: GetTextTheme.fs14_regular,
                          fillcolor: AppColors.tranceparent,
                        ),
                        Gap(15.h),
                        Customtextformfilled(
                          Keyboradtype: TextInputType.number,
                          maxlength: 10,
                          validator: (value) =>
                              TextValidatioinController.isTextValid(value),
                          prifixicon: Icons.phone_android,
                          controller: _phoneController,
                          hintText: "Phone",
                          style: GetTextTheme.fs14_regular,
                          fillcolor: AppColors.tranceparent,
                        ),
                        Gap(15.h),
                        Customtextformfilled(
                          validator: (value) =>
                              TextValidatioinController.isEmail(value),
                          prifixicon: Icons.email_outlined,
                          controller: _emailController,
                          hintText: "Email (optional)",
                          style: GetTextTheme.fs14_regular,
                          fillcolor: AppColors.tranceparent,
                        ),
                        Gap(15.h),
                        Customtextformfilled(
                          validator: (value) =>
                              TextValidatioinController.isTextValid(value),
                          imageicon: Appicons.gander,
                          controller: _ganderControllers,
                          hintText: "Gander",
                          style: GetTextTheme.fs14_regular,
                          fillcolor: AppColors.tranceparent,
                        ),
                        Gap(15.h),
                        Customtextformfilled(
                          validator: (value) =>
                              TextValidatioinController.isPassword(value),
                          imageicon: Appicons.gander,
                          controller: _passwordController,
                          hintText: "Password",
                          style: GetTextTheme.fs14_regular,
                          fillcolor: AppColors.tranceparent,
                        ),
                        Gap(5.h),
                        Divider(),
                        Gap(5.h),
                        Text('Business Information',
                            style: GetTextTheme.fs14_regular),
                        Gap(10.h),
                        Customtextformfilled(
                          validator: (value) =>
                              TextValidatioinController.isTextValid(value),
                          imageicon: Appicons.businessname,
                          controller: _BusinessNameControllers,
                          hintText: "Business Name",
                          style: GetTextTheme.fs14_regular,
                          fillcolor: AppColors.tranceparent,
                        ),
                        Gap(15.h),
                        Customtextformfilled(
                          validator: (value) =>
                              TextValidatioinController.isTextValid(value),
                          imageicon: Appicons.address,
                          controller: _BusinessAddressControllers,
                          hintText: "Business Address",
                          style: GetTextTheme.fs14_regular,
                          fillcolor: AppColors.tranceparent,
                        ),
                        Gap(15.h),
                        Row(
                          children: [
                            Customtextformfilled(
                              validator: (value) =>
                                  TextValidatioinController.isTextValid(value),
                              isExpanded: true,
                              imageicon: Appicons.state,
                              controller: _CityControllers,
                              hintText: "City",
                              style: GetTextTheme.fs14_regular,
                              fillcolor: AppColors.tranceparent,
                            ),
                            Gap(10.h),
                            Customtextformfilled(
                              validator: (value) =>
                                  TextValidatioinController.isTextValid(value),
                              isExpanded: true,
                              imageicon: Appicons.state,
                              controller: _StateControllers,
                              hintText: "State",
                              style: GetTextTheme.fs14_regular,
                              fillcolor: AppColors.tranceparent,
                            ),
                          ],
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
                            btnName: "Register",
                            onTap: () async {
                              if (colorchange == true) {
                                if (_formKey.currentState!.validate()) {
                                  await AllFuntion(controller, context)
                                      .createAccount(context, creataccount(),
                                          _passwordController.text);
                                  AuthController().resetuser();

                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) =>
                                          Registration_successful_dailog());
                                }
                              }
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?",
                                style: GetTextTheme.fs12_medium),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routesname.Login_page);
                                },
                                child: Text("Login Here",
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
    );
  }

  Map<String, dynamic> creataccount() {
    return user_model(
      fullname: _fullnameController.text.trim(),
      phone_number: _phoneController.text.trim(),
      email: _emailController.text.trim(),
      gender: _ganderControllers.text.trim(),
      business_address: _BusinessAddressControllers.text.trim(),
      business_name: _BusinessNameControllers.text.trim(),
      city: _CityControllers.text.trim(),
      state: _StateControllers.text.trim(),
    ).tojson();
  }
}
