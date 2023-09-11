import 'package:darksro/features/home/data/models/CharModel.dart';
import 'package:darksro/features/home/data/models/HWIDModel.dart';

import '../../../../core/utils/app_string.dart';

class InfoModel {
  int? jID;
  String? strUserID;
  String? status;
  String? gMrank;
  String? name;
  String? email;
  Null? sex;
  Null? certificateNum;
  Null? address;
  Null? postcode;
  Null? phone;
  Null? mobile;
  String? regtime;
  String? regIp;
  Null? timeLog;
  Null? freetime;
  String? secPrimary;
  String? secContent;
  String? accPlayTime;
  String? latestUpdateTimeToPlayTime;
  String? play123Time;
  GetSkSilk? getSkSilk;
  List<GetShardUser>? getShardUser;
  GetHwid? getHwid;
  InfoModel(
      {this.jID,
      this.strUserID,
      this.status,
      this.gMrank,
      this.name,
      this.email,
      this.sex,
      this.certificateNum,
      this.address,
      this.postcode,
      this.phone,
      this.mobile,
      this.regtime,
      this.regIp,
      this.timeLog,
      this.freetime,
      this.secPrimary,
      this.secContent,
      this.accPlayTime,
      this.latestUpdateTimeToPlayTime,
      this.play123Time,
      this.getSkSilk,
      this.getShardUser,
      this.getHwid});

  InfoModel.fromJson(Map<String, dynamic> json) {
    jID = json['JID'];
    strUserID = json['StrUserID'];
    status = json['Status'];
    gMrank = json['GMrank'];
    name = json['Name'];
    email = json['Email'];
    sex = json['sex'];
    certificateNum = json['certificate_num'];
    address = json['address'];
    postcode = json['postcode'];
    phone = json['phone'];
    mobile = json['mobile'];
    regtime = json['regtime'];
    regIp = json['reg_ip'];
    timeLog = json['Time_log'];
    freetime = json['freetime'];
    secPrimary = json['sec_primary'];
    secContent = json['sec_content'];
    accPlayTime = json['AccPlayTime'];
    latestUpdateTimeToPlayTime = json['LatestUpdateTime_ToPlayTime'];
    play123Time = json['Play123Time'];
    getSkSilk = json['get_sk_silk'] != null
        ? new GetSkSilk.fromJson(json['get_sk_silk'])
        : null;
    if (json['get_shard_user'] != null) {
      getShardUser = <GetShardUser>[];
      json['get_shard_user'].forEach((v) {
        GetShardUser user = GetShardUser.fromJson(v);
        if (user.charID == int.parse(Stringconstants.Charid)) {
          getShardUser!.add(user);
        }
      });
    }
    getHwid = json['get_hwid'] != null
        ? new GetHwid.fromJson(json['get_hwid'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JID'] = this.jID;
    data['StrUserID'] = this.strUserID;
    data['Status'] = this.status;
    data['GMrank'] = this.gMrank;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['sex'] = this.sex;
    data['certificate_num'] = this.certificateNum;
    data['address'] = this.address;
    data['postcode'] = this.postcode;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['regtime'] = this.regtime;
    data['reg_ip'] = this.regIp;
    data['Time_log'] = this.timeLog;
    data['freetime'] = this.freetime;
    data['sec_primary'] = this.secPrimary;
    data['sec_content'] = this.secContent;
    data['AccPlayTime'] = this.accPlayTime;
    data['LatestUpdateTime_ToPlayTime'] = this.latestUpdateTimeToPlayTime;
    data['Play123Time'] = this.play123Time;
    if (this.getSkSilk != null) {
      data['get_sk_silk'] = this.getSkSilk!.toJson();
    }
    if (this.getShardUser != null) {
      data['get_shard_user'] =
          this.getShardUser!.map((v) => v.toJson()).toList();
    }
    if (this.getHwid != null) {
      data['get_hwid'] = this.getHwid!.toJson();
    }
    return data;
  }
}

class GetSkSilk {
  int? jID;
  String? silkOwn;
  String? silkGift;
  String? silkPoint;

  GetSkSilk({this.jID, this.silkOwn, this.silkGift, this.silkPoint});

  GetSkSilk.fromJson(Map<String, dynamic> json) {
    jID = json['JID'];
    silkOwn = json['silk_own'];
    silkGift = json['silk_gift'];
    silkPoint = json['silk_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JID'] = this.jID;
    data['silk_own'] = this.silkOwn;
    data['silk_gift'] = this.silkGift;
    data['silk_point'] = this.silkPoint;
    return data;
  }
}
