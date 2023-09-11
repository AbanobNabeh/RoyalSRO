class RewardRoyalModel {
  String? iD;
  String? lvl;
  String? normal;
  String? vIP;
  String? iDnorm;
  String? iDVIP;
  String? countVip;
  String? countNorm;

  RewardRoyalModel(
      {this.iD,
      this.lvl,
      this.normal,
      this.vIP,
      this.iDnorm,
      this.iDVIP,
      this.countVip,
      this.countNorm});

  RewardRoyalModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    lvl = json['Lvl'];
    normal = json['Normal'];
    vIP = json['VIP'];
    iDnorm = json['IDnorm'];
    iDVIP = json['IDVIP'];
    countVip = json['CountVip'];
    countNorm = json['CountNorm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Lvl'] = this.lvl;
    data['Normal'] = this.normal;
    data['VIP'] = this.vIP;
    data['IDnorm'] = this.iDnorm;
    data['IDVIP'] = this.iDVIP;
    data['CountVip'] = this.countVip;
    data['CountNorm'] = this.countNorm;
    return data;
  }
}
