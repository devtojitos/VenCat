import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
      child: Drawer(elevation: 3,
        backgroundColor: Colors.yellow.shade200,
        width: MediaQuery.of(context).size.width*0.45,
        child: Column(
          children: [
            TextButton(
              onPressed: null,
              child: Text("Your Projects"),
            ),
          ],
        ),
      ),
    );
  }
}
