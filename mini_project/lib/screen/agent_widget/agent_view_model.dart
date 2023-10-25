import 'package:flutter/material.dart';
import 'package:mini_project/model/api/agent_api.dart';
import 'package:mini_project/model/list_agent_model.dart';

class AgentViewModel extends ChangeNotifier {
  bool _isLoadingAgent = false;
  bool get isLoadingAgent => _isLoadingAgent;

  List<AgentModel> _listAgent = [];
  List<AgentModel> get listAgent => _listAgent;

  void getAgent() async {
    _isLoadingAgent = true;
    notifyListeners();

    _listAgent = await AgentAPI().getListAgentsFromAPI();

    _isLoadingAgent = false;
    notifyListeners();
  }
}
