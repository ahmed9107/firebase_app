import 'package:firebase_app/view/pages/auth/login_page/login_page.dart';
import 'package:firebase_app/view/pages/auth/sign_up_page/signup_page.dart';
import 'package:firebase_app/view/pages/home_page.dart';
import 'package:firebase_app/view/pages/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splashPage  = "/splash";
  static const String home        = "/home";
  static const String login       = "/login";
  static const String signup      = "/signup";

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: signup, page: () => const SignUpPage()),
  ];
}
