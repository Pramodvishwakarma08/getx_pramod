import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_login_singup/screens/auth/login_screen.dart';
import 'package:getx_login_singup/screens/auth/signup_screen.dart';
import 'package:getx_login_singup/screens/home.dart';

class AppRoutes {
  static String login = '/';
  static String signUp = '/signup';
  static String home = '/home';

}

  final   getPages = [
        GetPage(
          name: AppRoutes.login,
          page: () =>  LoginScreen(),
        ),
        GetPage(
          page: () =>  SignUpScreen(),
          name: AppRoutes.signUp,
        ),
        GetPage(
            page: () =>  HomeScreen(),
            name: AppRoutes.home,
        )
      ];
