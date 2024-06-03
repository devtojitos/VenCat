import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Screens/Admin_Screens/admin_home_screen.dart';
import '../../Screens/User_Screens/login_screen.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Drawer(
        elevation: 3,
        backgroundColor: Colors.yellow.shade200,
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          children: [
            TextButton(
              onPressed: null,
              child: Text("Your Projects"),
            ),
            TextButton(
              onPressed: () {
                _showLogoutConfirmationDialog(context);
              },
              child: Text("Logout"),
            ),
            FirebaseAuth.instance.currentUser!.uid ==
                    "6ucyx2wrjOacI0PLdwd3OywUT5k1"
                ? TextButton(
                    onPressed: () {
                      Get.to(() => AdminHomeScreen());
                    },
                    child: Text("adminsys"))
                : Container()
          ],
        ),
      ),
    );
  }
}

Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreentut()),
                (Route<dynamic> route) => false,
              );
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}
