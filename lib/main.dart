import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants/view/base_bar.dart';
import 'package:plants/view/loginPage/login.dart';
import 'package:plants/service/serviceApi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX services
  Get.put<AuthService>(AuthService());

  AuthService authService = Get.find<AuthService>();
  String? token = await authService.getToken();

  // if (token != null) {
  //   await authService.refreshToken();
  // }

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Plant App',
          theme: ThemeData(
            primaryColor: const Color(0xFFE6F6F6),
            hintColor: const Color(0xFFE6F6F6),
            scaffoldBackgroundColor: const Color(0xFFE6F6F6),
            // textTheme: const TextTheme(
            //   bodyLarge: TextStyle(fontFamily: 'Roboto'),
            //   bodyMedium: TextStyle(fontFamily: 'Roboto'),
            //   bodySmall: TextStyle(fontFamily: 'Roboto'),
            //   headlineLarge: TextStyle(fontFamily: 'Roboto'),
            //   headlineMedium: TextStyle(fontFamily: 'Roboto'),
            //   headlineSmall: TextStyle(fontFamily: 'Roboto'),
            //   // Add other text styles as needed
            // ),
          ),
          home: child,
        );
      },
      child: token != null && token!.isNotEmpty ? BaseScreen() : loginPage(),
    );
  }
}
