import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vencat/DataModel/nav_item_model.dart';
import 'package:vencat/Firebase/project_details_firebase.dart';
import 'package:vencat/Screens/project_list_screen.dart';
import 'package:vencat/Screens/your_projects_screen.dart';
import '../Widgets/common_widgets/custom_bottom_nav_bar_widget.dart';
import '../Widgets/common_widgets/custom_row_appbar_widget.dart';
import '../Widgets/common_widgets/custome_column_widget.dart';
import 'Project_Create_Screens/create_tabview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProjectService _projectService = ProjectService();
  bool isVisibileP = false;

  void checkuserprojects() {
    if (_projectService
            .checkIfUserHasProject(FirebaseAuth.instance.currentUser!.uid) !=
        false) {
      isVisibileP = true;
    }
  }

  @override
  void initState() {
    super.initState();
    checkuserprojects();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow,
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
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomRowAppbarWidget(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Card(
                            child: Image.asset(
                                fit: BoxFit.fill,
                                height: 100,
                                width: 280,
                                "assets/images/bannerjoin.jpg"),
                          ),
                        ),
                        Visibility(
                          visible: isVisibileP,
                          child: const CustomColumnWidget(),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Most Viewed",
                              style: TextStyle(fontSize: 24),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => const CreateTabviewScreen());
                                },
                                child: const Text("to here"))
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: FutureBuilder(
                            future: null,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                  itemBuilder: (BuildContext context, int index) {
                                return const Card();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Top Hub Posts",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Card(
                                    color: Colors.grey,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.55,
                                      height:
                                          MediaQuery.of(context).size.height * 0.15,
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Get.to(() =>  YourProjectsScreen());
                                      },
                                      child: const Text("Your projects"))
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Tools",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Card(
                                    color: Colors.green,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.35,
                                      height:
                                          MediaQuery.of(context).size.height * 0.15,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                height: 80,
                                                child: ListView(
                                                  padding: const EdgeInsets.all(8),
                                                  scrollDirection: Axis.horizontal,
                                                  children: const [
                                                    Column(
                                                      children: [
                                                        Icon(
                                                          Icons.add,
                                                          size: 40,
                                                        ),
                                                        Text("Add Project")
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 60,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Icon(
                                                          Icons.money,
                                                          size: 40,
                                                        ),
                                                        Text("Financial Inquiries")
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Hot Projects",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: FutureBuilder(
                            future: null,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                  itemBuilder: (BuildContext context, int index) {
                                return const Card();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
