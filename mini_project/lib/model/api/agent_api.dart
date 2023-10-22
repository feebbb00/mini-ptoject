//Agar nilai menjadi list maka futurenya berbentuk
import 'package:dio/dio.dart';
import 'package:mini_project/model/list_agent_model.dart';

class AgentAPI {
  Future<List<AgentModel>> getListAgentsFromAPI() async {
    try {
      final response = await Dio().get(
        'https://valorant-api.com/v1/agents?isPlayableCharacter=true',
      );
      List<AgentModel> listAgent = [];
      List<dynamic> responseData = response.data["data"];

      for (var element in responseData) {
        listAgent.add(AgentModel.fromJson(element));
      }
      return listAgent;
    } catch (e) {
      throw Exception(e);
    }
  }
}
