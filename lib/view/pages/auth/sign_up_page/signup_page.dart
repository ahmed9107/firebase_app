import 'package:firebase_app/controllers/auth_controller.dart';
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
      body: GetBuilder<AuthController>(
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
                      'assets/images/a.png',
                      width: Dimensions.width100
                    )),
                  ),
                  CustomInputField(
                    type: TextInputType.emailAddress,
                    hint: 'Enter your Email',
                    controller:controller.emailController,
                    bgColor: controller.emailError
                        ? Colors.red.withOpacity(0.5)
                        : const Color(0xFFCECECE),
                    suffixIcon: Icons.email,
                  ),
                  CustomInputField(
                    type: TextInputType.text,
                    hint: 'Enter your Name',
                    controller:controller.userController,
                    bgColor: controller.nameError
                        ? Colors.red.withOpacity(0.5)
                        : const Color(0xFFCECECE),
                    suffixIcon: Icons.person_outline,
                  ),
                  CustomInputField(
                    type: TextInputType.number,
                    hint: 'Enter your Phone Number',
                    controller:controller.phoneController,
                    bgColor: controller.phoneError
                        ? Colors.red.withOpacity(0.5)
                        : const Color(0xFFCECECE),
                    suffixIcon: Icons.phone_android_outlined
                  ),
                  CustomInputField(
                    type: TextInputType.text,
                    hint: 'Enter your password',
                    obscure: controller.isHidePassword,
                    controller:controller.passwordController,
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
                      controller.signup(
                        controller.emailController.text.trim(),
                        controller.userController.text.trim(),
                        controller.passwordController.text.trim(),
                        controller.phoneController.text.trim(),
                      );
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