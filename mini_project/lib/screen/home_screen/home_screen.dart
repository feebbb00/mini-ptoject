import 'package:flutter/material.dart';
import 'package:mini_project/screen/agent_widget/agent_widget.dart';
import 'package:mini_project/screen/bundle_widget/bundle_widget.dart';
import 'package:mini_project/screen/map_avail_widget/map_widget.dart';
import 'package:mini_project/screen/open_ai_screen/open_ai_screen.dart';
import 'package:mini_project/screen/version_valo_widget/version_widget.dart';
import 'package:mini_project/theme/typography_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0XFF141c24),
        appBar: AppBar(
          backgroundColor: const Color(0xFFbd3944),
          centerTitle: true,
          title: Text(
            'Valorant News Hub',
            style: TypographyStyle.valoM,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OpenAiScreen(),
                  ),
                );
              },
              child: Text(
                'AI',
                style: TypographyStyle.antonS,
              ),
            ),
            // IconButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (_) => const OpenAiScreen(),
            //       ),
            //     );
            //   },
            //   icon: const Icon(
            //     Icons.search,
            //     color: Colors.white,
            //   ),
            // ),
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
                  'MAP AVAILABLE',
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
            MapWidget(),
            UpdateInfoScreen(),
          ],
        ),
      ),
    );
  }
}
