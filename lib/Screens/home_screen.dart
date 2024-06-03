import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vencat/Screens/your_projects_screen.dart';

import 'Project_Create_Screens/create_tabview_screen.dart';
import 'User_Screens/login_screen.dart';
import 'User_Screens/sign_up_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Row(
              children: [
                Icon(Icons.schedule),
                Text("VenCat"),
              ],
            ),
            actions: [
              CircleAvatar(
                radius: 20,
                child: Icon(Icons.message),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.person),
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your Projects",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: FutureBuilder(
                          future: null,
                          builder: (context, snapshot) {
                            return ListView.builder(itemBuilder:
                                (BuildContext context, int index) {
                              return const Card();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Hot Projects",
                      style: TextStyle(fontSize: 24),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => CreateTabviewScreen());
                        },
                        child: Text("to here"))
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
                              width:
                                  MediaQuery.of(context).size.width * 0.55,
                              height:
                                  MediaQuery.of(context).size.height * 0.15,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.to(() => YourProjectsScreen());
                              },
                              child: Text("Your projects"))
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
                              width:
                                  MediaQuery.of(context).size.width * 0.35,
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
                  "Most Viewed Projects",
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Column(),
                    Column(),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
