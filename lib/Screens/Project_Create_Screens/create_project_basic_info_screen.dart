import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vencat/DataModel/cities_model.dart';

import '../../DataModel/ProjectModel/BusinessModel/BasicInfoModel/project_business_basic_info_model.dart';
import '../../DataModel/ProjectModel/BusinessModel/project_business_model.dart';
import '../../DataModel/lists/cities_lists.dart';
import '../../DataModel/lists/project_types_list.dart';
import '../../Firebase/project_details_firebase.dart';
import '../../StateController/basic_info_state.dart';
import 'create_project_marketing_screen.dart';
import 'create_project_overview_screen.dart';

class CreateProjectInitScreen extends StatefulWidget {
  CreateProjectInitScreen({Key? key, required this.onSave}) : super(key: key);
  final VoidCallback onSave;

  @override
  State<CreateProjectInitScreen> createState() =>
      _CreateProjectInitScreenState();

}

class _CreateProjectInitScreenState extends State<CreateProjectInitScreen> {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  final ProjectSelectedStateController _projectSelectedStateController =
      Get.put(ProjectSelectedStateController());

  final ProjectService projectServices = ProjectService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late TextEditingController investmentCapitalController =
      TextEditingController();
  final TextEditingController partnersNumberController =
      TextEditingController();

  String selectedBusinessType = "Commerce";
  String? selectedBusinessField;
  String? selectedLocationCity;
  String? selectedLocationArea;
  CitiesModel citiesModel = CitiesModel();

  List<String>? locationAreas = [];
  List<String>? businessFields = [];

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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Divider(
                                thickness: 3,
                                color: Colors.blue,
                                height: 26,
                                indent:
                                    MediaQuery.of(context).size.width * 0.12,
                              ),
                              const Text(
                                "Title : ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.yellow.shade700, width: 3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: titleController,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Divider(
                                thickness: 3,
                                color: Colors.blue,
                                height: 24,
                                indent:
                                    MediaQuery.of(context).size.width * 0.26,
                              ),
                              Text(
                                "Description : ",
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.yellow.shade700, width: 3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: descriptionController,
                            maxLines: null,
                            textInputAction: TextInputAction.newline,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Business Type : ",
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.yellow.shade700, width: 3),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  dropdownColor: Colors.grey.shade200,
                                  value: selectedBusinessType,
                                  items: businessType.map((type) {
                                    return DropdownMenuItem<String>(
                                      value: type,
                                      child: Text(type),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        selectedBusinessType = value.toString();
                                        businessFields = _getBusinessFields(
                                            selectedBusinessType);
                                        selectedBusinessField =
                                            null; // Reset selectedBusinessField
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Business Field : ",
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 3, color: Colors.yellow.shade700),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  dropdownColor: Colors.grey.shade200,
                                  value: selectedBusinessField,
                                  items: businessFields?.map((field) {
                                    return DropdownMenuItem<String>(
                                      value: field,
                                      child: Text(field),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        selectedBusinessField =
                                            value.toString();
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Text(
                                    "Investment Capital :",
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.yellow.shade700, width: 3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                controller: investmentCapitalController,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Divider(
                                    thickness: 3,
                                    color: Colors.blue,
                                    height: 24,
                                    indent: MediaQuery.of(context).size.width *
                                        0.41,
                                  ),
                                  Text(
                                    "Partners Number :",
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.yellow.shade700, width: 3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                controller: partnersNumberController,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Divider(
                                thickness: 3,
                                color: Colors.blue,
                                height: 24,
                                indent:
                                    MediaQuery.of(context).size.width * 0.21,
                              ),
                              Text(
                                "Location : ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.yellow.shade700, width: 3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("City"),
                                  DropdownButton(
                                    value: selectedLocationCity,
                                    items: egyptCities?.map((city) {
                                      return DropdownMenuItem<String>(
                                        value: city,
                                        child: Text(city),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedLocationCity = value.toString();
                                        // Set corresponding location areas based on the selected city
                                        locationAreas = _getLocationAreas(
                                            selectedLocationCity);
                                        selectedLocationArea =
                                            locationAreas?[0];
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Area"),
                                  DropdownButton(
                                    value: selectedLocationArea,
                                    items: locationAreas?.map((area) {
                                      return DropdownMenuItem<String>(
                                        value: area,
                                        child: Text(area),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedLocationArea = value.toString();
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.grey),
                        onPressed: () async {
                          BusinessBasicInfoModel basicInfoModel =
                              BusinessBasicInfoModel(
                            businessField: selectedBusinessField.toString(),
                            businessCapital:
                                int.parse(investmentCapitalController.text),
                            businessDescription: descriptionController.text,
                            businessLocationArea:
                                selectedLocationArea.toString(),
                            businessLocationCity:
                                selectedLocationCity.toString(),
                            businessTitle: titleController.text,
                            businessType: selectedBusinessType.toString(),
                            partnersNumber:
                                int.parse(partnersNumberController.text),
                          );
                          ProjectBusinessModel projectBusinessModel =
                              ProjectBusinessModel(
                                  businessBasicInfoModel: basicInfoModel);
                          _projectSelectedStateController
                              .selectedBusinessModel = projectBusinessModel.obs;
                          widget.onSave();
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(fontSize: 26, color: Colors.black),
                        ),
                      ),
                    ),
                    //Save Draft in firebase business basic info model
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getBusinessFields(String? businessType) {
    if (businessType == null) {
      return []; // Default to an empty list if businessType is null
    }
    switch (businessType) {
      case "Commerce":
        return commerceList;
      case "Agriculture":
        return agricultureList;
      case "Service":
        return serviceList;
      case "Manufacturing":
        return manufacturingList;
      default:
        return [];
    }
  }

  List<String>? _getLocationAreas(String? locationCity) {
    if (locationCity == null) {
      return [];
    }
    switch (locationCity) {
      case "Cairo":
        return cairoAreas;
      case "Giza":
        return gizaAreas;
      case "Alexandria":
        return alexandriaAreas;
      case "Dakahlia":
        return dakahliaAreas;
      case "Red Sea":
        return redseaAreas;
      case "Beheira":
        return beheiraAreas;
      case "Fayoum":
        return fayoumAreas;
      case "Gharbiya":
        return gharbiyaAreas;
      case "Ismailia":
        return ismailiaAreas;
      case "Menofia":
        return menofiaAreas;
      case "Minya":
        return minyaAreas;
      case "Qaliubiya":
        return qaliubiyaAreas;
      case "New Valley":
        return newValleyAreas;
      case "Suez":
        return suezAreas;
      case "Aswan":
        return aswanAreas;
      case "Assiut":
        return assiutAreas;
      case "Beni Suef":
        return beniSuefAreas;
      case "Port Said":
        return portSaidAreas;
      case "Damietta":
        return damiettaAreas;
      case "Sharkia":
        return sharqiaAreas;
      case "South Sinai":
        return southSinaiAreas;
      case "Kafr Al sheikh":
        return kafrElSheikhAreas;
      case "Matrouh":
        return marsaMatrouhAreas;
      case "Luxor":
        return luxorAreas;
      case "Qena":
        return qenaAreas;
      case "North Sinai":
        return northSinaiAreas;
      case "Sohag":
        return sohagAreas;
      default:
        return [];
    }
  }
}
