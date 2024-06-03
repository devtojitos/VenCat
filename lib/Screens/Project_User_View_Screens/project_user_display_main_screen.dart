import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectUserDisplayMainScreen extends StatefulWidget {
  const ProjectUserDisplayMainScreen({super.key});

  @override
  State<ProjectUserDisplayMainScreen> createState() =>
      _ProjectUserDisplayMainScreenState();
}

class _ProjectUserDisplayMainScreenState
    extends State<ProjectUserDisplayMainScreen> {
  int _displayState = 0;
  int _membersState =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Your Project Portal"),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height * 0.90,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              children: [
                GestureDetector(
                  onTap:(){
                    setState(() {
                      _displayState == 1;
                    });
                  }
                 ,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "OverView",
                    ),
                  ),
                ),
                GestureDetector(
                    onTap:(){
                      setState(() {
                        _displayState == 2;
                      });
                    },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Members",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    setState(() {
                      _displayState == 3;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Chat",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    setState(() {
                      _displayState == 4;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Finance",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    setState(() {
                      _displayState == 5;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Legal",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    setState(() {
                      _displayState == 6;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Settings",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.red,
            width: MediaQuery.of(context).size.width * 0.58,
            height: MediaQuery.of(context).size.height * 0.90,
            child: _displayState == 1
                ? Container()
                : _displayState == 2
                    ? Container()
                    : _displayState == 3
                        ? Container()
                        : Container(),
          )
        ],
      ),
    );
  }
}
