import 'package:flutter/material.dart';

class ProjectUserDisplayMembersScreen extends StatefulWidget {
  const ProjectUserDisplayMembersScreen({super.key});

  @override
  State<ProjectUserDisplayMembersScreen> createState() => _ProjectUserDisplayMembersScreenState();
}

class _ProjectUserDisplayMembersScreenState extends State<ProjectUserDisplayMembersScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.5,
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 60,
              child: Text("Current Members"),
            ),
            Container(
              width: 120,
              height: 60,
              child: Text("Join Requests"),
            )

        ],),),
        Container(
          width: MediaQuery.of(context).size.width*0.5,
          height: double.infinity,
          
        )
      ],
    );
  }
}
