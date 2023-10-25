class VersionModel {
  int? status;
  Data? data;

  VersionModel({
    this.status,
    this.data,
  });

  factory VersionModel.fromJson(Map<String, dynamic> json) => VersionModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  String? manifestId;
  String? branch;
  String? version;
  String? buildVersion;
  String? engineVersion;
  String? riotClientVersion;
  String? riotClientBuild;
  String? buildDate;

  Data({
    this.manifestId,
    this.branch,
    this.version,
    this.buildVersion,
    this.engineVersion,
    this.riotClientVersion,
    this.riotClientBuild,
    this.buildDate,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        manifestId: json["manifestId"],
        branch: json["branch"],
        version: json["version"],
        buildVersion: json["buildVersion"],
        engineVersion: json["engineVersion"],
        riotClientVersion: json["riotClientVersion"],
        riotClientBuild: json["riotClientBuild"],
        buildDate: json["buildDate"],
      );
}
