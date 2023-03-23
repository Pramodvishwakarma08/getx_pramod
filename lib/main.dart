import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_login_singup/routes/app_routes.dart';


void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

    designSize: const Size(414, 922),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            initialRoute: AppRoutes.login,

            // theme: Get.find<ThemeController>().getLightheme(),
            // darkTheme: Get.find<ThemeController>().getDarkTheme(),
            getPages: getPages,
          );
        });


  }
}
