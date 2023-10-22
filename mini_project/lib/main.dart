import 'package:flutter/material.dart';
import 'package:mini_project/screen/agent_screen/agent_view_model.dart';
import 'package:mini_project/screen/bundle_screen/bundle_view_model.dart';
import 'package:mini_project/screen/coba_tabBar/coba_tab_bar.dart';
import 'package:mini_project/screen/detail_screen/detail_agent_view_model.dart';
import 'package:mini_project/screen/version_screen/version_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BundleViewModel>(
          create: (context) => BundleViewModel(),
        ),
        ChangeNotifierProvider<VersionViewModel>(
          create: (context) => VersionViewModel(),
        ),
        ChangeNotifierProvider<AgentViewModel>(
          create: (context) => AgentViewModel(),
        ),
        ChangeNotifierProvider<DetailAgentViewModel>(
          create: (context) => DetailAgentViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFfd4556)),
          useMaterial3: true,
        ),
        home: const CobaTabBar(),
      ),
    );
  }
}
