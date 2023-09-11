import 'package:darksro/features/event/data/models/reviewpostmodel.dart';

class ModelPOST {
  String? iD;
  String? charName;
  String? dateTime;
  String? iMG;
  String? description;
  String? charIMG;
  String? rate;
  bool? myrate;
  List<GetViewposts>? getViewposts;

  ModelPOST(
      {this.iD,
      this.charName,
      this.dateTime,
      this.iMG,
      this.description,
      this.charIMG,
      this.rate,
      this.myrate,
      this.getViewposts});

  ModelPOST.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    charName = json['CharName'];
    dateTime = json['DateTime'];
    iMG = json['IMG'];
    description = json['Description'];
    charIMG = json['CharIMG'];
    rate = json['rate'];
    myrate = json['myrate'];
    if (json['get_viewposts'] != null) {
      getViewposts = <GetViewposts>[];
      json['get_viewposts'].forEach((v) {
        getViewposts!.add(new GetViewposts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CharName'] = this.charName;
    data['DateTime'] = this.dateTime;
    data['IMG'] = this.iMG;
    data['Description'] = this.description;
    data['CharIMG'] = this.charIMG;
    data['rate'] = this.rate;
    data['myrate'] = this.myrate;
    if (this.getViewposts != null) {
      data['get_viewposts'] =
          this.getViewposts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
