import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../DataModel/lists/cities_lists.dart';
import '../../DataModel/lists/project_types_list.dart';
import '../../Firebase/project_details_firebase.dart';
import '../../Screens/project_list_screen.dart';

class FilterProjectsCardWidget extends StatefulWidget {
  const FilterProjectsCardWidget({super.key});

  @override
  State<FilterProjectsCardWidget> createState() => _FilterProjectsCardWidgetState();
}

class _FilterProjectsCardWidgetState extends State<FilterProjectsCardWidget> {
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
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ExpansionTileItem(
        childrenPadding: EdgeInsets.all(3),
        subtitle: Icon(Icons.arrow_downward),
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
                      height: 35,
                      child: Text(
                        "Filter Projects",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                      WidgetStateProperty.all(
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
                  mainAxisAlignment:
                  MainAxisAlignment.start,
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
                            fontSize: 12,
                            color: Colors.black),
                        value: selectedLocationCity,
                        items:
                        locationCities?.map((city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedLocationCity =
                                value.toString();
                            locationAreas =
                                _getLocationAreas(
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
                            items: locationAreas
                                ?.map((area) {
                              return DropdownMenuItem<
                                  String>(
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
    );
  }
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