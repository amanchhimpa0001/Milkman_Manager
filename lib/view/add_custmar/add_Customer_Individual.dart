import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/Utils/Utils.dart';
import 'package:milkman_manager_app/componants/custum_elevated_btn.dart';
import 'package:milkman_manager_app/componants/radio_fun.dart';
import 'package:milkman_manager_app/componants/textformfield.dart';
import 'package:milkman_manager_app/controllers/all_controllers.dart';
import 'package:milkman_manager_app/controllers/customers_controllers.dart';
import 'package:milkman_manager_app/helpers/all_icons.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/helpers/text_validotor.dart';
import 'package:milkman_manager_app/model/customer_model.dart';
import 'package:provider/provider.dart';

class Add_Customer_Individual extends StatefulWidget {
  const Add_Customer_Individual({super.key});

  @override
  State<Add_Customer_Individual> createState() =>
      _Add_Customer_IndividualState();
}

class _Add_Customer_IndividualState extends State<Add_Customer_Individual> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

  final TextEditingController _AddressControllers = TextEditingController();

  final TextEditingController _CityControllers = TextEditingController();
  final TextEditingController _StateControllers = TextEditingController();
  final TextEditingController _StartDateControllers = TextEditingController();
  final TextEditingController _QuantityControllers = TextEditingController();
  TextEditingController _BusinessNameControllers = TextEditingController();
  // final TextEditingController _categoryControllers = TextEditingController();
  // final TextEditingController _milkcategoryControllers =
  //     TextEditingController();
  // final TextEditingController _timecategoryControllers =
  //     TextEditingController();
  // final TextEditingController _buyarControllers = TextEditingController();

  String selectedValuemilk = "";
  String Category = "";
  String SelectCattle = "";
  String DeliverySchedule = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 40,
        title: Text(
          "Add Customer",
          style: GetTextTheme.fs24_medium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Radio_fun(
                          text: "Buyer",
                          onDone: (p0) {
                            setState(() {
                              selectedValuemilk = p0;
                            });
                          },
                          value: selectedValuemilk,
                        ),
                      ),
                      Expanded(
                        child: Radio_fun(
                          text: "Saller",
                          onDone: (p0) {
                            setState(() {
                              selectedValuemilk = p0;
                            });
                          },
                          value: selectedValuemilk,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Radio_fun(
                          // selectedtext: selectedValuecollect,
                          text: "Individual",
                          onDone: (p0) {
                            setState(() {
                              Category = p0;
                            });
                          },
                          value: Category,
                        ),
                      ),
                      Expanded(
                        child: Radio_fun(
                          text: "Dairy",
                          onDone: (p0) {
                            setState(() {
                              Category = p0;
                            });
                          },
                          value: Category,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Gap(10.h),
                  Text("Customer Profile", style: GetTextTheme.fs14_regular),
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
                    validator: (value) =>
                        TextValidatioinController.isTextValid(value),
                    maxlength: 10,
                    prifixicon: Icons.phone_android,
                    controller: _phoneController,
                    hintText: "Phone Number",
                    style: GetTextTheme.fs14_regular,
                    fillcolor: AppColors.tranceparent,
                  ),
                  Gap(15.h),
                  Customtextformfilled(
                    validator: (value) =>
                        TextValidatioinController.isTextValid(value),
                    prifixicon: Icons.location_on_outlined,
                    controller: _AddressControllers,
                    hintText: "Address",
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
                  Gap(5.h),
                  Text('Business Profile', style: GetTextTheme.fs14_regular),
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
                  Gap(5.h),
                  Divider(),
                  Gap(5.h),
                  Text("Requirements", style: GetTextTheme.fs14_regular),
                  Gap(10.h),
                  Row(
                    children: [
                      Customtextformfilled(
                        validator: (value) =>
                            TextValidatioinController.isTextValid(value),
                        isExpanded: true,
                        imageicon: Appicons.datetime,
                        controller: _StartDateControllers,
                        hintText: "Start Date",
                        style: GetTextTheme.fs14_regular,
                        fillcolor: AppColors.tranceparent,
                      ),
                      Gap(10.h),
                      Customtextformfilled(
                        validator: (value) =>
                            TextValidatioinController.isTextValid(value),
                        isExpanded: true,
                        imageicon: Appicons.Quantity,
                        controller: _QuantityControllers,
                        hintText: "Daily Quantity",
                        style: GetTextTheme.fs14_regular,
                        fillcolor: AppColors.tranceparent,
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Text(
                    'Select Cattle',
                    style: GetTextTheme.fs14_regular,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Radio_fun(
                          text: "Cow",
                          onDone: (p0) {
                            setState(() {
                              SelectCattle = p0;
                            });
                          },
                          value: SelectCattle,
                        ),
                      ),
                      Expanded(
                        child: Radio_fun(
                          text: "Buffalo",
                          onDone: (p0) {
                            setState(() {
                              SelectCattle = p0;
                            });
                          },
                          value: SelectCattle,
                        ),
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Text(
                    'Delivery Schedule',
                    style: GetTextTheme.fs14_regular,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Radio_fun(
                          text: "Morning",
                          onDone: (p0) {
                            setState(() {
                              DeliverySchedule = p0;
                            });
                          },
                          value: DeliverySchedule,
                        ),
                      ),
                      Expanded(
                        child: Radio_fun(
                          text: "Evening",
                          onDone: (p0) {
                            setState(() {
                              DeliverySchedule = p0;
                            });
                          },
                          value: DeliverySchedule,
                        ),
                      ),
                      Expanded(
                        child: Radio_fun(
                          text: "Both",
                          onDone: (p0) {
                            setState(() {
                              DeliverySchedule = p0;
                            });
                          },
                          value: DeliverySchedule,
                        ),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                      btnName: "Save Form",
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          if (selectedValuemilk.isEmpty &&
                              DeliverySchedule.isEmpty &&
                              SelectCattle.isEmpty &&
                              Category.isEmpty) {
                            return Utils.FlushbarErrorMassage(
                                'please select Radio tile', context);
                          } else if (selectedValuemilk.isEmpty) {
                            Utils.FlushbarErrorMassage(
                                'please Select One Form Buyer and Sallers Select',
                                context);
                          } else if (Category.isEmpty) {
                            Utils.FlushbarErrorMassage(
                                'please Select One Form Individual and Dairy Select',
                                context);
                          } else if (SelectCattle.isEmpty) {
                            Utils.FlushbarErrorMassage(
                                'please Select One Form SelectCattle', context);
                          } else if (DeliverySchedule.isEmpty) {
                            Utils.FlushbarErrorMassage(
                                'please Select One Form DeliverySchedule',
                                context);
                          } else {
                            Add_Customers()
                                .addcustomers(context, Customerform());
                          }
                        }
                      },
                      foreground_clr: AppColors.whiteColor),
                  Gap(27.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> Customerform() {
    var userdata = Provider.of<AuthController>(context, listen: false);
    return Customer_model(
            name: _fullnameController.text.trim(),
            phonenumber: _phoneController.text.trim(),
            address: _AddressControllers.text.trim(),
            city: _CityControllers.text.trim(),
            state: _StateControllers.text.trim(),
            startdate: _StartDateControllers.text.trim(),
            dailyQuantity: _QuantityControllers.text.trim(),
            category: Category.trim(),
            SelectCattle: SelectCattle.trim(),
            DeliverySchedule: DeliverySchedule.trim(),
            Customerstype: selectedValuemilk.trim(),
            BusinesName: _BusinessNameControllers.text.trim(),
            uid: userdata.getuser_data.uid)
        .tojson();
  }
}
