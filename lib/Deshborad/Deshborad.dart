import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/Utils/routs/routs_name.dart';
import 'package:milkman_manager_app/controllers/all_controllers.dart';
import 'package:milkman_manager_app/dummy_widget/fl_chart.dart';
import 'package:milkman_manager_app/componants/textformfield.dart';
import 'package:milkman_manager_app/componants/tittlebar.dart';
import 'package:milkman_manager_app/dummy_widget/delivery_tile.dart';
import 'package:milkman_manager_app/helpers/all_icons.dart';
import 'package:milkman_manager_app/helpers/all_image.dart';
import 'package:milkman_manager_app/helpers/app_config.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/pdf_format.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/widget_model_dummy/deliverymodel/delivery_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class DashBorad extends StatefulWidget {
  const DashBorad({super.key});

  @override
  State<DashBorad> createState() => _DashBoradState();
}

class _DashBoradState extends State<DashBorad> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthController>(context);
    return Scaffold(
      appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, ${provider.getuser_data.fullname.toString()}',
                style: GetTextTheme.fs12_medium
                    .copyWith(color: AppColors.blackColor),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 15,
                  ),
                  Text(
                    provider.getuser_data.business_address.toString(),
                    style: GetTextTheme.fs12_regular
                        .copyWith(color: AppColors.greycolor),
                  ),
                  GestureDetector(
                      onTap: () {}, child: Icon(Icons.arrow_drop_down_outlined))
                ],
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      Appicons.volit,
                      scale: 3,
                    )),
                IconButton(
                    onPressed: () {
                      Appservices.pushto(context, pdf());
                    },
                    icon: Image.asset(
                      Appicons.notifation,
                      scale: 2,
                    )),
              ],
            ),
            Appservices.addWidth(10)
          ],
          forceMaterialTransparency: true,
          leadingWidth: 70,
          leading: Container(
            margin: EdgeInsets.only(left: 5).copyWith(left: 20),
            child: Image.asset(
              Getimage.profileimg,
              scale: 1,
            ),
          )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10.h),
              Row(
                children: [
                  Expanded(
                    child: leadinghideformfeild(
                      icon: Icons.search,
                      hintText: "Search...",
                      style: GetTextTheme.fs12_regular,
                      fillcolor: AppColors.tranceparent,
                    ),
                  ),
                  Appservices.addWidth(10),
                  Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: AppColors.grey)),
                      child: Image.asset(
                        Appicons.filter,
                        scale: 2,
                      ))
                ],
              ),
              Gap(10.h),
              Text(
                'Today : ₹ 72.00',
                style: GetTextTheme.fs16_medium
                    .copyWith(color: AppColors.greycolor),
              ),
              Gap(10.h),
              Text(
                'Price History (Mar, 2024)',
                style: GetTextTheme.fs14_medium
                    .copyWith(color: AppColors.greycolor),
              ),
              LineChartSample2(),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      hoverColor: AppColors.tranceparent,
                      onTap: () {
                        Navigator.pushNamed(context, Routesname.Receive_Milk);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: AppColors.primary),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Receive Milk',
                              style: GetTextTheme.fs18_regular
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            Image.asset(
                              Appicons.recivemlik,
                              scale: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gap(10.h),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routesname.Sale_Milk);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: AppColors.primary),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sale Milk',
                              style: GetTextTheme.fs18_regular
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            Image.asset(
                              Appicons.salemilk,
                              scale: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Gap(10.h),
              Container(
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(border: Border.all(color: AppColors.grey)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircularPercentIndicator(
                      radius: 50.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 25.0,
                      percent: 0.7,
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: AppColors.orange,
                      progressColor: AppColors.primary,
                    ),
                    Gap(15.h),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: GetTextTheme.fs16_medium
                                      .copyWith(color: AppColors.blackColor),
                                  children: [
                                TextSpan(text: "Total Sale : "),
                                TextSpan(
                                  text: "₹ 12,320.00",
                                  style: GetTextTheme.fs16_medium
                                      .copyWith(color: AppColors.primary),
                                )
                              ])),
                          Gap(10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 7.54,
                                      width: 7.54,
                                      decoration: BoxDecoration(
                                          color: AppColors.orange,
                                          shape: BoxShape.circle),
                                    ),
                                    Gap(6.w),
                                    Text(
                                      "Cash Sale",
                                      style: GetTextTheme.fs14_regular
                                          .copyWith(color: AppColors.greycolor),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "₹ 1,000.00",
                                style: GetTextTheme.fs14_regular,
                              )
                            ],
                          ),
                          Gap(10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 7.54,
                                      width: 7.54,
                                      decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          shape: BoxShape.circle),
                                    ),
                                    Gap(6.w),
                                    Text(
                                      "Pay Later",
                                      style: GetTextTheme.fs14_regular
                                          .copyWith(color: AppColors.greycolor),
                                    )
                                  ],
                                ),
                              ),
                              Text("₹ 7,000.00",
                                  style: GetTextTheme.fs14_regular)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Gap(15.h),
              tittlebar(
                  ontap: () {},
                  tittle: 'Today’s Delivery',
                  btnname: 'View All',
                  tittlecolor: AppColors.blackColor),
              Gap(15.h),
              SizedBox(
                height: AppConfig.screenHeight / 4.5,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: Delivery_model_helper.todaydeliverlist.length,
                  itemBuilder: (context, index) => Delivery_tile(
                      deliverydata:
                          Delivery_model_helper.todaydeliverlist[index]),
                ),
              ),
              Gap(15.h),
              tittlebar(
                  ontap: () {},
                  tittle: 'Pending Collections (3)',
                  btnname: 'View All',
                  tittlecolor: AppColors.blackColor),
              Gap(15.h),
              SizedBox(
                height: AppConfig.screenHeight / 4.5,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      Delivery_model_helper.PendingCollectionslist.length,
                  itemBuilder: (context, index) => Delivery_tile(
                      deliverydata:
                          Delivery_model_helper.PendingCollectionslist[index]),
                ),
              ),
              Gap(30.h)
            ],
          ),
        ),
      )),
    );
  }
}
