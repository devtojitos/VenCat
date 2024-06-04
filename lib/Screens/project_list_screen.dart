import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vencat/Firebase/project_details_firebase.dart';
import 'package:vencat/StateController/basic_info_state.dart';
import '../DataModel/ProjectModel/project_model.dart';
import '../DataModel/lists/cities_lists.dart';
import '../DataModel/lists/project_types_list.dart';
import '../Widgets/common_widgets/custom_bottom_nav_bar_widget.dart';
import '../Widgets/common_widgets/filter_projects_card_widget.dart';
import '../Widgets/common_widgets/project_list_card_widget.dart';

class ProjectListScreen extends StatefulWidget {
  ProjectListScreen({Key? key}) : super(key: key);
  final selectedProjectStateController =
      Get.put(ProjectSelectedStateController());

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class PartnershipOption {
  String? Option;
  int? Color;
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  List<PartnershipOption> partnershipOptions = [];
  ProjectService projectService = ProjectService();
  String? selectedLocationArea;
  String selectedBusinessType = "Commerce";
  String? selectedBusinessField;
  String? selectedLocationCity;
  List<String>? locationCities;
  List<String>? locationAreas;
  List<String>? businessFields = [];

  @override
  void initState() {
    super.initState();
    businessFields = commerceList;

    locationCities = egyptCities; // Set a default value for initialization
    selectedLocationCity = locationCities?[0];
    locationAreas = cairoAreas; // Set a default value for initialization
    selectedLocationArea = locationAreas?[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow.shade200,
        bottomNavigationBar: CustomBottomNavBarWidget(),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.mirror,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.yellow
                  ], // Adjust colors as needed
                ),
              ),
            ),
            FutureBuilder(
                future: projectService.GetAllProjectModel(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    var projects = snapshot.data as List<ProjectModel>;

                    return CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(Icons.arrow_back),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.blue,
                                        radius: 20,
                                        child: Icon(Icons.message),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.blue,
                                        radius: 20,
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: FilterProjectsCardWidget(),
                        ),
                        SliverList.builder(
                          itemCount: projects.length,
                          itemBuilder: (BuildContext context, int index) {
                            var project = projects[index];
                            return ProjectListCardWidget(project: project);
                          },
                        )
                      ],
                    );
                  } else {
                    return const Text("no Data found");
                  }
                }),
          ],
        ),
      ),
    );
  }
}
