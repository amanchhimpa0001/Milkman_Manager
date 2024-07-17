import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/Utils/Utils.dart';
import 'package:milkman_manager_app/componants/custum_elevated_btn.dart';
import 'package:milkman_manager_app/componants/radio_fun.dart';
import 'package:milkman_manager_app/componants/textformfield.dart';
import 'package:milkman_manager_app/controllers/Milk_controllers.dart';
import 'package:milkman_manager_app/controllers/customers_controllers.dart';
import 'package:milkman_manager_app/helpers/all_icons.dart';
import 'package:milkman_manager_app/helpers/app_config.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/helpers/text_validotor.dart';
import 'package:milkman_manager_app/model/customer_model.dart';
import 'package:milkman_manager_app/model/milk_model.dart';
import 'package:provider/provider.dart';

class Sale_Milk extends StatefulWidget {
  const Sale_Milk({super.key});

  @override
  State<Sale_Milk> createState() => _Sale_MilkState();
}

class _Sale_MilkState extends State<Sale_Milk> {
  String Milktyps = "";
  String selectedValuecollect = "";
  final TextEditingController _FatController = TextEditingController();
  final TextEditingController _QuantityController = TextEditingController();
  final TextEditingController _RateController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Customer_model> usernamelist = [];
  String? dropdownvalueusername;
  String customerId = "";
  bool isactivename = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        title: Text(
          "Sale Milk",
          style: GetTextTheme.fs24_medium,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  GestureDetector(
                    onTap: () => setState(() {
                      isactivename = !isactivename;
                    }),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(40),
                          color: AppColors.tranceparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dropdownvalueusername ?? "select on e",
                            style: GetTextTheme.fs14_regular,
                          ),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                  ),
                  Consumer<Add_Customers>(builder: (context, value, child) {
                    final data = value.getcustomer;
                    return Visibility(
                        visible: isactivename,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: AppConfig.screenWidth,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey),
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.tranceparent),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...List.generate(
                                    data!.length,
                                    (index) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              customerId = data[index].uid!;
                                              dropdownvalueusername =
                                                  "${data[index].name.toString().split(",").first} ${data[index].address.toString().split(",").last} ";
                                              isactivename = false;
                                            });
                                          },
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: data[index]
                                                        .name
                                                        .toString()
                                                        .split(",")
                                                        .first,
                                                    style: GetTextTheme
                                                        .fs14_regular
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppColors
                                                                .blackColor),
                                                    children: [
                                                  TextSpan(
                                                    text: data[index]
                                                        .address
                                                        .toString()
                                                        .split(",")
                                                        .last,
                                                    style: GetTextTheme
                                                        .fs14_regular
                                                        .copyWith(
                                                            color: AppColors
                                                                .blackColor),
                                                  ),
                                                ])),
                                          ),
                                        )),
                              ]),
                        ));
                  }),
                  Gap(15.h),
                  Row(
                    children: [
                      Customtextformfilled(
                        validator: (value) =>
                            TextValidatioinController.isTextValid(value),
                        isExpanded: true,
                        imageicon: Appicons.fat,
                        controller: _FatController,
                        hintText: "Fat",
                        style: GetTextTheme.fs14_regular,
                        fillcolor: AppColors.tranceparent,
                      ),
                      Gap(10.h),
                      Customtextformfilled(
                        validator: (value) =>
                            TextValidatioinController.isTextValid(value),
                        isExpanded: true,
                        imageicon: Appicons.Quantity,
                        controller: _QuantityController,
                        hintText: "Quantity",
                        style: GetTextTheme.fs14_regular,
                        fillcolor: AppColors.tranceparent,
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Customtextformfilled(
                    validator: (value) =>
                        TextValidatioinController.isTextValid(value),
                    prifixicon: Icons.request_page_sharp,
                    controller: _RateController,
                    hintText: "Rate",
                    style: GetTextTheme.fs14_regular,
                    fillcolor: AppColors.tranceparent,
                  ),
                  Gap(10.h),
                  Text(
                    'Milk Type',
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
                              Milktyps = p0;
                            });
                          },
                          value: Milktyps,
                        ),
                      ),
                      Expanded(
                        child: Radio_fun(
                          text: "Buffalo",
                          onDone: (p0) {
                            setState(() {
                              Milktyps = p0;
                            });
                          },
                          value: Milktyps,
                        ),
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Text(
                    'Collect from',
                    style: GetTextTheme.fs14_regular,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Radio_fun(
                          text: "Individual",
                          onDone: (p0) {
                            setState(() {
                              selectedValuecollect = p0;
                            });
                          },
                          value: selectedValuecollect,
                        ),
                      ),
                      Expanded(
                        child: Radio_fun(
                          text: "Dairy",
                          onDone: (p0) {
                            setState(() {
                              selectedValuecollect = p0;
                            });
                          },
                          value: selectedValuecollect,
                        ),
                      ),
                    ],
                  ),
                  Gap(10.h),
                  CustomElevatedButton(
                      foreground_clr: AppColors.whiteColor,
                      btnName: "Sale Now",
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          if (dropdownvalueusername!.isEmpty &&
                              selectedValuecollect.isEmpty &&
                              Milktyps.isEmpty) {
                            return Utils.FlushbarErrorMassage(
                                'please select Radio tile', context);
                          } else if (dropdownvalueusername!.isEmpty) {
                            Utils.FlushbarErrorMassage(
                                'please Select One Form Address Select',
                                context);
                          } else if (Milktyps.isEmpty) {
                            Utils.FlushbarErrorMassage(
                                'please Select One Form Milktyps Select',
                                context);
                          } else if (selectedValuecollect.isEmpty) {
                            Utils.FlushbarErrorMassage(
                                'please Select One Form  Individual and Dairy  Select',
                                context);
                          } else {
                            Milk_controllers().receivemilk(MilkForm(), context);
                          }
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> MilkForm() {
    var milkdata = Provider.of<Add_Customers>(context, listen: false);
    return MilkModel(
            fat: _FatController.text.trim(),
            Rate: _RateController.text.trim(),
            address: dropdownvalueusername,
            Quantity: _QuantityController.text.trim(),
            Collectform: selectedValuecollect.trim(),
            Milktype: Milktyps,
            status: milkdata.getcustomer![0].Customerstype,
            uid: customerId)
        .tojson();
  }
}
