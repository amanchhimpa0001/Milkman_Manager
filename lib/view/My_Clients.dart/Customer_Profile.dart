import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/controllers/Milk_controllers.dart';
import 'package:milkman_manager_app/dummy_widget/today_milktile.dart';
import 'package:milkman_manager_app/helpers/all_icons.dart';
import 'package:milkman_manager_app/helpers/all_image.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/model/customer_model.dart';
import 'package:milkman_manager_app/model/milk_model.dart';
import 'package:milkman_manager_app/view/My_Clients.dart/pdf/pdf_api.dart';
import 'package:milkman_manager_app/view/My_Clients.dart/pdf/pdf_page.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CustomerProfile extends StatefulWidget {
  Customer_model data;
  CustomerProfile({super.key, required this.data});

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  bool color = false;

  // DATE PICKER SCROLL CONTROLLER

  late ScrollController _controller;

  List<DateTime> getMonthsList() {
    List<DateTime> data = [];
    DateTime now = DateTime.now();
    for (var i = 0; i < 12; i++) {
      DateTime beforeMonth = now.subtract(Duration(days: i * 30));
      data.add(beforeMonth);
    }

    return data.reversed.toList();
  }

  DateTime _showDataforDate = DateTime.now();

  bool isDateActive(DateTime value) {
    return _showDataforDate.month == value.month &&
        _showDataforDate.year == value.year;
  }

  void setActive(DateTime value) {
    print(value.day);
    _showDataforDate = value;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_controller.hasClients) {
        _controller.animateTo(_controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 50), curve: Curves.linear);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Milk_controllers>(context);
    final milkAllData = provider.getmilk
        .where((element) => element.uid == widget.data.uid)
        .toList();
    List<MilkModel> mdata = [];
    for (var milkdata in milkAllData) {
      bool a =
          DateFormat("yMMMM").format(DateTime.parse(milkdata.createdate!)) ==
              DateFormat("yMMMM").format(_showDataforDate);

      if (a) {
        mdata.add(milkdata);
      }
    }

    // List<MilkModel> mdata = [];
    // for (var milkdata in milkAllData) {
    //   bool a =
    //       DateFormat("yMMMM").format(DateTime.parse(milkdata.createdate!)) ==
    //           DateFormat("yMMMM").format(_showDataforDate);
    //   if (a) {
    //     mdata.add(milkdata);
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Customer Profile",
          style: GetTextTheme.fs14_regular,
        ),
        leadingWidth: 30,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Text(
              "+ Add Payment",
              style: GetTextTheme.fs12_regular.copyWith(color: AppColors.blue),
              textAlign: TextAlign.center,
            ),
          ),
          Gap(10.h),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primary)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.data.name.toString(),
                            style: GetTextTheme.fs24_medium
                                .copyWith(color: AppColors.primary),
                          ),
                          Column(
                            children: [
                              Text(
                                "Balance",
                                style: GetTextTheme.fs14_regular,
                              ),
                              Text(
                                "₹ 5,000",
                                style: GetTextTheme.fs16_medium,
                              )
                            ],
                          )
                        ],
                      ),
                      Gap(10.h),
                      Divider(),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.phone_android_rounded),
                        title: Text(
                          widget.data.phonenumber.toString(),
                          style: GetTextTheme.fs14_regular,
                        ),
                        trailing: Icon(
                          Icons.phone,
                          color: AppColors.primary,
                        ),
                      ),
                      ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.location_on_outlined),
                          title: Text(
                            widget.data.address.toString(),
                            style: GetTextTheme.fs14_regular,
                          ),
                          trailing: Image.asset(
                            Appicons.address,
                            scale: 3,
                            color: AppColors.primary,
                          )),
                    ],
                  ),
                ),
                Gap(10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  child: Row(
                    children: List.generate(getMonthsList().length, (i) {
                      final date = getMonthsList()[i];
                      return GestureDetector(
                        onTap: () => setActive(date),
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 80,
                          width: 60,
                          decoration: BoxDecoration(
                              color: isDateActive(date)
                                  ? AppColors.lightprimary
                                  : AppColors.tranceparent,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: isDateActive(date)
                                      ? AppColors.grey
                                      : AppColors.lightprimary,
                                  width: 1.3)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                DateFormat("MMM").format(date),
                                style: GetTextTheme.fs14_regular
                                    .copyWith(color: AppColors.grey),
                              ),
                              Text(
                                DateFormat("yy").format(date),
                                style: GetTextTheme.fs16_medium
                                    .copyWith(color: AppColors.darkgrey),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Gap(10.h),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColors.lightprimary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Getimage.milk,
                        scale: 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "53.6 Ltr",
                            style: GetTextTheme.fs20_medium,
                          ),
                          Text(
                            "Total Milk ",
                            style: GetTextTheme.fs10_regular,
                          ),
                          Gap(10),
                          Text(
                            "₹ 3112.00",
                            style: GetTextTheme.fs20_medium,
                          ),
                          Text(
                            "Total Bill ",
                            style: GetTextTheme.fs10_regular,
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Column(
                        children: [
                          Text(
                            "Mar 2024 ",
                            style: GetTextTheme.fs14_medium,
                          ),
                          Gap(40.h),
                          GestureDetector(
                            onTap: () async {
                              final file = await MyInvoice().generateInvoice();
                              PdfApi.openFile(file.path);
                              // Appservices.pushto(context, pdf_data_all());
                            },
                            child: Text(
                              "View Bill",
                              style: GetTextTheme.fs12_regular
                                  .copyWith(color: AppColors.blue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Gap(10),
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    shrinkWrap: true,
                    itemCount: mdata.length,
                    itemBuilder: (context, index) {
                      if (mdata.first.createdate == getMonthsList()) {
                        print("===========================");
                      }
                      if (mdata == 0 && mdata[index].status == "Buyer") {}
                      return Today_Milk_tile(
                        data: mdata[index],
                      );
                    }),
                Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
