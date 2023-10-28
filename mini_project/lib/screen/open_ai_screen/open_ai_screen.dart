import 'package:flutter/material.dart';
import 'package:mini_project/screen/open_ai_screen/answer_screen.dart';
import 'package:mini_project/screen/open_ai_screen/open_ai_view_model.dart';
import 'package:mini_project/theme/typography_style.dart';
import 'package:provider/provider.dart';

class OpenAiScreen extends StatelessWidget {
  const OpenAiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final openAiViewModel = context.read<OpenAiViewModel>();
    return Scaffold(
      backgroundColor: const Color(0XFF141c24),
      appBar: AppBar(
        title: Text(
          'AI Valorant Coach',
          style: TypographyStyle.antonL,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFbd3944),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Any question about valorant ?',
                  style: TypographyStyle.antonM,
                ),
                const SizedBox(height: 20),
                // Text(
                //   'Input Your question Here!!!',
                //   style: TypographyStyle.antonSB,
                // ),
                // const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: openAiViewModel.questionController,
                  decoration: InputDecoration(
                    hintText: 'Give me duelist recommendations for Breeze map',
                    filled: true,
                    label: const Text('Input Your question Here!!!'),
                    labelStyle: TypographyStyle.antonMB,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                const SizedBox(height: 20),
                Consumer<OpenAiViewModel>(
                  builder: (context, openAiViewModel, child) {
                    if (openAiViewModel.isLoadingAnswer) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Center(
                        child: SizedBox(
                          width: 200,
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {
                              openAiViewModel.getRecommendation().then(
                                (_) {
                                  final gptResponseData =
                                      openAiViewModel.openAiAnswer;

                                  openAiViewModel.resetFields(
                                      openAiViewModel.questionController);
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
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
