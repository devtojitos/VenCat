import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vencat/Widgets/common_widgets/your_project_card_widget.dart';

import '../../DataModel/ProjectModel/project_model.dart';
import '../../Firebase/project_list_firebase.dart';

class CustomColumnWidget extends StatelessWidget {
  const CustomColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UserProjectService _userProjectService = UserProjectService();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Your Projects",
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.28,
          child: FutureBuilder(
            future: _userProjectService.GetAllProjectByUserId(
                FirebaseAuth.instance.currentUser!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Center(
                    child:
                    CircularProgressIndicator()); // Display a loading indicator while fetching data.
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<ProjectModel>? projects = snapshot.data;
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: projects!.length,
                    itemBuilder:
                        (BuildContext context, int index) {
                      ProjectModel project = projects![index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: YourProjectCardWidget(
                          data: project,
                        ),
                      );
                    });
              }
              return Text("no data");
            },
          ),
        ),
      ],
    );
  }
}
