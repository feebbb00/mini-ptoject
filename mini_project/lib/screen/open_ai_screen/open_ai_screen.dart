import 'package:flutter/material.dart';
import 'package:mini_project/model/api/open_ai_api.dart';
import 'package:mini_project/model/open_ai_model.dart';
import 'package:mini_project/screen/open_ai_screen/answer_screen.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final TextEditingController _questionController = TextEditingController();

  bool isLoading = false;
  OpenAiModel? gptResponseData;

  void _getRecommendation() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await OpenAiAPI().getAnswerFromOpenAI(
        question: _questionController.text,
      );

      setState(() {
        isLoading = false;
        gptResponseData = result;
      });

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ResultScreen(gptResponseData: result);
          },
        ),
      );
    } catch (e) {
      final snackBar = SnackBar(
        content: Text('Failed to send a request: $e'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Valorant Coach',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Any question about valorant ?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your question',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _questionController,
                  decoration: const InputDecoration(
                    hintText: 'Give me duelist recommendations for Breeze map',
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: _getRecommendation,
                          child: const Center(
                            child: Text('Search'),
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
