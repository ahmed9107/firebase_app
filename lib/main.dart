import 'package:firebase_app/controllers/auth_controller.dart';
import 'package:firebase_app/routes/app_routes.dart';
import 'package:firebase_app/utils/constants/theme.dart';
import 'package:firebase_app/view/pages/auth/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'utils/helpers/dependencies.dart' as dependency;
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
 /*  await dependency.init(); */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      home: const SplashScreen(),
      initialRoute: AppRoute.login,
      getPages: AppRoute.routes
    );
  }
}