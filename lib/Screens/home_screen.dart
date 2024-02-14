import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vencat/Screens/project_list_screen.dart';
import 'package:vencat/Widgets/home_widgets/custom_drawer_widget.dart';

import 'Project_Create_Screens/create_project_overview_screen.dart';
import 'Project_View_Screens/project_display_main_screen.dart';
import 'User_Screens/login_screen.dart';
import 'User_Screens/sign_up_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static void _MustLoginOrSingUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('User Not Found !'),
          content: Text(
              'Please Login using your account or Sing up for a new accunt '),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => LoginScreentut(),
                );
              },
              child: Text('Login in'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => SignUpForm(),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        );
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey, // Assign a key to the Scaffold

        body: Stack(
          children: [
            Image.asset(
              "assets/images/officebackground.png",
              height: double.infinity,
              scale: 1,
              fit: BoxFit.fill,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 40,),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 160,
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    titlePadding: EdgeInsets.all(1),
                                    backgroundColor: Colors.yellow.shade200,
                                    title: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(9),
                                            side: BorderSide(
                                                width: 3,
                                                color: Colors.blue.shade700),
                                          ),
                                          shadowColor: Colors.blue,
                                          elevation: 3,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons
                                                      .handsHoldingCircle,
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "Projects",
                                                  style: TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(9),
                                            side: BorderSide(
                                                width: 3,
                                                color: Colors.blue.shade700),
                                          ),
                                          shadowColor: Colors.blue,
                                          elevation: 3,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.rss,
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "Feed",
                                                  style: TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(9),
                                            side: BorderSide(
                                                width: 3,
                                                color: Colors.blue.shade700),
                                          ),
                                          shadowColor: Colors.blue,
                                          elevation: 3,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.listCheck,
                                                  size: 10,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "Tasks",
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    content: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Card(
                                        elevation: 3,
                                        child: Container(
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.2,
                                          width: MediaQuery.of(context).size.width *
                                              0.6,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(9),
                                            border: Border.all(
                                                width: 3,
                                                color: Colors.brown.shade800),
                                          ),
                                          child: ListView.builder(
                                            itemCount: 3,
                                            itemBuilder: (context, index) {
                                              return Card(
                                                child: Row(
                                                  children: [
                                                    Column(),
                                                    Column(),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(3),
                                    actionsPadding: EdgeInsets.all(2),
                                    actionsAlignment: MainAxisAlignment.center,
                                    actions: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
                                            onPressed: () {
                                              // Close the dialog
                                              Navigator.of(context).pop();
                                              Get.to(() => CreateProjectOverviewScreen());

                                            },
                                            child: Text('Your Projects'),
                                          ),
                                          SizedBox(width: 4,),

                                          TextButton(
                                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
                                            onPressed: () {

                                              // Close the dialog
                                              Navigator.of(context).pop();
                                              Get.to(() => ProjectListScreen());

                                            },
                                            child: Text('Search Projects'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Manager",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(height: 60,),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 60,),
                        Container(
                          height: 200,
                          width: 140,
                          child: TextButton(
                            child: Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Finance",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    titlePadding: EdgeInsets.all(1),
                                    backgroundColor: Colors.yellow.shade200,
                                    title: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(9),
                                            side: BorderSide(
                                                width: 3,
                                                color: Colors.blue.shade700),
                                          ),
                                          shadowColor: Colors.blue,
                                          elevation: 3,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons
                                                      .fileLines,
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "Reports",
                                                  style: TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(9),
                                            side: BorderSide(
                                                width: 3,
                                                color: Colors.blue.shade700),
                                          ),
                                          shadowColor: Colors.blue,
                                          elevation: 3,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.rss,
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "Feed",
                                                  style: TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(9),
                                            side: BorderSide(
                                                width: 3,
                                                color: Colors.blue.shade700),
                                          ),
                                          shadowColor: Colors.blue,
                                          elevation: 3,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.listCheck,
                                                  size: 10,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "Tasks",
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    content: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Card(
                                        elevation: 3,
                                        child: Container(
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                          width: MediaQuery.of(context).size.width *
                                              0.6,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(9),
                                            border: Border.all(
                                                width: 3,
                                                color: Colors.brown.shade800),
                                          ),
                                          child: ListView.builder(
                                            itemCount: 3,
                                            itemBuilder: (context, index) {
                                              return Card(
                                                child: Row(
                                                  children: [
                                                    Column(),
                                                    Column(),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(3),
                                    actionsPadding: EdgeInsets.all(2),
                                    actionsAlignment: MainAxisAlignment.center,
                                    actions: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
                                            onPressed: () {
                                              // Close the dialog
                                              Navigator.of(context).pop();
                                              Get.to(() => CreateProjectOverviewScreen());

                                            },
                                            child: Text('Your Projects'),
                                          ),
                                          SizedBox(width: 4,),
                                          TextButton(
                                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
                                            onPressed: () {

                                              // Close the dialog
                                              Navigator.of(context).pop();
                                              Get.to(() => ProjectListScreen());

                                            },
                                            child: Text('Search Projects'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 40,),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    width: 4,
                    color: Colors.white70,
                  ),
                ),
                height: 60,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState!
                              .openDrawer(); // Open the drawer
                        },
                        child: Icon(
                          Icons.menu,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(color: Colors.white)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: ClipRect(
                              clipBehavior: Clip.hardEdge,
                              child: CachedNetworkImage(
                                height: 20,
                                imageUrl:
                                    "https://e7.pngegg.com/pngimages/906/448/png-clipart-silhouette-person-person-with-helmut-animals-logo-thumbnail.png",
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: CustomDrawerWidget(),
      ),
    );
  }
}
