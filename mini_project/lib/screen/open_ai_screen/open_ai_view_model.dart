import 'package:flutter/material.dart';
import 'package:mini_project/model/api/open_ai_api.dart';
import 'package:mini_project/model/open_ai_model.dart';

class OpenAiViewModel extends ChangeNotifier {
  bool _isLoadingAnswer = false;
  bool get isLoadingAnswer => _isLoadingAnswer;

  final TextEditingController _questionController = TextEditingController();
  TextEditingController get questionController => _questionController;

  OpenAiModel? _openAiAnswer;
  OpenAiModel? get openAiAnswer => _openAiAnswer;

  Future<void> getRecommendation() async {
    try {
      _isLoadingAnswer = true;
      notifyListeners();
      _openAiAnswer = await OpenAiAPI().getAnswerFromOpenAI(
        question: questionController.text,
      );
      notifyListeners();

      _isLoadingAnswer = false;
      notifyListeners();
    } catch (e) {
      _isLoadingAnswer = false;
      notifyListeners();
    }
  }

  void resetFields(
    TextEditingController questionController,
  ) {
    questionController.clear();
    notifyListeners();
  }
}
