import 'package:demo/screens/home_screen.dart';
import 'package:demo/services/languages_category_services.dart';
import 'package:demo/utils/app_prefernce.dart';
import 'package:demo/common/app_string.dart';
import 'package:demo/controllers/home_screen_controllerr.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:demo/utils/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'components/bottom_navbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Disables landscape orientations
  ]);

  LanguageCategoryService().categoryList();
  AppPreference.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: HomeScreenController(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppPreference.getBool(AppStrings.onBoardingStart) == true
            ? BottomNavBar()
            : const OnboardingScreen());
  }
}
