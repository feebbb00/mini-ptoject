import 'package:dio/dio.dart';
import 'package:mini_project/model/version_model.dart';

class VersionAPI {
  Future<VersionModel> getVersionFromAPI() async {
    try {
      final response = await Dio().get(
        'https://valorant-api.com/v1/version',
      );

      if (response.statusCode == 200) {
        return VersionModel.fromJson(response.data);
      } else {
        throw Exception(
            "Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
