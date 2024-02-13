import 'package:flutter/material.dart';

class CreateProjectOperationScreen extends StatelessWidget {
  const CreateProjectOperationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Operations"),
      ),
      body: const Column(
        children: [
          Row(
            children: [
              Text("Number of Employees:"),
            ],
          ),
          Row(
            children: [
              Text("Job description:"),
            ],
          ),
          Row(
            children: [
              Text("Operation Plan :"),
            ],
          ),
        ],
      ),
    );
  }
}
