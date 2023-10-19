import 'package:flutter/material.dart';
import 'package:mini_project/screen/bundle_screen/bundle_screen.dart';
import 'package:mini_project/screen/bundle_screen/bundle_view_model.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BundleScreen(),
      ),
    );
  }
}

///testestetsss