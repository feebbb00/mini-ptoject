import 'package:flutter/material.dart';
import 'package:mini_project/screen/open_ai_screen/answer_screen.dart';
import 'package:mini_project/screen/open_ai_screen/open_ai_view_model.dart';
import 'package:provider/provider.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final openAiViewModel = context.read<OpenAiViewModel>();
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
                  controller: openAiViewModel.questionController,
                  decoration: const InputDecoration(
                    hintText: 'Give me duelist recommendations for Breeze map',
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Consumer<OpenAiViewModel>(
                    builder: (context, openAiViewModel, child) {
                      if (openAiViewModel.isLoadingAnswer) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ElevatedButton(
                          onPressed: () {
                            openAiViewModel.getRecommendation().then(
                              (_) {
                                final gptResponseData =
                                    openAiViewModel.openAiAnswer;
                                if (gptResponseData != null) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ResultScreen(
                                          gptResponseData: gptResponseData,
                                          // Navigator.of(context).push(
                                          //   MaterialPageRoute(
                                          //     builder: (context) {
                                          //       return ResultScreen(
                                          //         gptResponseData:
                                          //             openAiViewModel.openAiAnswer!,
                                          //       );
                                          //     },
                                          //   ),
                                          // );
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  const snackBar = SnackBar(
                                    content: Text('Failed to send a request'),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                            );
                          },
                          child: const Center(
                            child: Text('Submit'),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
