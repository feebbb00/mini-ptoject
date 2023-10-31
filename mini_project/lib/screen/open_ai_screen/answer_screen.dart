import 'package:flutter/material.dart';
import 'package:mini_project/model/open_ai_model.dart';
import 'package:mini_project/theme/color_theme.dart';
import 'package:mini_project/theme/typography_style.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.gptResponseData});

  final OpenAiModel gptResponseData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme().colorBlack,
      appBar: AppBar(
        title: Text(
          'Coach`s Answer',
          style: TypographyStyle.antonL,
        ),
        backgroundColor: ColorTheme().colorDarkMaroon,
        leading: const SizedBox(),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'My Answer for your question',
            style: TypographyStyle.antonL,
          ),
          const SizedBox(height: 20),
          Text(
            gptResponseData.choices[0].message.content,
            textAlign: TextAlign.justify,
            style: TypographyStyle.robotoS,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Oke',
                  style: TypographyStyle.antonMB,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
