import 'package:firebase_app/routes/app_routes.dart';
import 'package:firebase_app/view/pages/auth/login_page/login_page.dart';
import 'package:firebase_app/view/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController userController;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  bool _emailError = false;
  bool get emailError => _emailError;
  final bool _emptyError = false;
  bool get emptyError => _emptyError;
  bool _nameError = false;
  bool get nameError => _nameError;
  bool _phoneError = false;
  bool get phoneError => _phoneError;
  bool _passError = false;
  bool get passError => _passError;
  final bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  bool isHidePassword = true;

  showPassword(){
    isHidePassword = !isHidePassword;
    update();
  }

  goToSignUp() {
    Get.toNamed(AppRoute.signup);
  }

  goToLogin() {
    Get.toNamed(AppRoute.login);
  }

  @override
  void onInit() {
    emailController= TextEditingController();
    passwordController = TextEditingController();
    userController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  // User comes from firebase_auth package and it's include: email, passwoed, name ....
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialPage);
  }

  _initialPage(User? user){
    if(user == null){
      Get.offAll(()=> const LoginPage());
    }else{
      Get.offAll(()=> const HomePage());
    }
  }

  void login(String email, String password) {
    if (!GetUtils.isEmail(emailController.text.trim()) || emailController.text.trim().isEmpty) {
      _emailError = true;
      update();
      return;
    }
    try {
      auth.signInWithEmailAndPassword(
        email: email, password: password
      );
    } catch (e) {
      rethrow;
    }
  }

  void signup(String email, String name, String password, String phone) {
    if (!GetUtils.isEmail(emailController.text.trim()) || emailController.text.trim().isEmpty) {
      _emailError = true;
      update();
      return;
    }
    if (!GetUtils.isUsername(userController.text.trim()) ||
        userController.text.trim().isEmpty ||
        userController.text.trim().length < 3 ||
        userController.text.trim().length > 20) {
      _emailError = false;
      _nameError = true;
      update();
      return;
    }
    if (!GetUtils.isPhoneNumber(phoneController.text.trim()) ||
        phoneController.text.trim().isEmpty ||
        phoneController.text.trim().length < 6 ||
        phoneController.text.trim().length > 20) {
      _emailError = false;
      _nameError = false;
      _phoneError = true;
      update();
      return;
    }
    if (passwordController.text.trim().isEmpty ||
        passwordController.text.trim().length < 8 ||
        passwordController.text.trim().length > 30) {
      _emailError = false;
      _nameError = false;
      _phoneError = false;
      _passError = true;
      update();
      return;
    }
    try {
      auth.createUserWithEmailAndPassword(
        email: email, password: password
      );
    } catch (e) {
      rethrow;
    }
  }
}