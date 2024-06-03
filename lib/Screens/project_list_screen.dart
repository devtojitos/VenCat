import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/project_business_model.dart';
import 'package:vencat/Firebase/project_details_firebase.dart';
import 'package:vencat/StateController/basic_info_state.dart';

import '../DataModel/lists/cities_lists.dart';
import '../DataModel/lists/project_types_list.dart';
import 'Project_View_Screens/project_display_main_screen.dart';

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
                future: projectService.GetAllProjectFromFirebase(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    var projects = snapshot.data as List<ProjectBusinessModel>;

                    return CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          floating: true,
                        ),
                        SliverToBoxAdapter(
                          child: Card(
                            elevation: 3,
                            child: ExpansionTileItem(
                              isHasTopBorder: false,
                              isHasBottomBorder: false,
                              tilePadding: EdgeInsets.all(2),
                              isHasTrailing: false,
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.filter_alt,
                                            size: 25,
                                          ),
                                          Container(
                                            height: 25,
                                            child: Text(
                                              "Filter Projects",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue)),
                                        onPressed: () {},
                                        child: Text("Filter"),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.city,
                                            size: 18,
                                          ),
                                          Container(
                                            child: DropdownButton(
                                              isDense: true,
                                              padding: EdgeInsets.all(2),
                                              style: TextStyle(
                                                  fontSize: 12, color: Colors.black),
                                              value: selectedLocationCity,
                                              items: locationCities?.map((city) {
                                                return DropdownMenuItem<String>(
                                                  value: city,
                                                  child: Text(city),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedLocationCity =
                                                      value.toString();
                                                  // Set corresponding location areas based on the selected city
                                                  locationAreas = _getLocationAreas(
                                                      selectedLocationCity);
                                                  selectedLocationArea =
                                                  locationAreas?[0];
                                                });
                                              },
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_pin,
                                                size: 18,
                                              ),
                                              Container(
                                                child: DropdownButton(
                                                  isDense: true,
                                                  padding: EdgeInsets.all(2),
                                                  borderRadius:
                                                  BorderRadius.circular(9),
                                                  iconSize: 18,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                  value: selectedLocationArea,
                                                  items: locationAreas?.map((area) {
                                                    return DropdownMenuItem<String>(
                                                      value: area,
                                                      child: Text(area),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedLocationArea =
                                                          value.toString();
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.people,
                                            ),
                                            onPressed: () {},
                                            tooltip: "Partners Number",
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blue, width: 2),
                                            ),
                                            height: 30,
                                            width: 50,
                                            child: TextField(),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.business,
                                      size: 18,
                                    ),
                                    DropdownButton(
                                      isDense: true,
                                      padding: EdgeInsets.all(2),
                                      borderRadius: BorderRadius.circular(9),
                                      iconSize: 18,
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
                                    Icon(
                                      Icons.business_center,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: DropdownButton(
                                        isDense: true,
                                        padding: EdgeInsets.all(2),
                                        borderRadius: BorderRadius.circular(9),
                                        iconSize: 18,
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
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SliverList.builder(
                          itemCount: projects.length,
                          itemBuilder: (BuildContext context, int index) {
                            var project = projects[index];
                            return Card(
                              color: Colors.white70,
                              elevation: 4,
                              shadowColor: Colors.blue,
                              child: ExpansionTileItem(
                                tilePadding: EdgeInsets.all(2),
                                isHasTrailing: false,
                                title: Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                children: [
                                                  Text(
                                                      ("${project.businessBasicInfoModel?.businessTitle}"),
                                                      style: Get.textTheme
                                                          .bodyMedium),
                                                ],
                                              ),
                                              Divider(
                                                height: 2,
                                                color: Colors.grey,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.date_range,
                                                    size: 20,
                                                  ),
                                                  Text(
                                                    "created on: 12-4-2024",
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .city,
                                                            size: 18,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: Text(
                                                              "${project.businessBasicInfoModel?.businessLocationCity}",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.money,
                                                            size: 18,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: Text(
                                                                "${project.businessBasicInfoModel?.businessField}"),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.people,
                                                            size: 18,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: Text(
                                                              "8/${project.businessBasicInfoModel?.partnersNumber}",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.location_pin,
                                                            size: 18,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: Text(
                                                                "${project.businessBasicInfoModel?.businessLocationArea}",
                                                                style: Get
                                                                    .textTheme
                                                                    .bodyLarge),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .sitemap,
                                                            size: 18,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: Text(
                                                                "${project.businessBasicInfoModel?.businessType}",
                                                                style: Get
                                                                    .textTheme
                                                                    .bodyLarge),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.money,
                                                            size: 18,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: Text(
                                                              "${project.businessBasicInfoModel?.businessCapital}",
                                                              style: Get
                                                                  .textTheme
                                                                  .bodyLarge,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.24,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://st2.depositphotos.com/4035913/6124/i/450/depositphotos_61243831-stock-photo-letter-s-logo.jpg',
                                            ),
                                          ),
                                          Card(
                                            child: Row(
                                              children: [
                                                Icon(Icons.handshake),
                                                Icon(Icons.attach_money)
                                              ],
                                            ),
                                          ),
                                          TextButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.blue),
                                              padding: MaterialStateProperty
                                                  .all<EdgeInsetsGeometry>(
                                                EdgeInsets.all(
                                                    3.0), // Set padding
                                              ),
                                            ),
                                            onPressed: () {
                                              widget
                                                  .selectedProjectStateController
                                                  .selectedBusinessModel
                                                  .value = projects[index];
                                              Get.to(() =>
                                                  ProjectDisplayMainScreen());
                                            },
                                            child: Text(
                                              "View Details",
                                              style: Get.textTheme.bodyLarge,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                subtitle: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  size: 20,
                                ),
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.money),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${project.businessBasicInfoModel?.businessCapital}",
                                                  style:
                                                      Get.textTheme.bodyLarge,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.people),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "8/${project.businessBasicInfoModel?.partnersNumber}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    );
                  }
                  else {
                    return const Text("no Data found");
                  }
                }),
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
