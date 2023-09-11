class GetShardUser {
  int? charID;
  String? deleted;
  String? refObjID;
  String? charName16;
  String? nickName16;
  String? scale;
  String? curLevel;
  String? maxLevel;
  String? expOffset;
  String? sExpOffset;
  String? strength;
  String? intellect;
  String? remainGold;
  String? remainSkillPoint;
  String? remainStatPoint;
  String? remainHwanCount;
  String? gatheredExpPoint;
  String? hP;
  String? mP;
  String? latestRegion;
  String? posX;
  String? posY;
  String? posZ;
  String? appointedTeleport;
  String? autoInvestExp;
  String? inventorySize;
  String? dailyPK;
  String? totalPK;
  String? pKPenaltyPoint;
  String? tPP;
  String? penaltyForfeit;
  String? jobPenaltyTime;
  String? jobLvlTrader;
  String? traderExp;
  String? jobLvlHunter;
  String? hunterExp;
  String? jobLvlRobber;
  String? robberExp;
  String? guildID;
  String? lastLogout;
  String? telRegion;
  String? telPosX;
  String? telPosY;
  String? telPosZ;
  String? diedRegion;
  String? diedPosX;
  String? diedPosY;
  String? diedPosZ;
  String? worldID;
  String? telWorldID;
  String? diedWorldID;
  String? hwanLevel;
  String? itemPoints;
  String? DarkPoint;
  Pivot? pivot;

  GetShardUser(
      {this.charID,
      this.deleted,
      this.refObjID,
      this.charName16,
      this.nickName16,
      this.scale,
      this.curLevel,
      this.maxLevel,
      this.expOffset,
      this.sExpOffset,
      this.strength,
      this.intellect,
      this.remainGold,
      this.remainSkillPoint,
      this.remainStatPoint,
      this.remainHwanCount,
      this.gatheredExpPoint,
      this.hP,
      this.mP,
      this.latestRegion,
      this.posX,
      this.posY,
      this.posZ,
      this.appointedTeleport,
      this.autoInvestExp,
      this.inventorySize,
      this.dailyPK,
      this.totalPK,
      this.pKPenaltyPoint,
      this.tPP,
      this.penaltyForfeit,
      this.jobPenaltyTime,
      this.jobLvlTrader,
      this.traderExp,
      this.jobLvlHunter,
      this.hunterExp,
      this.jobLvlRobber,
      this.robberExp,
      this.guildID,
      this.lastLogout,
      this.telRegion,
      this.telPosX,
      this.telPosY,
      this.telPosZ,
      this.diedRegion,
      this.diedPosX,
      this.diedPosY,
      this.diedPosZ,
      this.worldID,
      this.telWorldID,
      this.diedWorldID,
      this.hwanLevel,
      this.itemPoints,
      this.DarkPoint,
      this.pivot});

  GetShardUser.fromJson(Map<String, dynamic> json) {
    charID = json['CharID'];
    deleted = json['Deleted'];
    refObjID = json['RefObjID'];
    charName16 = json['CharName16'];
    nickName16 = json['NickName16'];
    scale = json['Scale'];
    curLevel = json['CurLevel'];
    maxLevel = json['MaxLevel'];
    expOffset = json['ExpOffset'];
    sExpOffset = json['SExpOffset'];
    strength = json['Strength'];
    intellect = json['Intellect'];
    remainGold = json['RemainGold'];
    remainSkillPoint = json['RemainSkillPoint'];
    remainStatPoint = json['RemainStatPoint'];
    remainHwanCount = json['RemainHwanCount'];
    gatheredExpPoint = json['GatheredExpPoint'];
    hP = json['HP'];
    mP = json['MP'];
    latestRegion = json['LatestRegion'];
    posX = json['PosX'];
    posY = json['PosY'];
    posZ = json['PosZ'];
    appointedTeleport = json['AppointedTeleport'];
    autoInvestExp = json['AutoInvestExp'];
    inventorySize = json['InventorySize'];
    dailyPK = json['DailyPK'];
    totalPK = json['TotalPK'];
    pKPenaltyPoint = json['PKPenaltyPoint'];
    tPP = json['TPP'];
    penaltyForfeit = json['PenaltyForfeit'];
    jobPenaltyTime = json['JobPenaltyTime'];
    jobLvlTrader = json['JobLvl_Trader'];
    traderExp = json['Trader_Exp'];
    jobLvlHunter = json['JobLvl_Hunter'];
    hunterExp = json['Hunter_Exp'];
    jobLvlRobber = json['JobLvl_Robber'];
    robberExp = json['Robber_Exp'];
    guildID = json['GuildID'];
    lastLogout = json['LastLogout'];
    telRegion = json['TelRegion'];
    telPosX = json['TelPosX'];
    telPosY = json['TelPosY'];
    telPosZ = json['TelPosZ'];
    diedRegion = json['DiedRegion'];
    diedPosX = json['DiedPosX'];
    diedPosY = json['DiedPosY'];
    diedPosZ = json['DiedPosZ'];
    worldID = json['WorldID'];
    telWorldID = json['TelWorldID'];
    diedWorldID = json['DiedWorldID'];
    hwanLevel = json['HwanLevel'];
    itemPoints = json['ItemPoints'];
    DarkPoint = json['DarkPoint'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CharID'] = this.charID;
    data['Deleted'] = this.deleted;
    data['RefObjID'] = this.refObjID;
    data['CharName16'] = this.charName16;
    data['NickName16'] = this.nickName16;
    data['Scale'] = this.scale;
    data['CurLevel'] = this.curLevel;
    data['MaxLevel'] = this.maxLevel;
    data['ExpOffset'] = this.expOffset;
    data['SExpOffset'] = this.sExpOffset;
    data['Strength'] = this.strength;
    data['Intellect'] = this.intellect;
    data['RemainGold'] = this.remainGold;
    data['RemainSkillPoint'] = this.remainSkillPoint;
    data['RemainStatPoint'] = this.remainStatPoint;
    data['RemainHwanCount'] = this.remainHwanCount;
    data['GatheredExpPoint'] = this.gatheredExpPoint;
    data['HP'] = this.hP;
    data['MP'] = this.mP;
    data['LatestRegion'] = this.latestRegion;
    data['PosX'] = this.posX;
    data['PosY'] = this.posY;
    data['PosZ'] = this.posZ;
    data['AppointedTeleport'] = this.appointedTeleport;
    data['AutoInvestExp'] = this.autoInvestExp;
    data['InventorySize'] = this.inventorySize;
    data['DailyPK'] = this.dailyPK;
    data['TotalPK'] = this.totalPK;
    data['PKPenaltyPoint'] = this.pKPenaltyPoint;
    data['TPP'] = this.tPP;
    data['PenaltyForfeit'] = this.penaltyForfeit;
    data['JobPenaltyTime'] = this.jobPenaltyTime;
    data['JobLvl_Trader'] = this.jobLvlTrader;
    data['Trader_Exp'] = this.traderExp;
    data['JobLvl_Hunter'] = this.jobLvlHunter;
    data['Hunter_Exp'] = this.hunterExp;
    data['JobLvl_Robber'] = this.jobLvlRobber;
    data['Robber_Exp'] = this.robberExp;
    data['GuildID'] = this.guildID;
    data['LastLogout'] = this.lastLogout;
    data['TelRegion'] = this.telRegion;
    data['TelPosX'] = this.telPosX;
    data['TelPosY'] = this.telPosY;
    data['TelPosZ'] = this.telPosZ;
    data['DiedRegion'] = this.diedRegion;
    data['DiedPosX'] = this.diedPosX;
    data['DiedPosY'] = this.diedPosY;
    data['DiedPosZ'] = this.diedPosZ;
    data['WorldID'] = this.worldID;
    data['TelWorldID'] = this.telWorldID;
    data['DiedWorldID'] = this.diedWorldID;
    data['HwanLevel'] = this.hwanLevel;
    data['ItemPoints'] = this.itemPoints;
    data['DarkPoint'] = this.DarkPoint;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? userJID;
  String? charID;

  Pivot({this.userJID, this.charID});

  Pivot.fromJson(Map<String, dynamic> json) {
    userJID = json['UserJID'];
    charID = json['CharID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserJID'] = this.userJID;
    data['CharID'] = this.charID;
    return data;
  }
}
