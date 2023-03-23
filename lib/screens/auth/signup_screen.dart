import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_login_singup/configs/themes/app_colors.dart';
import 'package:getx_login_singup/routes/app_routes.dart';
import 'package:getx_login_singup/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolor.primary2,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 34.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(117.h,),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(children: [
                      Image.asset("assets/KARAKOVER.png"),
                      Gap(13.h),
                      titleText("Lets Play, Learn, Create, Listen", context, 18,
                          FontWeight.w300)
                    ],
                  )
                ],
              ),
              Gap(81.h),
              titleText("Hey there ,", context, 18, FontWeight.w500,
                  clr: Color(0xffA1A1A1)),
              Gap(13.h),
              titleText("Create new account", context, 26, FontWeight.w700),
              Gap(55.5.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    mytextField(
                      context,
                      "First Name",
                      false,
                      Icon(Icons.person_2_outlined),
                      signUpController.firstNameC.value,
                    ),
                    mytextField(
                      context,
                      "Last Name",
                      false,
                      Icon(Icons.person_2_outlined),
                      signUpController.lastNameC.value,
                    ),
                    mytextField(context, "Email", false, Icon(Icons.email_outlined),
                        signUpController.emailC.value,
                        keyBType: TextInputType.emailAddress),
                    mytextField(context, "Phone", false, Icon(Icons.phone_outlined),
                        signUpController.phoneC.value,
                        keyBType: TextInputType.phone),
                    mytextField(context, "Password", true, Icon(Icons.lock_outline),
                        signUpController.passC.value),
                    mytextField(context, "Confirm Password", true,
                        Icon(Icons.lock_outline), signUpController.confirmC.value,cpass: true),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: mycolor.primary3,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => mycolor.whit1),
                          // focusColor: mycolor.primary3,
                          value: signUpController.agree.value,
                          onChanged: (value) {
                             signUpController.agree = (value ?? false) as RxBool;
                          },
                        ),
                        titleText(
                            "By continuing you accept our Privacy\nPolicy and Term of Use",
                            context,
                            14,
                            FontWeight.w400,
                            clr: Color(0xffA1A1A1))
                      ],
                    ),
                  ],
                ),
              ),


              Gap(80.h),
              Obx(() => TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()){
                      signUpController.signUpwithemail();
                    }

                  },
                  child: signUpController.loading.value
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
                              "Signup",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
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
                      height: 1.5,
                    ),
                  ),
                  Gap(8),
                  titleText("Or Continue With", context, 14, FontWeight.w700),
                  Gap(8),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      height: 1.5,

                    ),
                  ),
                ],
              ),
              Gap(32.h),
              Center(child: Image.asset("assets/fb.png")),
              Gap(20.h),
              Center(
                child: TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    child: titleText("Already have an account? Login", context,
                        16, FontWeight.w800)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
