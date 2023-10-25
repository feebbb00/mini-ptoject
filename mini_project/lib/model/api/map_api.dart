import 'package:dio/dio.dart';
import 'package:mini_project/model/list_map_model.dart';

class MapAPI {
  Future<List<MapModel>> getListMapFromAPI() async {
    try {
      final response = await Dio().get(
        'https://valorant-api.com/v1/maps',
      );
      List<MapModel> listMap = [];
      List<dynamic> responseData = response.data["data"];

      for (var element in responseData) {
        listMap.add(MapModel.fromJson(element));
      }
      return listMap;
    } catch (e) {
      throw Exception(e);
    }
  }
}
