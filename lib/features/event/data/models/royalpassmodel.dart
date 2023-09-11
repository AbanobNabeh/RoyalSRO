class ModelRoyalpass {
  String? charName;
  String? lvl;
  String? point;
  String? collectlvl;

  ModelRoyalpass({this.charName, this.lvl, this.point, this.collectlvl});

  ModelRoyalpass.fromJson(Map<String, dynamic> json) {
    charName = json['CharName'];
    lvl = json['lvl'];
    point = json['point'];
    collectlvl = json['collectlvl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CharName'] = this.charName;
    data['lvl'] = this.lvl;
    data['point'] = this.point;
    data['collectlvl'] = this.collectlvl;
    return data;
  }
}
