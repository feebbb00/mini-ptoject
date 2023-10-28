import 'package:flutter/material.dart';
import 'package:mini_project/screen/agent_widget/agent_view_model.dart';
import 'package:mini_project/screen/bundle_widget/bundle_view_model.dart';
import 'package:mini_project/screen/home_screen/home_screen.dart';
import 'package:mini_project/screen/detail_agent_screen/detail_agent_view_model.dart';
import 'package:mini_project/screen/map_avail_widget/map_view_model.dart';
import 'package:mini_project/screen/open_ai_screen/open_ai_view_model.dart';
import 'package:mini_project/screen/version_valo_widget/version_view_model.dart';
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
        ChangeNotifierProvider<MapViewModel>(
          create: (context) => MapViewModel(),
        ),
        ChangeNotifierProvider<OpenAiViewModel>(
          create: (context) => OpenAiViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFfffbf5)),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
