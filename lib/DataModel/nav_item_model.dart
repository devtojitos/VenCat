import 'package:rive/rive.dart';
import 'package:vencat/DataModel/rive_model.dart';

class NavItemModel{
  final String title;
  final RiveModel rive;

  NavItemModel({required this.title,required this.rive});

  List<NavItemModel> bottomNavItems = [
    NavItemModel(
      title: "Chat",
      rive:  RiveModel(
        src: "",artboard: "CHAT",stateMachineName: "CHAT_Interactivity"
      )
    )
  ];
}