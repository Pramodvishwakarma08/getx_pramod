import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_login_singup/configs/themes/app_colors.dart';
import 'package:getx_login_singup/routes/app_routes.dart';
import 'package:getx_login_singup/screens/home.dart';
import 'package:getx_login_singup/widgets/widgets.dart';
import '../../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);


  LoginController loginController = Get.put(LoginController());
   final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolor.primary2,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(117.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset("assets/KARAKOVER.png"),
                      Gap(13.h),
                      titleText("Lets Play, Learn, Create, Listen", context, 18,
                          FontWeight.w300)
                    ],
                  )
                ],
              ),
              Gap(81.h),
              titleText("Hey there ,", context, 18, FontWeight.w500,clr: Color(0xffA1A1A1)),
              Gap(13.h),
              titleText("Login to your account", context, 26, FontWeight.w700),
              Gap(30.5.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    mytextField(context, "Email", false, Icon(Icons.email_outlined,), loginController.emailController.value),
                    mytextField(context, "Password", true, Icon(Icons.lock_outline), loginController.passwordController.value),
                  ],
                ),
              )
              ,Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.to(()=>HomeScreen());},
                        child: titleText("Forgot password?", context, 16, FontWeight.w700))
                ],
              ),
              Gap(55.h),
              Obx(
                () => TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()){
                      loginController.loginWithtemail();
                    }
                  },
                  child: loginController.loading.value
                      ? Container(
                          width: 345.w,
                          height: 59.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: mycolor.primary3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                              const Center(child: CircularProgressIndicator()))
                      : Container(
                          width: 345.w,
                          height: 59.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: mycolor.primary3,
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                ),
              ),
              Gap(29.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Gap(8),
                  titleText("Or Continue With", context, 14, FontWeight.w700),
                  Gap(8),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Gap(32.h),
              Center(child: Image.asset("assets/fb.png")),
              Gap(25.h),
              Center(
                  child:  TextButton(
                      onPressed: (){
                        Get.toNamed(AppRoutes.signUp);
                      },
                      child: titleText("Don’t have an account? Sign Up", context,
                          16, FontWeight.w800)),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
