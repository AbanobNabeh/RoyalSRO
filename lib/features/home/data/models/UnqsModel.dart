class ModelUnqs {
  String? iD;
  String? charID;
  String? charName;
  String? uniqueRefObjID;
  String? uniqueCodeName;
  String? killedRegionID;
  String? date;
  List<GetName>? getName;

  ModelUnqs(
      {this.iD,
      this.charID,
      this.charName,
      this.uniqueRefObjID,
      this.uniqueCodeName,
      this.killedRegionID,
      this.date,
      this.getName});

  ModelUnqs.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    charID = json['CharID'];
    charName = json['CharName'];
    uniqueRefObjID = json['UniqueRefObjID'];
    uniqueCodeName = json['UniqueCodeName'];
    killedRegionID = json['KilledRegionID'];
    date = json['Date'];
    if (json['get_name'] != null) {
      getName = <GetName>[];
      json['get_name'].forEach((v) {
        getName!.add(new GetName.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CharID'] = this.charID;
    data['CharName'] = this.charName;
    data['UniqueRefObjID'] = this.uniqueRefObjID;
    data['UniqueCodeName'] = this.uniqueCodeName;
    data['KilledRegionID'] = this.killedRegionID;
    data['Date'] = this.date;
    if (this.getName != null) {
      data['get_name'] = this.getName!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetName {
  String? monster;
  String? name;

  GetName({this.monster, this.name});

  GetName.fromJson(Map<String, dynamic> json) {
    monster = json['monster'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monster'] = this.monster;
    data['name'] = this.name;
    return data;
  }
}
