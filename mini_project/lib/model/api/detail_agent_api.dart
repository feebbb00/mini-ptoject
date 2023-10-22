import 'package:dio/dio.dart';
import 'package:mini_project/model/detail_agent_model.dart';

class DetailAgentAPI {
  Future<DetailAgentModel> getDetailAgentFromAPI({required String uuid}) async {
    try {
      final response = await Dio().get(
        'https://valorant-api.com/v1/agents/$uuid',
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData != null) {
          return DetailAgentModel.fromJson(responseData);
        } else {
          throw Exception("Data is null in the response");
        }
      } else {
        throw Exception(
            "Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
