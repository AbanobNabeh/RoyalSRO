import 'infomodel.dart';

class InviteModel {
  List<Info>? info;
  String? invited;
  bool? redem;

  InviteModel({this.info, this.invited, this.redem});

  InviteModel.fromJson(Map<String, dynamic> json) {
    if (json['info'] != null) {
      info = <Info>[];
      json['info'].forEach((v) {
        info!.add(new Info.fromJson(v));
      });
    }
    invited = json['Invited'];
    redem = json['redem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.map((v) => v.toJson()).toList();
    }
    data['Invited'] = this.invited;
    data['redem'] = this.redem;
    return data;
  }
}
