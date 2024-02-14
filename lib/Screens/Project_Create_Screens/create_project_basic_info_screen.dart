import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../DataModel/ProjectModel/BusinessModel/project_business_basic_info_model.dart';
import '../../DataModel/ProjectModel/BusinessModel/project_business_model.dart';
import '../../Firebase/project_details_firebase.dart';
import '../../StateController/basic_info_state.dart';
import 'create_project_overview_screen.dart';

class CreateProjectInitScreen extends StatefulWidget {
   CreateProjectInitScreen({Key? key}) : super(key: key);
  final ProjectSelectedStateController projectSelectedStateController =
  Get.find();

  @override
  State<CreateProjectInitScreen> createState() =>
      _CreateProjectInitScreenState();

  static String generateProjectId() {
    final random = Random();

    final currentDateTime = DateTime.now();
    final formattedDate =
        "${currentDateTime.year}${currentDateTime.month.toString().padLeft(2, '0')}${currentDateTime.day.toString().padLeft(2, '0')}";
    final formattedTime =
        "${currentDateTime.hour.toString().padLeft(2, '0')}${currentDateTime.minute.toString().padLeft(2, '0')}${currentDateTime.second.toString().padLeft(2, '0')}";

    final randomNumbers =
        List.generate(10, (index) => random.nextInt(10)).join();

    final ProjectId = '$formattedDate$formattedTime$randomNumbers';
    return ProjectId;
  }
}

class _CreateProjectInitScreenState extends State<CreateProjectInitScreen> {

  String userId =  FirebaseAuth.instance.currentUser!.uid;

  final ProjectService projectServices = ProjectService();

  final projectSelectedStateController = Get.put(ProjectSelectedStateController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController investmentCapitalController =
      TextEditingController();
  final TextEditingController partnersNumberController =
      TextEditingController();
  final projectId = CreateProjectInitScreen.generateProjectId();

  List<String> businessType = [
    "Commerce",
    "Agriculture",
    "Service",
    "Manufacturing"
  ];
  List<String> serviceList = [
    "Healthcare",
    "Education/training",
    "It/software",
    "Beauty centers/salon",
    "Hospitality/tourism",
    "Financial services",
    "Real estate",
    "Transportation/logistics",
    "Marketing/advertising",
    "Legal services",
    "Event planning",
    "Environmental services",
    "Construction",
    "Pet care",
    "Photography service"
  ];
  List<String> manufacturingList = [
    "Food/Beverage",
    "Textile/apparel",
    "Chemical/Pharma",
    "Electronics",
    "Heavy-duty Machinery",
    "Tools/Equipment"
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
  String selectedBusinessType = "Commerce";
  String? selectedBusinessField;
  String? selectedLocationCity;
  String? selectedLocationArea;

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
    selectedLocationArea =
        locationAreas?[0];
    descriptionController.text = widget.projectSelectedStateController.selectedBusinessModel.value.businessBasicInfoModel?.businessDescription??"";
    titleController.text = widget.projectSelectedStateController.selectedBusinessModel.value.businessBasicInfoModel?.businessTitle ?? "";// Set a default value for initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Basic info"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: 3,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Divider(
                              thickness: 3,
                              color: Colors.blue,
                              height: 26,
                              indent: MediaQuery.of(context).size.width * 0.12,
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
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 3,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Divider(
                              thickness: 3,
                              color: Colors.blue,
                              height: 24,
                              indent: MediaQuery.of(context).size.width * 0.26,
                            ),
                            Text(
                              "Description : ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
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
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 3,
                color: Colors.grey.shade200,
                shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Divider(
                              thickness: 3,
                              color: Colors.blue,
                              height: 24,
                              indent: MediaQuery.of(context).size.width * 0.32,
                            ),
                            Text(
                              "Business Type : ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            )
                          ],
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
                            dropdownColor: Colors.grey.shade200,
                            value: selectedBusinessType,
                            items: businessType.map((type) {
                              return DropdownMenuItem<String>(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedBusinessType = value.toString();
                                businessFields =
                                    _getBusinessFields(selectedBusinessType);
                                selectedBusinessField =
                                    null; // Reset selectedBusinessField
                              },);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 3,
                color: Colors.grey.shade200,
                shadowColor: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Divider(
                              thickness: 3,
                              color: Colors.blue,
                              height: 24,
                              indent: MediaQuery.of(context).size.width * 0.32,
                            ),
                            Text(
                              "Business Field : ",
                              style: TextStyle(fontStyle: FontStyle.italic,
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 3,color: Colors.yellow.shade700),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            dropdownColor: Colors.grey.shade200,
                            value: selectedBusinessField,
                            items: businessFields?.map((field) {
                              return DropdownMenuItem<String>(
                                value: field,
                                child: Text(field),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedBusinessField = value.toString();
                              },);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 3,
                color: Colors.grey.shade200,shadowColor: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Divider(
                              thickness: 3,
                              color: Colors.blue,
                              height: 24,
                              indent: MediaQuery.of(context).size.width * 0.41,
                            ),
                            Text(
                              "Investment Capital :",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
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
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(elevation: 3,color: Colors.grey.shade200,shadowColor: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Divider(
                              thickness: 3,
                              color: Colors.blue,
                              height: 24,
                              indent: MediaQuery.of(context).size.width * 0.41,
                            ),
                            Text(
                              "Partners Number : ",
                              style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow.shade700, width: 3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: partnersNumberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Card(elevation: 3,color: Colors.grey.shade200,shadowColor: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Divider(
                              thickness: 3,
                              color: Colors.blue,
                              height: 24,
                              indent: MediaQuery.of(context).size.width * 0.21,
                            ),
                            Text(
                              "Location : ",
                              style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow.shade700, width: 3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("City"),
                                DropdownButton(
                                  value: selectedLocationCity,
                                  items: locationCities?.map((city) {
                                    return DropdownMenuItem<String>(
                                      value: city,
                                      child: Text(city),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedLocationCity = value.toString();
                                      // Set corresponding location areas based on the selected city
                                      locationAreas =
                                          _getLocationAreas(selectedLocationCity);
                                      selectedLocationArea = locationAreas?[0];
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () async {
                    BusinessBasicInfoModel basicInfoModel =
                        BusinessBasicInfoModel(
                      businessField: selectedBusinessField.toString(),
                      businessCapital:
                          int.parse(investmentCapitalController.text),
                      businessDescription: descriptionController.text,
                      businessLocationArea: selectedLocationArea.toString(),
                      businessLocationCity: selectedLocationCity.toString(),
                      businessTitle: titleController.text,
                      businessType: selectedBusinessType.toString(),
                      partnersNumber: int.parse(partnersNumberController.text),
                    );

                    ProjectBusinessModel projectBusinessModel =
                        ProjectBusinessModel(
                            projectId: projectId,
                            userId: userId,
                            createdOn: DateTime.now().millisecondsSinceEpoch,
                            businessBasicInfoModel: basicInfoModel);

                    projectServices.writeProjectAndBasicInfoPublish(
                        projectBusinessModel, basicInfoModel,projectId);
                    projectSelectedStateController.selectedBusinessModel.value=projectBusinessModel;
                    Get.to(()=>CreateProjectOverviewScreen());
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(fontSize: 26, color: Colors.black),
                  ),
                ),
              ),
              //Save Draft in firebase business basic info model
            ],
          ),
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
