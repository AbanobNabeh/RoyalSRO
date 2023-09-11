import 'dart:math';

import 'package:darksro/config/network/diohelper.dart';
import 'package:darksro/config/network/url.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:darksro/features/mission/data/models/dailyrwnodel.dart';
import 'package:darksro/features/mission/data/models/modelmission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_string.dart';

part 'mission_state.dart';

class MissionCubit extends Cubit<MissionState> {
  MissionCubit() : super(MissionInitial());
  static MissionCubit get(context) => BlocProvider.of(context);

  int indexpage = 1;
  int indexweek = 1;
  void changepage(int index, BuildContext context) {
    indexpage = index;
    if (index == 2) {
      getweek(context);
    } else {
      checkdaily();
    }
  }

  void changeweek(int index, BuildContext context) {
    indexweek = index;
    getmission(week: index.toString(), context: context);
    emit(ChangeweekIndex());
  }

  int week = 0;
  void getweek(BuildContext context) {
    emit(GetWeekLoading());
    DioApp.getData(url: AppUrl.getweek).then((value) {
      week = int.parse(value.data[0]['week']);
      indexweek = week;
      getmission(week: value.data[0]['week'], context: context);
    }).catchError((error) {});
  }

  List<MissionModel> missions = [];
  bool isvip = false;
  void getmission({required String week, required BuildContext context}) {
    emit(GetMissionLoading());
    missions = [];
    DioApp.postData(url: AppUrl.MissionWeekly, data: {
      "CharName":
          HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16,
      "week": week,
    }).then((value) {
      value.data['player'] == 0 ? isvip = false : isvip = true;
      value.data['missions'].forEach((element) {
        missions.add(MissionModel.fromJson(element));
      });
      emit(GetMissionSuccess());
    }).catchError((error) {
      emit(GetMissionError());
    });
  }

  void collectpoint(BuildContext context, String point, int index) {
    emit(CollectPointLoading());
    DioApp.postData(url: AppUrl.collectpoint, data: {
      "charname":
          HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16,
      "point": point,
      'MissionID': missions[index].iD
    }).then((value) {
      missions[index].getplayer![0].isCollect = '1';
      emit(CollectPointSuccess());
    }).catchError((error) {
      emit(CollectPointError());
    });
  }

  List<DailyRWModel> rw = [];
  bool iscollect = false;
  int isday = 0;
  void checkdaily() {
    emit(CheckDailyLoading());
    rw = [];
    DioApp.postData(url: AppUrl.checkdaily, data: {
      'CharID': Stringconstants.Charid,
    }).then((value) {
      iscollect = value.data['info']['collect'];
      isday = int.parse(value.data['info']['day']);
      value.data['rw'].forEach((element) {
        rw.add(DailyRWModel.fromJson(element));
      });
      emit(CheckDailySuccess());
    }).catchError((error) {
      print(error.toString());
      emit(CheckDailyError());
    });
  }

  void collectdailay(String itemid, String count, BuildContext context) {
    emit(ColectRwLoading());
    DioApp.postData(url: AppUrl.collectDaily, data: {
      "JID": HomeCubit.get(context).modelinfo[0].jID,
      "CharID": Stringconstants.Charid,
      "ItemID": itemid,
      "Count": count
    }).then((value) {
      itemid != "1"
          ? Components.successmessage(
              context: context, message: AppStringTrans(context).checkchest)
          : null;
      checkdaily();
      emit(ColectRwSuccess());
    }).catchError((error) {
      emit(ColectRwError());
    });
  }
}
