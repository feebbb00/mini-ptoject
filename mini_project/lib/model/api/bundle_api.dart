//Agar nilai menjadi list maka futurenya berbentuk
import 'package:dio/dio.dart';
import 'package:mini_project/model/list_bundle_model.dart';

class BundleAPI {
  // {required String language} kalo mau ubah bahasa masukin dalam ()
  Future<List<BundleModel>> getListBundleFromAPI() async {
    try {
      final response = await Dio().get(
        'https://valorant-api.com/v1/bundles',
        // data: {"language" : language},
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
