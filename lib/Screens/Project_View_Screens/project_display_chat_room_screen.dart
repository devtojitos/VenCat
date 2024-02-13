import 'package:flutter/material.dart';

class ProjectDisplayChatRoom extends StatefulWidget {
  const ProjectDisplayChatRoom({super.key});

  @override
  State<ProjectDisplayChatRoom> createState() => _ProjectDisplayChatRoomState();
}

class _ProjectDisplayChatRoomState extends State<ProjectDisplayChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Room"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow.shade700),
                        ),
                        height: MediaQuery.of(context).size.height * 0.14,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Center(child: Text("Users Joined : ")),
                      ),
                    ),
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow.shade700),
                        ),
                        height: MediaQuery.of(context).size.height * 0.14,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Center(
                          child: Text("Partners Number : "),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow.shade700),
                        ),
                        height: MediaQuery.of(context).size.height * 0.14,
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        color: Colors.red,
                        height: MediaQuery.of(context).size.height * 0.67,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.white,
                                child: TextField(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView(
                        padding: EdgeInsets.all(12),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue, shape: BoxShape.circle),
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
