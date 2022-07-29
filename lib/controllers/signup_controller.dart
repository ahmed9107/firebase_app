/* import 'package:firebase_app/routes/app_routes.dart';
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

  bool _emailError = false;
  bool get emailError => _emailError;
  
  bool _nameError = false;
  bool get nameError => _nameError;
  
  bool _phoneError = false;
  bool get phoneError => _phoneError;
  
  bool _passError = false;
  bool get passError => _passError;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  signup() async {
    if (!GetUtils.isEmail(email.text.trim()) || email.text.trim().isEmpty) {
      _emailError = true;
      update();
      return;
      //return ResponseModel(false, 'Not valid email!');
    }
    if (!GetUtils.isUsername(user.text.trim()) ||
        user.text.trim().isEmpty ||
        user.text.trim().length < 3 ||
        user.text.trim().length > 20) {
      _emailError = false;
      _nameError = true;
      update();
      return;
      //return ResponseModel(false, 'Not valid Name!');
    }
    if (!GetUtils.isPhoneNumber(phone.text.trim()) ||
        phone.text.trim().isEmpty ||
        phone.text.trim().length < 6 ||
        phone.text.trim().length > 20) {
      _emailError = false;
      _nameError = false;
      _phoneError = true;
      update();
      return;
      //return ResponseModel(false, 'Not valid phone number!');
    }
    if (password.text.trim().isEmpty ||
          password.text.trim().length < 8 ||
          password.text.trim().length > 30) {
      _emailError = false;
      _nameError = false;
      _phoneError = false;
      _passError = true;
      update();
      return;
      //return ResponseModel(false, 'Not valid Password!');
    }

    /* SignUpModel signupModel = SignUpModel(
        email: email.text.trim(),
        name: user.text.trim(),
        phone: phone.text.trim(),
        password: password.text.trim(),
      );
      _isLoaded = true;
      update();
      Response response = await authRepo.registration(signupModel);
      late ResponseModel responseModel;
      if(response.statusCode == 200){
        authRepo.saveUserToken(response.body["token"]);
        responseModel= ResponseModel(true, response.body["token"]);
      }else{
        responseModel= ResponseModel(false, response.statusText!);
      } */
      _isLoaded = false;
      update();
      //return responseModel;
  }

  goToLogin() {
    Get.toNamed(AppRoute.login);
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
 */