import 'package:flutter/material.dart';

import '../../DataModel/ProjectModel/project_model.dart';

class YourProjectListTile extends StatelessWidget {
  YourProjectListTile({super.key, this.data});

  final ProjectModel? data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "${data!.projectBusinessModel?.businessBasicInfoModel!.businessTitle}",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

class YourProjectsFutureList extends StatelessWidget {
  YourProjectsFutureList({super.key, this.data});

  final Future<List<ProjectModel>>? data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            List projects = snapshot.data!.toList();
            return ListView.builder(
                itemCount: projects.length,
                itemBuilder: (BuildContext context, int index) {
                  ProjectModel projectModel = projects[index];
                  return ListTile(
                    title: Text(projectModel.projectBusinessModel!
                        .businessBasicInfoModel!.businessTitle),

                  );
                });
          } else {
            return const Text("no Data found");
          }
        });
  }
}
