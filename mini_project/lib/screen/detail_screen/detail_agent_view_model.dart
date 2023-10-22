import 'package:flutter/material.dart';
import 'package:mini_project/model/api/detail_agent_api.dart';
import 'package:mini_project/model/detail_agent_model.dart';

class DetailAgentViewModel extends ChangeNotifier {
  bool _isLoadingDetailAgent = false;
  bool get isLoadingDetailAgent => _isLoadingDetailAgent;

  DetailAgentModel? _detailAgentData; // Menambahkan properti untuk data versi
  DetailAgentModel? get detailAgentData => _detailAgentData;

  void getDetailAgent(String uuid) async {
    _isLoadingDetailAgent = true;
    notifyListeners();

    _detailAgentData = await DetailAgentAPI()
        .getDetailAgentFromAPI(uuid: uuid); // Memperbarui _detailAgentData

    _isLoadingDetailAgent = false;
    notifyListeners();
  }
}
