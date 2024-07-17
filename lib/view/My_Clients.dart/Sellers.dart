import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/controllers/customers_controllers.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/model/customer_model.dart';
import 'package:milkman_manager_app/view/My_Clients.dart/Customer_Profile.dart';
import 'package:provider/provider.dart';

class Sellers_page extends StatefulWidget {
  final List<Customer_model>? model;
  const Sellers_page({super.key, this.model});

  @override
  State<Sellers_page> createState() => _Sellers_pageState();
}

class _Sellers_pageState extends State<Sellers_page> {
  bool ischakvalue = false;
  bool ischakvalue2 = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Add_Customers>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: widget.model!.isEmpty
                ? CircularProgressIndicator.adaptive()
                : ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 2,
                        ),
                    itemCount: widget.model!.length,
                    shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Customer_model data = widget.model![index];

                      return GestureDetector(
                        onTap: () {
                          Appservices.pushto(
                              context, CustomerProfile(data: data));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 15, bottom: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.skyblue),
                                      child: Text(
                                        data.name!
                                            .split(" ")
                                            .map((e) => e[0])
                                            .join(""),
                                        style: GetTextTheme.fs12_bold
                                            .copyWith(color: AppColors.primary),
                                      )),
                                  Gap(10.h),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Row(
                                          children: [
                                            Text(
                                              data.name.toString(),
                                              style: GetTextTheme.fs14_regular,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            Gap(10.h),
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 2,
                                                    bottom: 2),
                                                decoration: BoxDecoration(
                                                    color: data.category
                                                                .toString() ==
                                                            'Dairy'
                                                        ? AppColors.lightorange
                                                        : AppColors
                                                            .lightprimary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Text(
                                                  data.category.toString(),
                                                  style: GetTextTheme
                                                      .fs10_regular
                                                      .copyWith(
                                                          color: data.category
                                                                      .toString() ==
                                                                  'Dairy'
                                                              ? AppColors.orange
                                                              : AppColors
                                                                  .primary),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Gap(5.h),
                                      Text(
                                        "91+ ${data.phonenumber.toString()}",
                                        style: GetTextTheme.fs10_medium,
                                      ),
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  PopupMenuButton(
                                    color: AppColors.whiteColor,
                                    enabled: true,
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                          onTap: () async {
                                            provider.clearcustomer(
                                                data.uid.toString());
                                            print(data.uid);
                                            await Add_Customers()
                                                .Deletecustomers(
                                                    data.uid.toString());
                                          },
                                          child: Text(
                                            "Delete",
                                            style: GetTextTheme.fs14_regular,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                              Gap(10),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  Gap(5),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: data.address.toString(),
                                        style: GetTextTheme.fs12_regular
                                            .copyWith(
                                                color: AppColors.blackColor)),
                                    TextSpan(
                                      text: " ${data.state.toString()}",
                                      style: GetTextTheme.fs12_regular.copyWith(
                                          color: AppColors.blackColor),
                                    ),
                                  ])),
                                  Gap(10.h),
                                  Expanded(child: SizedBox()),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 6, right: 6, top: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                        color:
                                            data.DeliverySchedule.toString() ==
                                                        'Morning' ||
                                                    data.DeliverySchedule
                                                            .toString() ==
                                                        "Both"
                                                ? AppColors.primary
                                                : AppColors.whiteColor,
                                        border:
                                            Border.all(color: AppColors.grey),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            topLeft: Radius.circular(20))),
                                    child: Text(
                                      "Mor",
                                      style: GetTextTheme.fs10_regular.copyWith(
                                          color: data.DeliverySchedule
                                                          .toString() ==
                                                      'Morning' ||
                                                  data.DeliverySchedule
                                                          .toString() ==
                                                      "Both"
                                              ? AppColors.whiteColor
                                              : AppColors.blackColor),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 6, right: 6, top: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                        color:
                                            data.DeliverySchedule.toString() ==
                                                        'Evening' ||
                                                    data.DeliverySchedule
                                                            .toString() ==
                                                        "Both"
                                                ? AppColors.primary
                                                : AppColors.whiteColor,
                                        border:
                                            Border.all(color: AppColors.grey),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    child: Text(
                                      "Eve",
                                      style: GetTextTheme.fs10_regular.copyWith(
                                          color: data.DeliverySchedule
                                                          .toString() ==
                                                      'Evening' ||
                                                  data.DeliverySchedule
                                                          .toString() ==
                                                      "Both"
                                              ? AppColors.whiteColor
                                              : AppColors.blackColor),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
