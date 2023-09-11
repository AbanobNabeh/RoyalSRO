import 'getlvlmodel.dart';
import 'getusedmodel.dart';

class Info {
  String? iD;
  String? charID;
  String? code;
  String? iP;
  String? role;
  List<GetUsed>? getUsed;
  Getlvl? getlvl;

  Info(
      {this.iD,
      this.charID,
      this.code,
      this.iP,
      this.role,
      this.getUsed,
      this.getlvl});

  Info.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    charID = json['CharID'];
    code = json['Code'];
    iP = json['IP'];
    role = json['Role'];
    if (json['get_used'] != null) {
      getUsed = <GetUsed>[];
      json['get_used'].forEach((v) {
        getUsed!.add(new GetUsed.fromJson(v));
      });
    }
    getlvl =
        json['getlvl'] != null ? new Getlvl.fromJson(json['getlvl']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CharID'] = this.charID;
    data['Code'] = this.code;
    data['IP'] = this.iP;
    data['Role'] = this.role;
    if (this.getUsed != null) {
      data['get_used'] = this.getUsed!.map((v) => v.toJson()).toList();
    }
    if (this.getlvl != null) {
      data['getlvl'] = this.getlvl!.toJson();
    }
    return data;
  }
}
