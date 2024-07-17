import 'package:flutter/material.dart';
import 'package:milkman_manager_app/controllers/customers_controllers.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:milkman_manager_app/model/customer_model.dart';
import 'package:milkman_manager_app/view/My_Clients.dart/Buyers_page.dart';
import 'package:milkman_manager_app/view/My_Clients.dart/Sellers.dart';
import 'package:provider/provider.dart';

class MyClients_Buyer extends StatefulWidget {
  const MyClients_Buyer({super.key});

  @override
  State<MyClients_Buyer> createState() => _MyClients_BuyerState();
}

class _MyClients_BuyerState extends State<MyClients_Buyer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Add_Customers>(context);
    List<Customer_model> BuyerList = [];
    List<Customer_model> sellerList = [];
    for (var data in provider.getcustomer!) {
      bool value = data.Customerstype == "Buyer";
      if (value) {
        BuyerList.add(data);
      } else {
        sellerList.add(data);
      }
    }
    print(sellerList.length);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "My Clients",
          style: GetTextTheme.fs24_medium,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: AppColors.textformfieldcolor,
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(50)),
            child: TabBar(
                labelPadding: EdgeInsets.all(0),
                indicator: BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.symmetric(
                        vertical: BorderSide(color: AppColors.grey))),
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _tabController,
                unselectedLabelColor: AppColors.greycolor,
                labelColor: Colors.black,
                dividerColor: Colors.transparent,
                overlayColor: WidgetStatePropertyAll(AppColors.whiteColor),
                tabs: [
                  Tab(
                    child: Text("Buyers", style: GetTextTheme.fs14_regular),
                  ),
                  Tab(
                    child: Text("Sellers", style: GetTextTheme.fs14_regular),
                  )
                ]),
          ),
          Flexible(
            child: TabBarView(controller: _tabController, children: [
              Buyers_page(
                model: BuyerList,
              ),
              Sellers_page(
                model: sellerList,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
