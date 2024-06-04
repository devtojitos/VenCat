import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Screens/home_screen.dart';
import '../../Screens/project_list_screen.dart';
import '../../Screens/your_projects_screen.dart';

class CustomBottomNavBarWidget extends StatelessWidget {
  const CustomBottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.6),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                color: Colors.greenAccent.withOpacity(0.3),
                offset: Offset(0, 20),
                blurRadius: 20)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => HomeScreen());
            },
            child: Container(
              child: Column(
                children: [
                  Icon(Icons.home),
                  Text("Home"),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => ProjectListScreen());
            },
            child: Container(
              child: Column(
                children: [
                  Icon(Icons.search),
                  Text("Search"),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => YourProjectsScreen());
            },
            child: Container(
              child: Column(
                children: [
                  Icon(Icons.data_saver_on_outlined),
                  Text("My Projects"),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  Icon(Icons.pentagon),
                  Text("Hub"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
