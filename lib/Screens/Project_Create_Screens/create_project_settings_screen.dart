import 'package:flutter/material.dart';

class CreateProjectSettingsScreen extends StatelessWidget {
  const CreateProjectSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Settings"),
      ),
      body: Column(
        children: [
          Row(
            children: [Text("visibilty Settings :")],
          )
        ],
      ),
    );
  }
}
