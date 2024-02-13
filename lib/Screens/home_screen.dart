import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vencat/Screens/project_list_screen.dart';

import 'Project_Create_Screens/create_project_overview_screen.dart';
import 'Project_View_Screens/project_display_main_screen.dart';
import 'User_Screens/login_screen.dart';
import 'User_Screens/sign_up_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static void _MustLoginOrSingUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('User Not Found !'),
          content: Text(
              'Please Login using your account or Sing up for a new accunt '),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => LoginScreentut(),
                );
              },
              child: Text('Login in'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => SignUpForm(),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.yellow.shade200, width: 3),
                ),
                height: 80,
                width: 80,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => ProjectDisplayMainScreen());
                  },
                  child: Text("Marawan mathazarsh"),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.yellow.shade800, width: 4),
                ),
                height: 130,
                width: 80,
                child: TextButton(
                  child: Text("Search Projects"),
                  onPressed: () {
                    Get.to(() => ProjectListScreen());
                  },
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.yellow.shade200, width: 3),
                ),
                width: 80,
                height: 100,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => SignUpForm());
                  },
                  child: Text("Manager"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.yellow.shade200, width: 3),
                ),
                width: 80,
                height: 100,
                child: TextButton(
                  child: Text("expansion"),
                  onPressed: () {

                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.yellow.shade200, width: 3),
                    ),
                    width: 80,
                    height: 100,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => CreateProjectOverviewScreen());
                      },
                      child: Text("Overview"),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
