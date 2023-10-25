import 'package:flutter/material.dart';
import 'package:mini_project/model/api/map_api.dart';
import 'package:mini_project/model/list_map_model.dart';

class MapViewModel extends ChangeNotifier {
  bool _isLoadingMap = false;
  bool get isLoadingMap => _isLoadingMap;

  List<MapModel> _listMap = [];
  List<MapModel> get listMap => _listMap;

  void getMap() async {
    _isLoadingMap = true;
    notifyListeners();

    _listMap = await MapAPI().getListMapFromAPI();

    _isLoadingMap = false;
    notifyListeners();
  }
}
