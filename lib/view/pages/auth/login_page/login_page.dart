import 'package:firebase_app/controllers/login_controller.dart';
import 'package:firebase_app/utils/helpers/dimensions.dart';
import 'package:firebase_app/view/widgets/auth_widgets/custom_button.dart';
import 'package:firebase_app/view/widgets/auth_widgets/signup_login_text.dart';
import 'package:firebase_app/view/widgets/auth_widgets/socialmedia_auth.dart';
import 'package:firebase_app/view/widgets/big_text.dart';
import 'package:firebase_app/view/widgets/custom_input_field.dart';
import 'package:firebase_app/view/widgets/custom_loader.dart';
import 'package:firebase_app/view/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
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
                  SizedBox(height: Dimensions.height20),
                  Container(
                    margin: EdgeInsets.only(left: Dimensions.width15, right:Dimensions.width15),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: 'Welcome', color: Colors.black, size: Dimensions.font32),
                        SizedBox(height: Dimensions.height10),
                        const SmallText(text: 'Sign in to your account'),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height25),
                  CustomInputField(
                    type: TextInputType.emailAddress,
                    title: 'Email',
                    hint: 'Enter your Email',
                    controller:controller.emailController,
                    bgColor: controller.emailError
                        ? Colors.red.withOpacity(0.5)
                        : const Color(0xFFCECECE),
                    suffixIcon: Icons.email,
                  ),
                  CustomInputField(
                    type: TextInputType.text,
                    title: 'Password',
                    hint: 'Enter your password',
                    obscure: controller.isHidePassword,
                    controller:controller.passwordController,
                    bgColor: controller.emptyError
                        ? Colors.red.withOpacity(0.5)
                        : const Color(0xFFCECECE),
                    suffixIcon: Icons.remove_red_eye,
                    showPass: () {controller.showPassword();},
                  ),
                  SizedBox(height: Dimensions.height15),
                  CustomButtonAuth(
                    text: 'Login', 
                    onPressed: () {
                      /* controller.login().then((status) {
                        if(status.isSuccess){
                          Get.offNamed(AppRoute.getInitial());
                        } else {
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
                      controller.goToSignUp();
                    },
                    textone: 'Don\'t have an account?',
                    texttwo: 'Create',
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