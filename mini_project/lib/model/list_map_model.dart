class ListMapModel {
  int? status;
  List<MapModel>? data;

  ListMapModel({
    this.status,
    this.data,
  });

  factory ListMapModel.fromJson(Map<String, dynamic> json) => ListMapModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<MapModel>.from(
                json["data"]!.map((x) => MapModel.fromJson(x))),
      );
}

class MapModel {
  String? uuid;
  String? displayName;
  String? narrativeDescription;
  String? tacticalDescription;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? splash;
  String? assetPath;
  String? mapUrl;
  double? xMultiplier;
  double? yMultiplier;
  double? xScalarToAdd;
  double? yScalarToAdd;
  List<Callout>? callouts;

  MapModel({
    this.uuid,
    this.displayName,
    this.narrativeDescription,
    this.tacticalDescription,
    this.coordinates,
    this.displayIcon,
    this.listViewIcon,
    this.splash,
    this.assetPath,
    this.mapUrl,
    this.xMultiplier,
    this.yMultiplier,
    this.xScalarToAdd,
    this.yScalarToAdd,
    this.callouts,
  });

  factory MapModel.fromJson(Map<String, dynamic> json) => MapModel(
        uuid: json["uuid"],
        displayName: json["displayName"],
        narrativeDescription: json["narrativeDescription"],
        tacticalDescription: json["tacticalDescription"],
        coordinates: json["coordinates"],
        displayIcon: json["displayIcon"],
        listViewIcon: json["listViewIcon"],
        splash: json["splash"],
        assetPath: json["assetPath"],
        mapUrl: json["mapUrl"],
        xMultiplier: json["xMultiplier"]?.toDouble(),
        yMultiplier: json["yMultiplier"]?.toDouble(),
        xScalarToAdd: json["xScalarToAdd"]?.toDouble(),
        yScalarToAdd: json["yScalarToAdd"]?.toDouble(),
        callouts: json["callouts"] == null
            ? []
            : List<Callout>.from(
                json["callouts"]!.map((x) => Callout.fromJson(x))),
      );
}

class Callout {
  String? regionName;
  String? superRegionName;
  Location? location;

  Callout({
    this.regionName,
    this.superRegionName,
    this.location,
  });

  factory Callout.fromJson(Map<String, dynamic> json) => Callout(
        regionName: json["regionName"],
        superRegionName: json["superRegionName"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
      );
}

class Location {
  double? x;
  double? y;

  Location({
    this.x,
    this.y,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}
