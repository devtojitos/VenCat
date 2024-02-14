import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/project_business_model.dart';
import 'package:vencat/Firebase/project_details_firebase.dart';
import 'package:vencat/StateController/basic_info_state.dart';

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
  List<String> businessType = [
    "Commerce",
    "Agriculture",
    "Service",
    "Manufacturing"
  ];
  List<String> serviceList = [
    "Healthcare",
    "Education and training",
    "It and software",
    "Beauty centers and salon",
    "Hospitality and tourism",
    "Financial services",
    "Real estate",
    "Transportation and logistics",
    "Marketing and advertising",
    "Legal services",
    "Event planning",
    "Environmental services",
    "Construction",
    "Pet care",
    "Photography service"
  ];
  List<String> manufacturingList = [
    "Food and Beverage",
    "Textile and Spparel",
    "Chemical and Pharma",
    "Electronics",
    "Heavy-duty Machinery",
    "Tools and Equipment"
  ];
  List<String> agricultureList = [
    "Crop farming",
    "Livestock",
    "Horticulture",
  ];
  List<String> egyptCities = [
    "Cairo",
    "Giza",
    "Alexandria",
    "Dakahlia",
    "Red Sea",
    "Beheira",
    "Fayoum",
    "Gharbiya",
    "Ismailia",
    "Menofia",
    "Minya",
    "Qaliubiya",
    "New Valley",
    "Suez",
    "Aswan",
    "Assiut",
    "Beni Suef",
    "Port Said",
    "Damietta",
    "Sharkia",
    "South Sinai",
    "Kafr Al sheikh",
    "Matrouh",
    "Luxor",
    "Qena",
    "North Sinai",
    "Sohag"
  ];
  List<String> cairoAreas = [
    "15 May",
    "Al Azbakeyah",
    "Al Basatin",
    "Tebin",
    "El-Khalifa",
    "El darrasa",
    "Aldarb Alahmar",
    "Zawya al-Hamra",
    "El-Zaytoun",
    "Sahel",
    "El Salam",
    "Sayeda Zeinab",
    "El Sharabeya",
    "Shorouk",
    "El Daher",
    "Ataba",
    "New Cairo",
    "El Marg",
    "Ezbet el Nakhl",
    "Matareya",
    "Maadi",
    "Maasara",
    "Mokattam",
    "Manyal",
    "Mosky",
    "Nozha",
    "Waily",
    "Bab al-Shereia",
    "Bolaq",
    "Garden City",
    "Hadayek El-Kobba",
    "Helwan",
    "Dar Al Salam",
    "Shubra",
    "Tura",
    "Abdeen",
    "Abaseya",
    "Ain Shams",
    "Nasr City",
    "New Heliopolis",
    "Masr Al Qadima",
    "Mansheya Nasir",
    "Badr City",
    "Obour City",
    "Cairo Downtown",
    "Zamalek",
    "Kasr El Nile",
    "Rehab",
    "Katameya",
    "Madinty",
    "Rod Alfarag",
    "Sheraton",
    "El-Gamaleya",
    "10th of Ramadan City",
    "Helmeyat Alzaytoun",
    "New Nozha",
    "Capital New",
  ];
  List<String> gizaAreas = [
    "Giza",
    "Sixth of October",
    "Cheikh Zayed",
    "Hawamdiyah",
    "Al Badrasheen",
    "Saf",
    "Atfih",
    "Al Ayat",
    "Al-Bawaiti",
    "ManshiyetAl Qanater",
    "Oaseem",
    "Kerdasa",
    "Abu Nomros",
    "Kafr Ghati",
    "Manshiyet Al Bakari",
    "Dokki",
    "Agouza",
    "Haram",
    "Warraq",
    "Imbaba",
    "Boulaq Dakrour",
    "Al Wahat Al Baharia",
    "Omraneya",
    "Moneeb",
    "Bin Alsarayat",
    "Kit Kat",
    "Mohandessin",
    "Faisal",
    "Abu Rawash",
    "Hadayek Alahram",
    "Haraneya",
    "Hadayek October",
    "Saft Allaban",
    "Smart Village",
    "Ard Ellwaa",
  ];
  List<String> alexandriaAreas = [
    "Abu Qir",
    "Al Ibrahimeyah",
    "Azarita",
    "Anfoushi",
    "Dekheila",
    "El Soyof",
    "Ameria",
    "El Labban",
    "Al Mafrouza",
    "El Montaza",
    "Mansheya",
    "Naseria",
    "Ambrozo",
    "Bab Sharq",
    "Bourj Alarab",
    "Stanley",
    "Smouha",
    "Sidi Bishr",
    "Shads",
    "Gheet Alenab",
    "Fleming",
    "Victoria",
    "Camp Shizar",
    "Karmooz",
    "Mahta Alraml",
    "Mina El-Basal",
    "Asafra",
    "Agamy",
    "Bakos",
    "Boulkly",
    "Cleopatra",
    "Glim",
    "Al Mamurah",
    "Al Mandara",
    "Moharam Bek",
    "Elshatby",
    "Sidi Gaber",
    "North Coast/sahel",
    "Alhadra",
    "Alattarin",
    "Sidi Kerir",
    "Elgomrok",
    "Al Max",
    "Marina",
  ];
  List<String> dakahliaAreas = [
    "Mansoura",
    "Talkha",
    "Mitt Ghamr",
    "Dekernes",
    "Aga",
    "Menia El Nasr",
    "Sinbillawin",
    "El Kurdi",
    "Bani Ubaid",
    "Al Manzala",
    "tami al'amdid",
    "aljamalia",
    "Sherbin",
    "Mataria",
    "Belqas",
    "Meet Salsil",
    "Gamasa",
    "Mahalat Damana",
    "Nabroh",
  ];
  List<String> redseaAreas = [
    "Hurghada",
    "Ras Ghareb",
    "Safaga",
    "El Qusiar",
    "Marsa Alam",
    "Shalatin",
    "Halaib",
    "Aldahar",
  ];
  List<String> beheiraAreas = [
    "Damanhour",
    "Kafr El Dawar",
    "Rashid",
    "Edco",
    "Abu al-Matamir",
    "Abu Homs",
    "Delengat",
    "Mahmoudiyah",
    "Rahmaniyah",
    "Itai Baroud",
    "Housh Eissa",
    "Shubrakhit",
    "Kom Hamada",
    "Badr",
    "Wadi Natrun",
    "New Nubaria",
    "Alnoubareya",
  ];
  List<String> fayoumAreas = [
    "Fayoum",
    "Fayoum El Gedida",
    "Tamiya",
    "Snores",
    "Etsa",
    "Epschway",
    "Yusuf El Sediaq",
    "Hadqa",
    "Atsa",
    "Algamaa",
    "Sayala",
  ];
  List<String> gharbiyaAreas = [
    "Tanta",
    "Al Mahalla Al Kobra",
    "Kafr El Zayat",
    "Zefta",
    "El Santa",
    "Qutour",
    "Basion",
    "Samannoud",
  ];
  List<String> ismailiaAreas = [
    "Ismailia",
    "Fayed",
    "Qantara Sharq",
    "Qantara Gharb",
    "El Tal El Kabier",
    "Abu Sawir",
    "Kasasien El Gedida",
    "Nefesha",
    "Sheikh Zayed",
  ];
  List<String> menofiaAreas = [
    "Shbeen El Koom",
    "Sadat City",
    "Menouf",
    "Sars El-Layan",
    "Ashmon",
    "Al Bagor",
    "Quesna",
    "Berkat El Saba",
    "Tala",
    "Al Shohada",
  ];
  List<String> minyaAreas = [
    "Minya",
    "Minya El Gedida",
    "El Adwa",
    "Magagha",
    "Bani Mazar",
    "Mattay",
    "Samalut",
    "Madinat El Fekria",
    "Meloy",
    "Deir Mawas",
    "Abu Qurqas",
    "Ard Sultan",
  ];
  List<String> qaliubiyaAreas = [
    "Banha",
    "Qalyub",
    "Shubra Al Khaimah",
    "Al Qanater Charity",
    "Khanka",
    "Kafr Shukr",
    "Tukh",
    "Qaha",
    "Obour",
    "Khosous",
    "Shibin Al Qanater",
    "Mostorod",
  ];
  List<String> newValleyAreas = [
    "El Kharga",
    "Paris",
    "Mout",
    "Farafra",
    "Balat",
    "Dakhla",
  ];
  List<String> suezAreas = [
    "Suez",
    "Alganayen",
    "Ataqah",
    "Ain Sokhna",
    "Faysal",
  ];
  List<String> aswanAreas = [
    "Aswan",
    "Aswan El Gedida",
    "Drau",
    "Kom Ombo",
    "Nasr Al Nuba",
    "Kalabsha",
    "Edfu",
    "Al-Radisiyah",
    "Al Basilia",
    "Al Sibaeia",
    "Abo Simbl Al Siyahia",
    "Marsa Alam",
  ];
  List<String> assiutAreas = [
    "Assiut",
    "Assiut El Gedida",
    "Dayrout",
    "Manfalut",
    "Qusiya",
    "Abnoub",
    "Abu Tig",
    "El Ghanaim",
    "Sahel Selim",
    "El Badari",
    "Sidfa",
  ];
  List<String> beniSuefAreas = [
    "Bani Sweif",
    "Beni Suef El Gedida",
    "Al Wasta",
    "Naser",
    "Ehnasia",
    "beba",
    "Fashn",
    "Somasta",
    "Alabbaseri",
    "Mokbel",
  ];
  List<String> portSaidAreas = [
    "PorSaid",
    "Port Fouad",
    "Alarab",
    "Zohour",
    "Alsharq",
    "Aldawahi",
    "Almanakh",
    "Mubarak",
  ];
  List<String> damiettaAreas = [
    "Damietta",
    "New Damietta",
    "Ras El Bar",
    "Faraskour",
    "Zarqa",
    "alsaru",
    "alruwda",
    "Kafr El-Batikh",
    "Azbet Al Burg",
    "Meet Abou Ghalib",
    "Kafr Saad",
  ];
  List<String> sharqiaAreas = [
    "Zagazig",
    "Al Ashr Men Ramadan",
    "Minya Al Qamh",
    "Belbeis",
    "Mashtoul El Souq",
    "Qenaiat",
    "Abu Hammad",
    "El Qurain",
    "Hehia",
    "Abu Kabir",
    "Faccus",
    "El Salihia El Gedida",
    "Al Ibrahimiyah",
    "Deirb Negm",
    "Kafr Saqr",
    "Awlad Saqr",
    "Husseiniya",
    "san alhajar alqablia",
    "Manshayat Abu Omar",
  ];
  List<String> southSinaiAreas = [
    "Al Toor",
    "Sharm El-Shaikh",
    "Dahab",
    "Nuweiba",
    "Taba",
    "Saint Catherine",
    "Abu Redis",
    "Abu Zenaima",
    "Ras Sidr",
  ];
  List<String> kafrElSheikhAreas = [
    "Kafr El Sheikh",
    "Kafr El Sheikh Downtown",
    "Desouq",
    "Fooh",
    "Metobas",
    "Burg Al Burullus",
    "Baltim",
    "Masief Baltim",
    "Hamol",
    "Bella",
    "Riyadh",
    "Sidi Salm",
    "Qellen",
    "Sidi Ghazi",
  ];
  List<String> marsaMatrouhAreas = [
    "Marsa Matrouh",
    "El Hamam",
    "Alamein",
    "Dabaa",
    "Al-Nagila",
    "Sidi Brani",
    "Salloum",
    "Siwa",
    "Marina",
    "North Coast",
  ];
  List<String> luxorAreas = [
    "Luxor",
    "New Luxor",
    "Esna",
    "New Tiba",
    "Al ziynia",
    "Al Bayadieh",
    "Al Qarna",
    "Armant",
    "Al Tud",
  ];
  List<String> qenaAreas = [
    "Qena",
    "New Qena",
    "Abu Tesht",
    "Nag Hammadi",
    "Deshna",
    "Alwaqf",
    "Qaft",
    "Naqada",
    "Farshout",
    "Quos",
  ];
  List<String> northSinaiAreas = [
    "Arish",
    "Sheikh Zowaid",
    "Nakhl",
    "Rafah",
    "Bir al-Abed",
    "Al Hasana",
  ];
  List<String> sohagAreas = [
    "Sohag",
    "Sohag El Gedida",
    "Akhmeem",
    "Akhmim El Gedida",
    "Albalina",
    "El Maragha",
    "almunsha'a",
    "Dar AISalaam",
    "Gerga",
    "Jahina Al Gharbia",
    "Saqilatuh",
    "Tama",
    "Tahta",
    "Alkawthar",
  ];
  List<String> commerceList = [
    "Clothing",
    "Footwear",
    "Accessories",
    "Beauty products",
    "Electronics",
    "Home and lifestyle",
    "Heneral merchandise",
    "Food and beverage",
    "Health and wellness",
    "Arts and crafts",
    "Automotive",
    "Travel and tourism",
    "Sports and outdoor",
    "Jewelry and watches",
    "Pet care",
    "Photography equipment"
  ];
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
      ),
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
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Card(
                        elevation: 3,
                        child: ExpansionTileItem(
                          isHasTopBorder: false,
                          isHasBottomBorder: false,
                          tilePadding: EdgeInsets.all(2),
                          isHasTrailing: false,
                          title: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.filter_alt,
                                          size: 18,
                                        ),
                                        Container(
                                          height: 15,
                                          child: Text(
                                            "Filter Projects",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                          subtitle: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 20,
                          ),
                          children: [Row()],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 2,
                              color: Colors.blueAccent,
                            ),
                          ),
                          child: ListView.builder(
                            itemCount: projects.length,
                            itemBuilder: (context, index) {
                              var project = projects[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
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
                                                        style: TextStyle(
                                                            fontSize: 12),
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
                                                            MainAxisAlignment
                                                                .start,
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
                                                                        .all(
                                                                        3.0),
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
                                                                        .all(
                                                                        3.0),
                                                                child: Text(
                                                                    "${project.businessBasicInfoModel?.businessField}"),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(Icons.people,size: 18,),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets.all(
                                                                    3.0),
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
                                                                Icons
                                                                    .location_pin,
                                                                size: 18,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        3.0),
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
                                                                        .all(
                                                                        3.0),
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
                                                              Icon(Icons.money,size: 18,),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets.all(
                                                                    3.0),
                                                                child: Text(
                                                                  "${project.businessBasicInfoModel?.businessCapital}",
                                                                  style: Get
                                                                      .textTheme.bodyLarge,
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
                                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
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
                                                  style:
                                                      Get.textTheme.bodyLarge,
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "${project.businessBasicInfoModel?.businessCapital}",
                                                      style: Get
                                                          .textTheme.bodyLarge,
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Text("no Data found");
              }
            },
          ),
        ],
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
