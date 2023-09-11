class GetUsed {
  String? charID;
  String? iP;
  String? pCIP;
  String? hWID;
  String? codeUSED;

  GetUsed({this.charID, this.iP, this.pCIP, this.hWID, this.codeUSED});

  GetUsed.fromJson(Map<String, dynamic> json) {
    charID = json['CharID'];
    iP = json['IP'];
    pCIP = json['PCIP'];
    hWID = json['HWID'];
    codeUSED = json['CodeUSED'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CharID'] = this.charID;
    data['IP'] = this.iP;
    data['PCIP'] = this.pCIP;
    data['HWID'] = this.hWID;
    data['CodeUSED'] = this.codeUSED;
    return data;
  }
}
