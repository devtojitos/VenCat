import 'package:flutter/material.dart';

class TrialHomeScreen extends StatelessWidget {
  const TrialHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
        ],
      ),
    );
  }
}
