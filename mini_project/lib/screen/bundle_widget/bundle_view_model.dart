import 'package:flutter/material.dart';
import 'package:mini_project/model/api/bundle_api.dart';
import 'package:mini_project/model/list_bundle_model.dart';

class BundleViewModel extends ChangeNotifier {
  bool _isLoadingBundle = false;
  bool get isloadingBundle => _isLoadingBundle;

  List<BundleModel> _listBundel = [];
  List<BundleModel> get listBundel => _listBundel;

  void getBundle() async {
    _isLoadingBundle = true;
    notifyListeners();

    _listBundel = await BundleAPI().getListBundleFromAPI();

    _isLoadingBundle = false;
    notifyListeners();
  }
}
