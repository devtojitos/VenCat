import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CreateProjectServiceScreen extends StatefulWidget {
  const CreateProjectServiceScreen({super.key});

  @override
  State<CreateProjectServiceScreen> createState() =>
      _CreateProjectServiceScreenState();
}

class _CreateProjectServiceScreenState
    extends State<CreateProjectServiceScreen> {
  bool softwareSolutionValue = false;
  bool marketAndMarketingValue = false;
  bool accountingAndLegalValue = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
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
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: ListView(
                children: [
                  Card(
                    elevation: 4,
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Container(
                            width: 150,
                            height: 100,
                            child: Image.asset(
                                "assets/images/mainpagebackground.png")),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Software Solutions",
                                style: TextStyle(fontSize: 24),
                              ),
                              Text(
                                "Software SolutionsSoftware SolutionsSoftware SolutionsSoftware SolutionsSoftware SolutionsSoftware Solutions",
                                maxLines: 4,
                              ),
                              Row(
                                children: [
                                  Text("Apply"),
                                  Checkbox(
                                      value: softwareSolutionValue,
                                      onChanged: (value) {
                                        setState(() {
                                          softwareSolutionValue = value!;
                                          print(softwareSolutionValue
                                              .toString());
                                        });
                                      }),

                                  Text("Dont need"),
                                  Checkbox(
                                    value: accountingAndLegalValue,
                                    onChanged: (value) {
                                      setState(() {
                                        accountingAndLegalValue = value!;
                                        print(accountingAndLegalValue
                                            .toString());
                                      });
                                    },),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Container(
                            width: 150,
                            height: 100,
                            child: Image.asset(
                                "assets/images/mainpagebackground.png")),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Market and Marketing",
                                style: TextStyle(fontSize: 24),
                              ),
                              Text(
                                "Software SolutionsSoftware SolutionsSoftware SolutionsSoftware SolutionsSoftware SolutionsSoftware Solutions",
                                maxLines: 4,
                              ),
                              Row(
                                children: [
                                  Text("Apply"),
                                  Checkbox(
                                      value: marketAndMarketingValue,
                                      onChanged: (value) {
                                        setState(() {
                                          marketAndMarketingValue = value!;
                                          print(marketAndMarketingValue
                                              .toString());
                                        });
                                      }),

                                  Text("Dont need"),
                                  Checkbox(
                                    value: accountingAndLegalValue,
                                    onChanged: (value) {
                                      setState(() {
                                        accountingAndLegalValue = value!;
                                        print(accountingAndLegalValue
                                            .toString());
                                      });
                                    },),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Container(
                            width: 150,
                            height: 100,
                            child: Image.asset(
                                "assets/images/mainpagebackground.png")),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Accounting and legal services",
                                style: TextStyle(fontSize: 24),
                              ),
                              Text(
                                "Software SolutionsSoftware SolutionsSoftware SolutionsSoftware SolutionsSoftware SolutionsSoftware Solutions",
                                maxLines: 4,
                              ),
                              Row(
                                children: [
                                  Text("Apply"),
                                  Checkbox(
                                      value: accountingAndLegalValue,
                                      onChanged: (value) {
                                        setState(() {
                                          accountingAndLegalValue = value!;
                                          print(accountingAndLegalValue
                                              .toString());
                                        });
                                      },),

                                  Text("Dont need"),
                                  Checkbox(
                                    value: accountingAndLegalValue,
                                    onChanged: (value) {
                                      setState(() {
                                        accountingAndLegalValue = value!;
                                        print(accountingAndLegalValue
                                            .toString());
                                      });
                                    },),

                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
      
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Container(decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(9)),height: 50,width: 150,child: Center(child: Text("Save",style: TextStyle(color: Colors.black,fontSize: 18),))),
                    ),
                  ),
                ],
              ),
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
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.black,
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
      ),
    );
  }
}
