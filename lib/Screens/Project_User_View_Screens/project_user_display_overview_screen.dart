import 'package:flutter/material.dart';

class ProjectUserDisplayOverviewScreen extends StatelessWidget {
  const ProjectUserDisplayOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height:  MediaQuery.of(context).size.height * 0.3,
          child: Row(
            children: [
              Column(
                children: [
                  Text("Project Members"),
                  Container(),
                  Text("Project Views"),
                  Container(),
                  Text("Join Requests Members")



                ],
              ),
              Column(
                children: [
                  Text("Project Members"),
                  Container(),
                  Text("Project Views"),
                  Container(),
                  Text("Join Requests Members")



                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height:  MediaQuery.of(context).size.height * 0.3,
          child: Row(
            children: [
              Column(
                children: [
                  Text("Project Members"),
                  Container(),
                  Text("Project Views"),
                  Container(),
                  Text("Join Requests Members")



                ],
              ),
              Column(
                children: [
                  Text("Project Members"),
                  Container(),
                  Text("Project Views"),
                  Container(),
                  Text("Join Requests Members")



                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
