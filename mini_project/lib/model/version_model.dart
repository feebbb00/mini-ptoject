// To parse this JSON data, do
//
//     final versionModel = versionModelFromJson(jsonString);

import 'dart:convert';

VersionModel versionModelFromJson(String str) =>
    VersionModel.fromJson(json.decode(str));

String versionModelToJson(VersionModel data) => json.encode(data.toJson());

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

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
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

  Map<String, dynamic> toJson() => {
        "manifestId": manifestId,
        "branch": branch,
        "version": version,
        "buildVersion": buildVersion,
        "engineVersion": engineVersion,
        "riotClientVersion": riotClientVersion,
        "riotClientBuild": riotClientBuild,
        "buildDate": buildDate,
      };
}
