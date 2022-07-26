import 'package:firebase_app/controllers/signup_controller.dart';
import 'package:firebase_app/utils/helpers/dimensions.dart';
import 'package:firebase_app/view/widgets/auth_widgets/custom_button.dart';
import 'package:firebase_app/view/widgets/auth_widgets/signup_login_text.dart';
import 'package:firebase_app/view/widgets/auth_widgets/socialmedia_auth.dart';
import 'package:firebase_app/view/widgets/custom_input_field.dart';
import 'package:firebase_app/view/widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignUpController>(
        builder: (controller) {
          return !controller.isLoaded ? SingleChildScrollView(
            child: Form(
              key: controller.formstate,
              child: Column(
                children: [
                  SizedBox(height: Dimensions.screenHeight *0.05,),
                  SizedBox(
                    height: Dimensions.screenHeight *0.25,
                    child: Center(child: Image.asset(
                      'assets/images/cart.png',
                      width: Dimensions.width100
                    )),
                  ),
                  CustomInputField(
                    type: TextInputType.emailAddress,
                    title: 'Email',
                    hint: 'Enter your Email',
                    controller:controller.email,
                    bgColor: controller.emailError
                        ? Colors.red.withOpacity(0.5)
                        : const Color(0xFFCECECE),
                    suffixIcon: Icons.email,
                  ),
                  CustomInputField(
                    type: TextInputType.text,
                    title: 'Name',
                    hint: 'Enter your Name',
                    controller:controller.user,
                    bgColor: controller.nameError
                        ? Colors.red.withOpacity(0.5)
                        : const Color(0xFFCECECE),
                    suffixIcon: Icons.person_outline,
                  ),
                  CustomInputField(
                    type: TextInputType.number,
                    title: 'Phone',
                    hint: 'Enter your Phone Number',
                    controller:controller.phone,
                    bgColor: controller.phoneError
                        ? Colors.red.withOpacity(0.5)
                        : const Color(0xFFCECECE),
                    suffixIcon: Icons.phone_android_outlined
                  ),
                  CustomInputField(
                    type: TextInputType.text,
                    title: 'Password',
                    hint: 'Enter your password',
                    obscure: controller.isHidePassword,
                    controller:controller.password,
                    bgColor: controller.passError
                        ? Colors.red.withOpacity(0.5)
                        : const Color(0xFFCECECE),
                    suffixIcon: Icons.remove_red_eye,
                    showPass: () {controller.showPassword();},
                  ),
                  SizedBox(height: Dimensions.height15),
                  CustomButtonAuth(
                    text: 'Sign Up',
                    onPressed: (){
                      /* controller.signup().then((status){
                        if(status.isSuccess){
                          Get.offNamed(AppRoute.getInitial());
                        }else{
                          Get.snackbar('Faild', status.message,
                              backgroundColor: Colors.red, colorText: Colors.white);
                        }
                      }); */
                    }
                  ),
                  SizedBox(height: Dimensions.height20),
                  SocialMediaAuth(),
                  SizedBox(height: Dimensions.height25),
                  CustomTextSignUpOrSignIn(
                    onTap: () {
                      controller.goToLogin();
                    },
                    textone: 'Already have an account',
                    texttwo: 'Login',
                  ),
                ],
              ),
            ),
          ) : const CustomLoader();
        }
      ),
    );
  }
}