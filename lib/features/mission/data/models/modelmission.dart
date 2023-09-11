class MissionModel {
  String? iD;
  String? missionName;
  String? missionPoint;
  String? missionWeek;
  String? complete;
  List<Getplayer>? getplayer;

  MissionModel(
      {this.iD,
      this.missionName,
      this.missionPoint,
      this.missionWeek,
      this.complete,
      this.getplayer});

  MissionModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    missionName = json['MissionName'];
    missionPoint = json['MissionPoint'];
    missionWeek = json['MissionWeek'];
    complete = json['Complete'];
    if (json['getplayer'] != String) {
      getplayer = <Getplayer>[];
      json['getplayer'].forEach((v) {
        getplayer!.add(new Getplayer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['MissionName'] = this.missionName;
    data['MissionPoint'] = this.missionPoint;
    data['MissionWeek'] = this.missionWeek;
    data['Complete'] = this.complete;
    if (this.getplayer != String) {
      data['getplayer'] = this.getplayer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Getplayer {
  String? iD;
  String? charName;
  String? missionID;
  String? count;
  String? isCollect;

  Getplayer(
      {this.iD, this.charName, this.missionID, this.count, this.isCollect});

  Getplayer.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    charName = json['CharName'];
    missionID = json['MissionID'];
    count = json['count'];
    isCollect = json['IsCollect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CharName'] = this.charName;
    data['MissionID'] = this.missionID;
    data['count'] = this.count;
    data['IsCollect'] = this.isCollect;
    return data;
  }
}
