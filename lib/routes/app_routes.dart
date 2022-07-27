import 'package:firebase_app/view/pages/auth/login_page/login_page.dart';
import 'package:firebase_app/view/pages/auth/sign_up_page/signup_page.dart';
import 'package:firebase_app/view/pages/home_page.dart';
import 'package:get/get.dart';

class AppRoute {
  /* static const String splashPage = "/splash-page";
  static const String onboarding = "/onboarding"; */
  static const String initial = "/";
  static const String login = "/login";
  static const String signup = "/signup";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomePage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: signup, page: () => const SignUpPage()),
    
    /* GetPage(
      name: onboarding,
      page: () => const Onboarding(),
      middlewares: [AppMiddleware(sharedPref: Get.find())],
    ), */
  ];
}
