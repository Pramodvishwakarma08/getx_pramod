import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login_singup/configs/themes/app_colors.dart';
import 'package:getx_login_singup/controllers/signup_controller.dart';

SignUpController signUpController = Get.put(SignUpController());

Widget mytextField(context, String hintText, bool pass, Icon icon,
    TextEditingController controller,
    {TextInputType? keyBType, bool? cpass}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      keyboardType: keyBType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
      controller: controller,
      obscureText: pass,
      style: TextStyle(color: mycolor.whit1),
      decoration: InputDecoration(
        prefixIcon: icon,
        prefixIconColor: mycolor.whit1,
        hintText: hintText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: mycolor.primary3),
        ),
        focusColor: Colors.white,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1, //<-- SEE HERE
            color: Colors.white,
          ),
        ),
        hintStyle: TextStyle(color: Colors.white),
      ),
    ),
  );
}

Text titleText(String data, context, double fSize, FontWeight fontWeight,
    {Color? clr}) {
  return Text(
    data,
    style: TextStyle(
        fontSize: fSize,
        fontWeight: fontWeight,
        color: clr == null ? Colors.white : clr),
  );
}
