import 'package:firebase_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController implements GetxService{

  late TextEditingController user;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    user = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  /* goToLogin() {
    Get.offNamed(AppRoute.login);
  } */


  final bool _emailError = false;
  bool get emailError => _emailError;
  
  final bool _nameError = false;
  bool get nameError => _nameError;
  
  final bool _phoneError = false;
  bool get phoneError => _phoneError;
  
  final bool _passError = false;
  bool get passError => _passError;

  final bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  bool isHidePassword = true;

  showPassword(){
    isHidePassword = !isHidePassword;
    update();
  }

  @override
  void dispose() {
    user.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
