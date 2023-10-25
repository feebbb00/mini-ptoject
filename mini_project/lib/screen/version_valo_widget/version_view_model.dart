import 'package:flutter/material.dart';
import 'package:mini_project/model/api/version_api.dart';
import 'package:mini_project/model/version_model.dart';

class VersionViewModel extends ChangeNotifier {
  bool _isLoadingVersion = false;
  bool get isLoadingVersion => _isLoadingVersion;

  VersionModel? _versionData;
  VersionModel? get versionData => _versionData;

  void getVersion() async {
    _isLoadingVersion = true;
    notifyListeners();

    _versionData = await VersionAPI().getVersionFromAPI();
    _isLoadingVersion = false;
    notifyListeners();
  }
}
