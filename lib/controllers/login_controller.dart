import 'dart:convert';
import 'package:getx_login_singup/configs/themes/app_colors.dart';
import 'package:getx_login_singup/const.dart';
import 'package:getx_login_singup/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool loading = false.obs;
  void loginWithtemail() async {
    loading.value = true;
    try {
      final response = await http.post(
        Uri.parse(AppUrl.loginApi),
        body: {
          'email': emailController.value.text,
          'password': passwordController.value.text
        },
      ).timeout(Duration(seconds: 10));
      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);
      bool loginnn = data['success'];
      if (loginnn) {
        emailController.value.clear();
        passwordController.value.clear();
        Get.to(() => HomeScreen());
        loading.value = false;
        Get.snackbar("Satus ", "Login successful",
            backgroundColor: mycolor.primary3,
          colorText: mycolor.whit1
        );
      } else {
        loading.value = false;
        Get.snackbar("Login Faild", "Invalid Username or Password",
            backgroundColor: mycolor.primary3,
            colorText: mycolor.whit1
        );
      }
    } catch (e) {
      Get.snackbar("Login Faild" , "Timeout",
          backgroundColor: mycolor.primary3,
          colorText: mycolor.whit1);

          loading.value = false;
      print(e.toString());
    }
  }
}
