import 'package:flutter/material.dart';
import 'package:milkman_manager_app/Deshborad/Deshborad.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/view/Analytics/analytics.dart';
import 'package:milkman_manager_app/view/My_Clients.dart/my_clients.dart';
import 'package:milkman_manager_app/view/add_custmar/add_Customer_Individual.dart';
import 'package:milkman_manager_app/helpers/all_icons.dart';

import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/view/setting_page/setting.dart';

// ignore: must_be_immutable
class BottomBarScreen extends StatefulWidget {
  int currentIndex;
  BottomBarScreen({super.key, this.currentIndex = 0});

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<CustomRow> listOfBottom = [
    CustomRow(Appicons.dashborad, "Dashboard"),
    CustomRow(Appicons.fat, "Analytics"),
    CustomRow(Appicons.fat, "RSS"),
    CustomRow(Appicons.maltipalperson, "Clients"),
    CustomRow(Appicons.seeting, "Setting"),
  ];

  List<Widget> listOfScreens = [
    DashBorad(),
    Analytics_page(),
    Add_Customer_Individual(),
    MyClients_Buyer(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: listOfScreens[widget.currentIndex],
        bottomNavigationBar: BottomAppBar(
            height: 80,
            color: AppColors.primary,
            shape: CircularNotchedRectangle(),
            // notchMargin: 0.01,
            clipBehavior: Clip.antiAlias,
            // elevation: 0,
            // shadowColor: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  listOfBottom.length,
                  (index) => index == 2
                      ? SizedBox(
                          width: 15,
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.currentIndex = index;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                listOfBottom[index].image,
                                color: widget.currentIndex == index
                                    ? AppColors.orange
                                    : AppColors.whiteColor,
                                height: 25,
                                width: 25,
                              ),
                              Text(
                                listOfBottom[index].name,
                                style: GetTextTheme.fs14_regular.copyWith(
                                    color: widget.currentIndex == index
                                        ? AppColors.orange
                                        : AppColors.whiteColor),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false,
        floatingActionButton: GestureDetector(
          onTap: () {
            Appservices.pushto(context, Add_Customer_Individual());
            // setState(() {
            //   widget.currentIndex = 2;
            // });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration:
                BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: Icon(
              Icons.add,
              color: AppColors.orange,
            ),
          ),
        ));
  }
}

class CustomRow {
  String image, name;

  CustomRow(this.image, this.name);
}
