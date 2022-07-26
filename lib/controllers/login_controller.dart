import 'package:firebase_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final bool _emailError = false;
  bool get emailError => _emailError;
  
  final bool _emptyError = false;
  bool get emptyError => _emptyError;
  
  final bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  bool isHidePassword = true;

  showPassword(){
    isHidePassword = !isHidePassword;
    update();
  }

  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
