import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkman_manager_app/Utils/routs/routs.dart';
import 'package:milkman_manager_app/Utils/routs/routs_name.dart';
import 'package:milkman_manager_app/controllers/Milk_controllers.dart';
import 'package:milkman_manager_app/controllers/all_controllers.dart';
import 'package:milkman_manager_app/controllers/app_state.dart';
import 'package:milkman_manager_app/controllers/customers_controllers.dart';
import 'package:milkman_manager_app/firebase_options.dart';
import 'package:milkman_manager_app/helpers/app_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DeliverySchedule { Morning, Evining, Both }

late SharedPreferences prefs;
Future<void> main(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (context) => App_state_controllers(),
        ),
        ChangeNotifierProvider(
          create: (context) => Add_Customers(),
        ),
        ChangeNotifierProvider(
          create: (context) => Milk_controllers(),
        ),
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: Routesname.SplashScreenView,
          onGenerateRoute: Routes.zgenerateRoutes,
          debugShowCheckedModeBanner: false,
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
        designSize: const Size(AppConfig.screenWidth, AppConfig.screenHeight),
      ),
    );
  }
}
