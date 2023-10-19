import 'package:flutter/material.dart';
import 'package:mini_project/theme/typography_style.dart';

class UpdateInfoScreen extends StatelessWidget {
  const UpdateInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UPDATE PATCH',
          style: TypographyStyle.valoMRL,
        ),
        backgroundColor: const Color(0XFF182545),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('update patch 1919.0'),
      ),
    );
  }
}
