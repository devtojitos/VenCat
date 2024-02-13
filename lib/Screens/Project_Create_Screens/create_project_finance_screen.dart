import 'package:flutter/material.dart';

class CreateProjectFinanceScreen extends StatefulWidget {
  const CreateProjectFinanceScreen({super.key});

  @override
  State<CreateProjectFinanceScreen> createState() =>
      _CreateProjectFinanceScreenState();
}

class _CreateProjectFinanceScreenState
    extends State<CreateProjectFinanceScreen> {


  List<String> revenueStream = [
    "B2B",
    "B2C",
    "C2C",
    "Freemium",
    "Subscription Based",
    "E-commerce",
    "Marketplace",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Finance"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Divider(thickness: 3,
                    color: Colors.blue,
                    height: 24,
                    indent: MediaQuery
                        .of(context)
                        .size
                        .width * 0.41,
                  ),
                  Text(
                    "Intial Investment : ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.3,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow.shade700, width: 3),
                borderRadius: BorderRadius.circular(8),),
              child: TextField(keyboardType: TextInputType.number,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Divider(thickness: 3,
                    color: Colors.blue,
                    height: 24,
                    indent: MediaQuery
                        .of(context)
                        .size
                        .width * 0.41,
                  ),
                  Text(
                    "Operating Cost : ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.3,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow.shade700, width: 3),
                borderRadius: BorderRadius.circular(8),),
              child: TextField(keyboardType: TextInputType.number,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Divider(thickness: 3,
                    color: Colors.blue,
                    height: 24,
                    indent: MediaQuery
                        .of(context)
                        .size
                        .width * 0.41,
                  ),
                  Text(
                    "Equipment Cost : ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.3,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow.shade700, width: 3),
                borderRadius: BorderRadius.circular(8),),
              child: TextField(keyboardType: TextInputType.number,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Divider(thickness: 3,
                    color: Colors.blue,
                    height: 24,
                    indent: MediaQuery
                        .of(context)
                        .size
                        .width * 0.41,
                  ),
                  Text(
                    "Furnish Cost : ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.3,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow.shade700, width: 3),
                borderRadius: BorderRadius.circular(8),),
              child: TextField(keyboardType: TextInputType.number,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Divider(thickness: 3,
                    color: Colors.blue,
                    height: 24,
                    indent: MediaQuery
                        .of(context)
                        .size
                        .width * 0.52,
                  ),
                  Text(
                    "Operating material cost : ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.3,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow.shade700, width: 3),
                borderRadius: BorderRadius.circular(8),),
              child: TextField(keyboardType: TextInputType.number,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow.shade700, width: 3),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Detailed Financial Projection : "),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.4,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.15,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3, color: Colors.yellow.shade700)),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Upload your file"),
                            ),
                          ),
                          Container(
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Must Include:"),
                                  Text("*material cost, "),
                                  Text("*running cost,"),
                                  Text("*expected bullshit")
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow.shade700, width: 3),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Break-even Analysis:"),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.4,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.15,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3, color: Colors.yellow.shade700)),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Upload your file"),
                            ),
                          ),
                          Container(
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Must Include:"),
                                  Text("*material cost, "),
                                  Text("*running cost,"),
                                  Text("*expected bullshit")
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            TextButton(onPressed: null, child: Text("Save"))],
        ),
      ),
    );
  }
}
