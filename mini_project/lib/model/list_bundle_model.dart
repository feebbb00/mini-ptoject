class ListBundleModel {
  int? status;
  List<BundleModel>? data;

  ListBundleModel({
    this.status,
    this.data,
  });

  factory ListBundleModel.fromJson(Map<String, dynamic> json) =>
      ListBundleModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<BundleModel>.from(
                json["data"]!.map((x) => BundleModel.fromJson(x))),
      );
}

class BundleModel {
  String? uuid;
  String? displayName;
  String? displayNameSubText;
  String? description;
  String? extraDescription;
  String? promoDescription;
  bool? useAdditionalContext;
  String? displayIcon;
  String? displayIcon2;
  String? verticalPromoImage;
  String? assetPath;

  BundleModel({
    this.uuid,
    this.displayName,
    this.displayNameSubText,
    this.description,
    this.extraDescription,
    this.promoDescription,
    this.useAdditionalContext,
    this.displayIcon,
    this.displayIcon2,
    this.verticalPromoImage,
    this.assetPath,
  });

  factory BundleModel.fromJson(Map<String, dynamic> json) => BundleModel(
        uuid: json["uuid"],
        displayName: json["displayName"],
        displayNameSubText: json["displayNameSubText"],
        description: json["description"],
        extraDescription: json["extraDescription"],
        promoDescription: json["promoDescription"],
        useAdditionalContext: json["useAdditionalContext"],
        displayIcon: json["displayIcon"],
        displayIcon2: json["displayIcon2"],
        verticalPromoImage: json["verticalPromoImage"],
        assetPath: json["assetPath"],
      );
}
