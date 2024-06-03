import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/FinanceModel/project_business_finance_model.dart';
import 'package:vencat/Firebase/project_details_firebase.dart';

import '../../StateController/basic_info_state.dart';
import 'create_project_overview_screen.dart';

class CreateProjectFinanceScreen extends StatefulWidget {
  const CreateProjectFinanceScreen(
      {super.key, required this.onSave, required this.onBack});

  final VoidCallback onSave;
  final VoidCallback onBack;

  @override
  State<CreateProjectFinanceScreen> createState() =>
      _CreateProjectFinanceScreenState();
}

class _CreateProjectFinanceScreenState
    extends State<CreateProjectFinanceScreen> {
  final ProjectSelectedStateController _projectSelectedStateController =
      Get.find();

  List<String> revenueStream = [
    "B2B",
    "B2C",
    "C2C",
    "Freemium",
    "Subscription Based",
    "E-commerce",
    "Marketplace",
  ];
  ProjectService projectService = ProjectService();
  final TextEditingController detailedFinancialProjectionsPdfController =
      TextEditingController();
  final TextEditingController initialInvestmentController =
      TextEditingController();
  final TextEditingController operatingCostController = TextEditingController();
  final TextEditingController furnishCostController = TextEditingController();
  final TextEditingController equipmentCostController = TextEditingController();
  final TextEditingController operatingMaterialCostController =
      TextEditingController();
  TextEditingController businessModelController = TextEditingController();
  TextEditingController revenueStreamController = TextEditingController();
  TextEditingController operatingCostModelController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool accountingAndLegalValue = false;

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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  height: 24,
                                  indent:
                                      MediaQuery.of(context).size.width * 0.41,
                                ),
                                Text(
                                  "Intial Investment : ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
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
                              controller: initialInvestmentController,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          Row(
                            children: [
                              Text("Non Disclosed"),
                              Checkbox(
                                value: accountingAndLegalValue,
                                onChanged: (value) {
                                  setState(() {
                                    accountingAndLegalValue = value!;
                                    print(accountingAndLegalValue.toString());
                                  });
                                },
                              ),
                            ],
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
                                    MediaQuery.of(context).size.width * 0.41,
                              ),
                              Text(
                                "Operating Cost : ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              )
                            ],
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
                              controller: operatingCostController,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          Row(
                            children: [
                              Text("Non Disclosed"),
                              Checkbox(
                                value: accountingAndLegalValue,
                                onChanged: (value) {
                                  setState(() {
                                    accountingAndLegalValue = value!;
                                    print(accountingAndLegalValue.toString());
                                  });
                                },
                              ),
                            ],
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
                                Divider(
                                  thickness: 3,
                                  color: Colors.blue,
                                  height: 24,
                                  indent:
                                      MediaQuery.of(context).size.width * 0.41,
                                ),
                                Text(
                                  "Equipment Cost : ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
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
                              controller: equipmentCostController,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          Row(
                            children: [
                              Text("Non Disclosed"),
                              Checkbox(
                                value: accountingAndLegalValue,
                                onChanged: (value) {
                                  setState(() {
                                    accountingAndLegalValue = value!;
                                    print(accountingAndLegalValue.toString());
                                  });
                                },
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
                                      MediaQuery.of(context).size.width * 0.41,
                                ),
                                Text(
                                  "Furnish Cost : ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
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
                              controller: furnishCostController,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          Row(
                            children: [
                              Text("Non Disclosed"),
                              Checkbox(
                                value: accountingAndLegalValue,
                                onChanged: (value) {
                                  setState(() {
                                    accountingAndLegalValue = value!;
                                    print(accountingAndLegalValue.toString());
                                  });
                                },
                              ),
                            ],
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
                                Divider(
                                  thickness: 3,
                                  color: Colors.blue,
                                  height: 24,
                                  indent:
                                      MediaQuery.of(context).size.width * 0.52,
                                ),
                                Text(
                                  "Operating material cost : ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
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
                              controller: operatingMaterialCostController,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          Row(
                            children: [
                              Text("Non Disclosed"),
                              Checkbox(
                                value: accountingAndLegalValue,
                                onChanged: (value) {
                                  setState(() {
                                    accountingAndLegalValue = value!;
                                    print(accountingAndLegalValue.toString());
                                  });
                                },
                              ),
                            ],
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
                          Text("Further details : "),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3,
                                          color: Colors.yellow.shade700)),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text("Upload your file"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          widget.onBack;
                        },
                        child: Text("Back"),
                      ),
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.blue)),
                          onPressed: () async {
                            BusinessFinanceModel businessFinanceModel =
                                BusinessFinanceModel(
                              detailedFinancialProjectionsPdf:
                                  "detailedFinancialProjectionsPdf",
                              initialInvestment:
                                  int.parse(initialInvestmentController.text),
                              operatingCost:
                                  int.parse(operatingCostController.text),
                              furnishCost:
                                  int.parse(furnishCostController.text),
                              equipmentCost: int.parse(
                                equipmentCostController.text,
                              ),
                              operatingMaterialCost: int.parse(
                                  operatingMaterialCostController.text),
                            );
                            _projectSelectedStateController
                                .selectedBusinessModel
                                .value
                                .businessFinanceModel = businessFinanceModel;
                            print(_projectSelectedStateController
                                .selectedBusinessModel
                                .value
                                .businessMarketingModel!
                                .salesChannel
                                .toString());
                            print(_projectSelectedStateController
                                .selectedBusinessModel
                                .value
                                .businessFinanceModel!
                                .equipmentCost
                                .toString());
                            print(_projectSelectedStateController
                                .selectedBusinessModel
                                .value
                                .businessBasicInfoModel!
                                .businessDescription
                                .toString());

                            widget.onSave();
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(fontSize: 25),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
