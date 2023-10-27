import 'package:flutter/material.dart';
import 'package:mini_project/model/open_ai_model.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.gptResponseData});

  final OpenAiModel gptResponseData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solution'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Solution for your question',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            gptResponseData.choices[0].message.content,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
