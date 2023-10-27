import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mini_project/constants/open_ai.dart';
import 'package:mini_project/model/open_ai_model.dart';

class OpenAiAPI {
  Future<OpenAiModel> getAnswerFromOpenAI({required String question}) async {
    try {
      final data = jsonEncode(
        {
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "system", "content": 'You are an expert in valorant'},
            {"role": "user", "content": question}
          ],
          "temperature": 0,
          "max_tokens": 500,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0
        },
      );

      final response = await Dio().post(
        'https://api.openai.com/v1/chat/completions',
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $apikey',
          },
        ),
      );

      if (response.statusCode == 200) {
        return OpenAiModel.fromJson(response.data);
      } else {
        throw Exception('Failed to get a valid response');
      }
    } catch (e) {
      throw Exception('Error occurred when sending request: $e');
    }
  }
}


// KENAPA ADA RETURN OPENAIMODEL
//BERIKUT JIKA INGIN MENGEMBALIKAN NILAI RETURN BERUPA NULL TAMBAHKAN ? DI 
// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:mini_project/constants/open_ai.dart';
// import 'package:mini_project/model/open_ai_model.dart';

// class OpenAiAPI {
//   static Future<OpenAiModel?> getAnswerFromOpenAI(
//       {required String question}) async {
//     late OpenAiModel openAiModel = OpenAiModel(
//       id: '',
//       object: '',
//       created: 0,
//       model: '',
//       choices: [],
//       usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0),
//     );

//     try {
//       final dio = Dio();
//       dio.options.headers = {
//         'Content-Type': 'application/json;charset=UTF-8',
//         'Charset': 'utf-8',
//         'Authorization': 'Bearer $apikey'
//       };
//       final data = jsonEncode(
//         {
//           "model": "gpt-3.5-turbo",
//           "messages": [
//             {"role": "system", "content": 'your are expert in valoran'},
//             {"role": "user", "content": question}
//           ],
//           "temperature": 0,
//           "max_tokens": 500,
//           "top_p": 1,
//           "frequency_penalty": 0,
//           "presence_penalty": 0
//         },
//       );

//       final response = await dio
//           .post('https://api.openai.com/v1/chat/completions', data: data);
//       if (response.statusCode == 200) {
//         openAiModel = openAiModelFromJson(response.data);
//         return openAiModel;
//       }
//     } catch (e) {
//       throw Exception('Error occurred when sending request');
//     }
//     return null;
//   }
// }

