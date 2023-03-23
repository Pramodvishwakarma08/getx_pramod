import 'package:flutter/material.dart';
import 'package:getx_login_singup/configs/themes/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolor.primary2,
      body: Center(
          child: Text(
        "WEL COME \nHOME PAGE",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: mycolor.primary3, fontSize: 35),
      )),
    );
  }
}
