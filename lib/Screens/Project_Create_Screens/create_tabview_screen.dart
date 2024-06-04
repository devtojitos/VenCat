import 'package:flutter/material.dart';
import 'create_project_basic_info_screen.dart';
import 'create_project_finance_screen.dart';
import 'create_project_marketing_screen.dart';
import 'create_project_settings_screen.dart';

class CreateTabviewScreen extends StatefulWidget {
  const CreateTabviewScreen({super.key});

  @override
  State<CreateTabviewScreen> createState() => _CreateTabviewScreenState();
}

class _CreateTabviewScreenState extends State<CreateTabviewScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _nextTab() {
    if (_tabController.index < _tabController.length - 1) {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  void _previousTab() {
    if (_tabController.index > 0) {
      _tabController.animateTo(_tabController.index - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a Project"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(child: Text("Basic Info")),
                  Tab(child: Text("Marketing")),
                  Tab(child: Text("Finance")),
                  Tab(child: Text("Settings")),
                ],
                onTap: (_) {}, // Prevents tab switching
              ),
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification notification) {
                notification.disallowIndicator();
                return true;
              },
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollStartNotification) {
                    if (notification.dragDetails != null) {
                      return true;
                    }
                  }
                  return false;
                },
                child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    CreateProjectInitScreen(onSave: _nextTab),
                    CreateProjectMarketingScreen(
                        onSave: _nextTab, onBack: _previousTab),
                    CreateProjectFinanceScreen(
                        onSave: _nextTab, onBack: _previousTab),
                    CreateProjectSettingsScreen(
                        onSave: _nextTab, onBack: _previousTab),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
