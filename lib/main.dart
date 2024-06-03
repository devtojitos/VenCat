import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Firebase/messaging_firebase.dart';
import 'Screens/User_Screens/login_screen.dart';
import 'Screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance;

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES')],
      path: 'assets/translations',
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}

Future<void> initNotifications() async {
  await FirebaseMessaging.instance.requestPermission();
  final fCMToken = await FirebaseMessaging.instance.getToken();
  print("Token : ${fCMToken}");
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessaging);
}
class LanguageController extends GetxController {
  Rx<Locale> selectedLocale = Rx(const Locale('en', 'US'));

  void changeLanguage(Locale newLocale) {
    selectedLocale.value = newLocale;
    EasyLocalization.of(Get.context!)!.setLocale(newLocale);
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = LanguageController();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VenCat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(bodyMedium: GoogleFonts.baumans(
          textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
        ),
          bodyLarge: GoogleFonts.baumans(
            textStyle: TextStyle(fontSize: 12),
          ),
        ),
      ),

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: languageController.selectedLocale.value,
      fallbackLocale: Get.deviceLocale,
      home: const AuthenticationWrapper(),
    );
  }
}


class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return  HomeScreen();
    }
    return const LoginScreentut();
  }
}
