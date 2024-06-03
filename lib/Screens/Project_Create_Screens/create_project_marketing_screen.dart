import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vencat/StateController/basic_info_state.dart';

import '../../DataModel/ProjectModel/BusinessModel/MarketingModel/project_business_marketing_model.dart';
import '../../Firebase/project_details_firebase.dart';
import 'create_project_overview_screen.dart';

class CreateProjectMarketingScreen extends StatefulWidget {
  CreateProjectMarketingScreen(
      {super.key, required this.onSave, required this.onBack});

  final VoidCallback onSave;
  final VoidCallback onBack;

  @override
  State<CreateProjectMarketingScreen> createState() =>
      _CreateProjectMarketingScreenState();
}

class _CreateProjectMarketingScreenState
    extends State<CreateProjectMarketingScreen> {
  final ProjectSelectedStateController _projectSelectedStateController =
      Get.find();
  final ProjectService projectServices = ProjectService();
  String? selectedMarketingStrategy;
  String? selectedSalesChannel;
  String? selectedMarketGender;
  String? selectedMarketHobbies;
  String? selectedMarketAge;
  List<String> marketingStrategy = [
    "Social Media Marketing",
    "Content Marketing",
    "Email Marketing",
    "Influencer Partnerships",
    "Affiliate Marketing",
    "Events",
    "Public Relations"
  ];
  List<String> targetMarketAge = [
    "Children",
    "Teenagers",
    "Young Adults",
    "Middle aged adults",
    "Seniors"
  ];
  List<String> targetMarketGender = [
    "Male",
    "Female",
    "Both",
  ];
  List<String> targetMarketHobbies = [
    "HouseWife",
    "Student",
    "Service Industry",
    "Arts and Drawing",
    "Sports and Outdoors"
  ];
  List<String> salesChannel = [
    "Online",
    "Retail",
    "Wholesale",
    "Distributors",
    "Direct Sales",
    "Partnerships",
  ];

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
              decoration: const BoxDecoration(
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
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Divider(
                                thickness: 3,
                                color: Colors.blue,
                                height: 24,
                                indent:
                                    MediaQuery.of(context).size.width * 0.45,
                              ),
                              Text(
                                "Marketing Strategy : ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 3, color: Colors.yellow.shade700),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: DropdownButton(
                                value: selectedMarketingStrategy,
                                items: marketingStrategy.map((type) {
                                  return DropdownMenuItem<String>(
                                    value: type,
                                    child: Text(type!),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedMarketingStrategy =
                                        value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              Divider(
                                thickness: 3,
                                color: Colors.blue,
                                height: 24,
                                indent:
                                    MediaQuery.of(context).size.width * 0.35,
                              ),
                              Text(
                                "Sales Channel : ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 3, color: Colors.yellow.shade700),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: DropdownButton(
                                value: selectedSalesChannel,
                                items: salesChannel.map((type) {
                                  return DropdownMenuItem<String>(
                                    value: type,
                                    child: Text(type),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedSalesChannel = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Divider(
                                thickness: 3,
                                color: Colors.blue,
                                height: 24,
                                indent:
                                    MediaQuery.of(context).size.width * 0.35,
                              ),
                              Text(
                                "Target Market : ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Age Group:",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 3, color: Colors.yellow.shade700),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: DropdownButton(
                                    padding: EdgeInsets.all(6),
                                    value: selectedMarketAge,
                                    items: targetMarketAge.map((type) {
                                      return DropdownMenuItem<String>(
                                        value: type,
                                        child: Text(type!),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedMarketAge = value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Gender:",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 3, color: Colors.yellow.shade700),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: DropdownButton(
                                    padding: EdgeInsets.all(6),
                                    value: selectedMarketGender,
                                    items: targetMarketGender.map((type) {
                                      return DropdownMenuItem<String>(
                                        value: type,
                                        child: Text(type!),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedMarketGender = value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Hobbies:",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 3, color: Colors.yellow.shade700),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: DropdownButton(
                                    padding: EdgeInsets.all(6),
                                    value: selectedMarketHobbies,
                                    items: targetMarketHobbies.map((type) {
                                      return DropdownMenuItem<String>(
                                        value: type,
                                        child: Text(type!),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedMarketHobbies =
                                            value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Divider(
                            thickness: 3,
                            color: Colors.blue,
                            height: 24,
                            indent: MediaQuery.of(context).size.width * 0.38,
                          ),
                          Text(
                            "Further Details : ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3, color: Colors.yellow.shade700)),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Upload your file"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            widget.onBack;
                          },
                          child: Text("back"),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.grey),
                            onPressed: () {
                              BusinessMarketingModel businessMarketingModel =
                                  BusinessMarketingModel(
                                      salesChannel:
                                          selectedSalesChannel.toString(),
                                      marketingStrategy:
                                          selectedMarketingStrategy.toString(),
                                      detailsPdf: "pricingPdf",
                                      targetMarketAge:
                                          selectedMarketAge.toString(),
                                      targetMarketGender:
                                          selectedMarketGender.toString(),
                                      targetMarketHobbies:
                                          selectedMarketHobbies.toString());
                              _projectSelectedStateController
                                      .selectedBusinessModel
                                      .value
                                      .businessMarketingModel =
                                  businessMarketingModel;
                              print(_projectSelectedStateController
                                  .selectedBusinessModel
                                  .value
                                  .businessBasicInfoModel!
                                  .businessDescription
                                  .toString());
                              print(_projectSelectedStateController
                                  .selectedBusinessModel
                                  .value
                                  .businessMarketingModel!
                                  .salesChannel
                                  .toString());
                              widget.onSave();
                            },
                            child: Text(
                              "Save",
                              style:
                                  TextStyle(fontSize: 26, color: Colors.black),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
