import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/Project_Create_Screens/create_project_basic_info_screen.dart';
import 'Screens/Project_Create_Screens/create_project_finance_screen.dart';
import 'Screens/Project_Create_Screens/create_project_marketing_screen.dart';
import 'Screens/Project_Create_Screens/create_project_overview_screen.dart';
import 'Screens/Project_View_Screens/project_display_chat_room_screen.dart';
import 'Screens/Project_View_Screens/project_display_finance_screen.dart';
import 'Screens/Project_View_Screens/project_display_main_screen.dart';
import 'Screens/Project_View_Screens/project_display_marketing_screen.dart';
import 'Screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      title: 'Flutter Demo',
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
      home: HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final FirebaseApp app;

  const MyHomePage({super.key, required this.title, required this.app});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
    );
  }
}
