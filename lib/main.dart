import 'package:firebase_core/firebase_core.dart';
import 'package:fixy/app/data/services/sharepreference.dart';
import 'package:fixy/app/data/services/theme_services.dart';
import 'package:fixy/app/ui/pages/auth_page.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //initialRoute: Routes.SPLASH,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeServices().theme,
      defaultTransition: Transition.fade,
      //initialBinding: Binding(),
      //initialBinding: SplashBinding(),
      //getPages: AppPages.pages,
      home: const AuthPage(),
    );
  }
}
