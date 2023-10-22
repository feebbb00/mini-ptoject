class ListAgentModel {
  int? status;
  List<AgentModel>? data;

  ListAgentModel({
    this.status,
    this.data,
  });

  factory ListAgentModel.fromJson(Map<String, dynamic> json) => ListAgentModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<AgentModel>.from(
                json["data"]!.map((x) => AgentModel.fromJson(x))),
      );
}

class AgentModel {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  List<String>? characterTags;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  List<String>? backgroundGradientColors;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  Role? role;
  RecruitmentData? recruitmentData;
  List<Ability>? abilities;
  dynamic voiceLine;

  AgentModel({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.characterTags,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.recruitmentData,
    this.abilities,
    this.voiceLine,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
        uuid: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        developerName: json["developerName"],
        characterTags: json["characterTags"] == null
            ? []
            : List<String>.from(json["characterTags"]!.map((x) => x)),
        displayIcon: json["displayIcon"],
        displayIconSmall: json["displayIconSmall"],
        bustPortrait: json["bustPortrait"],
        fullPortrait: json["fullPortrait"],
        fullPortraitV2: json["fullPortraitV2"],
        killfeedPortrait: json["killfeedPortrait"],
        background: json["background"],
        backgroundGradientColors: json["backgroundGradientColors"] == null
            ? []
            : List<String>.from(
                json["backgroundGradientColors"]!.map((x) => x)),
        assetPath: json["assetPath"],
        isFullPortraitRightFacing: json["isFullPortraitRightFacing"],
        isPlayableCharacter: json["isPlayableCharacter"],
        isAvailableForTest: json["isAvailableForTest"],
        isBaseContent: json["isBaseContent"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        recruitmentData: json["recruitmentData"] == null
            ? null
            : RecruitmentData.fromJson(json["recruitmentData"]),
        abilities: json["abilities"] == null
            ? []
            : List<Ability>.from(
                json["abilities"]!.map((x) => Ability.fromJson(x))),
        voiceLine: json["voiceLine"],
      );
}

class Ability {
  Slot? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Ability({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        slot: slotValues.map[json["slot"]]!,
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
      );

  Map<String, dynamic> toJson() => {
        "slot": slotValues.reverse[slot],
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
      };
}

enum Slot { ABILITY1, ABILITY2, GRENADE, PASSIVE, ULTIMATE }

final slotValues = EnumValues({
  "Ability1": Slot.ABILITY1,
  "Ability2": Slot.ABILITY2,
  "Grenade": Slot.GRENADE,
  "Passive": Slot.PASSIVE,
  "Ultimate": Slot.ULTIMATE
});

class RecruitmentData {
  String? counterId;
  String? milestoneId;
  int? milestoneThreshold;
  bool? useLevelVpCostOverride;
  int? levelVpCostOverride;
  DateTime? startDate;
  DateTime? endDate;

  RecruitmentData({
    this.counterId,
    this.milestoneId,
    this.milestoneThreshold,
    this.useLevelVpCostOverride,
    this.levelVpCostOverride,
    this.startDate,
    this.endDate,
  });

  factory RecruitmentData.fromJson(Map<String, dynamic> json) =>
      RecruitmentData(
        counterId: json["counterId"],
        milestoneId: json["milestoneId"],
        milestoneThreshold: json["milestoneThreshold"],
        useLevelVpCostOverride: json["useLevelVpCostOverride"],
        levelVpCostOverride: json["levelVpCostOverride"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
      );
}

class Role {
  String? uuid;
  DisplayName? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  Role({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        uuid: json["uuid"],
        displayName: displayNameValues.map[json["displayName"]]!,
        description: json["description"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
      );
}

enum DisplayName { CONTROLLER, DUELIST, INITIATOR, SENTINEL }

final displayNameValues = EnumValues({
  "Controller": DisplayName.CONTROLLER,
  "Duelist": DisplayName.DUELIST,
  "Initiator": DisplayName.INITIATOR,
  "Sentinel": DisplayName.SENTINEL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
