import 'package:flutter/material.dart';
import 'package:mini_project/model/api/version_api.dart';
import 'package:mini_project/model/version_model.dart';

class VersionViewModel extends ChangeNotifier {
  bool _isLoadingVersion = false;
  bool get isLoadingVersion => _isLoadingVersion;

  VersionModel? _versionData; // Menambahkan properti untuk data versi
  VersionModel? get versionData => _versionData;

  void getVersion() async {
    _isLoadingVersion = true;
    notifyListeners();

    _versionData =
        await VersionAPI().getVersionFromAPI(); // Memperbarui _versionData

    _isLoadingVersion = false;
    notifyListeners();
  }
}
