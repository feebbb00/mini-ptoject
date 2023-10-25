import 'package:flutter/material.dart';
import 'package:mini_project/screen/agent_screen/agent_widget.dart';
import 'package:mini_project/screen/bundle_screen/bundle_widget.dart';
import 'package:mini_project/screen/version_screen/version_screen.dart';
import 'package:mini_project/theme/typography_style.dart';

class CobaTabBar extends StatelessWidget {
  const CobaTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0XFF141c24),
        appBar: AppBar(
          backgroundColor: const Color(0XFF141c24),
          centerTitle: true,
          title: Text(
            'Valorant News Hub',
            style: TypographyStyle.valoMRL,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Text(
                  'NEW BUNDLE',
                  style: TypographyStyle.antonM,
                ),
              ),
              Tab(
                child: Text(
                  'AGENT',
                  style: TypographyStyle.antonM,
                ),
              ),
              Tab(
                child: Text(
                  'VALORANT VERSION',
                  style: TypographyStyle.antonM,
                ),
              ),
              Tab(
                child: Text(
                  'VALORANT VERSION',
                  style: TypographyStyle.antonM,
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BundleWidgetPage(),
            AgentWidget(),
            UpdateInfoScreen(),
            Icon(Icons.earbuds_battery_outlined),
          ],
        ),
      ),
    );
  }
}
