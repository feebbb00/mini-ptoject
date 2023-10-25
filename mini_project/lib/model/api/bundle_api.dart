import 'package:dio/dio.dart';
import 'package:mini_project/model/list_bundle_model.dart';

class BundleAPI {
  Future<List<BundleModel>> getListBundleFromAPI() async {
    try {
      final response = await Dio().get(
        'https://valorant-api.com/v1/bundles',
      );
      List<BundleModel> listBundle = [];
      List<dynamic> responseData = response.data["data"];

      for (var element in responseData) {
        listBundle.add(BundleModel.fromJson(element));
      }
      return listBundle;
    } catch (e) {
      throw Exception(e);
    }
  }
}
