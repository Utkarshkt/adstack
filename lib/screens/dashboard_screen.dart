import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dashboard_provider.dart';
import '../widgets/birthday_card.dart';
import '../widgets/creators_card.dart';
import '../widgets/performance_chart.dart';
import '../widgets/project_list.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool sidebarCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 900;

          return Row(
            children: [
              if (isDesktop)
                Sidebar(
                  isCollapsed: sidebarCollapsed,
                  onToggle: () {
                    setState(() {
                      sidebarCollapsed = !sidebarCollapsed;
                    });
                  },
                ),

              // Main content
              Expanded(
                flex: 7,
                child: Consumer<DashboardProvider>(
                  builder: (context, provider, _) {
                    if (provider.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return const SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TopCard(),
                          SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 2, child: ProjectList()),
                              SizedBox(width: 16),
                              Expanded(flex: 2, child: CreatorsCard()),
                            ],
                          ),
                          SizedBox(height: 16),
                          PerformanceChart(),
                        ],
                      ),
                    );
                  },
                ),
              ),

              if (isDesktop) const Expanded(flex: 3, child: RightPanel()),
            ],
          );
        },
      ),
    );
  }
}
