class ElixerModel {
  String? wep;
  String? shield;
  String? sets;
  String? accs;

  ElixerModel({this.wep, this.shield, this.sets, this.accs});

  ElixerModel.fromJson(Map<String, dynamic> json) {
    wep = json['Wep'];
    shield = json['shield'];
    sets = json['Sets'];
    accs = json['accs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Wep'] = this.wep;
    data['shield'] = this.shield;
    data['Sets'] = this.sets;
    data['accs'] = this.accs;
    return data;
  }
}
