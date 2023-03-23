import 'dart:convert';
import 'package:getx_login_singup/configs/themes/app_colors.dart';
import 'package:getx_login_singup/const.dart';
import 'package:getx_login_singup/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  Rx<TextEditingController> firstNameC = TextEditingController().obs;
  Rx<TextEditingController> lastNameC = TextEditingController().obs;
  Rx<TextEditingController> phoneC = TextEditingController().obs;
  Rx<TextEditingController> passC = TextEditingController().obs;
  Rx<TextEditingController> confirmC = TextEditingController().obs;
  Rx<TextEditingController> emailC = TextEditingController().obs;
  var agree = false.obs;

     var loading = false.obs;

  void signUpwithemail() async {
    loading.value = true;
    try {
      final response = await http.post(
        Uri.parse(AppUrl.signup),
        body: {
          'email': emailC.value.text,
          'password': passC.value.text,
          "firstname": firstNameC.value.text,
          "lastname": lastNameC.value.text,
          "phone": phoneC.value.text,
          "password": passC.value.text,
        },
      ).timeout(Duration(seconds: 10));
      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);
      bool loginnn = data['success'];
      if (loginnn) {
        emailC.value.clear();
        passC.value.clear();
        Get.to(() => HomeScreen());
        loading.value = false;
        Get.snackbar("Satus ", "Login successful",
            backgroundColor: mycolor.primary3, colorText: mycolor.whit1);
      } else {
        loading.value = false;
        Get.snackbar("Login Faild", "Invalid Username or Password",
            backgroundColor: mycolor.primary3, colorText: mycolor.whit1);
      }
    } catch (e) {
      Get.snackbar("Login Faild", "",
          backgroundColor: mycolor.primary3, colorText: mycolor.whit1);

      loading.value = false;
      print(e.toString());
    }
  }
}
