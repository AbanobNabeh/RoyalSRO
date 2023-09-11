import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/mission/presentation/cubit/mission_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/modelmission.dart';

Widget WeeklyWid(
    MissionCubit missionCubit, MissionState state, BuildContext context) {
  return state is GetWeekLoading || state is GetMissionLoading
      ? Components.loadingwidget()
      : Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.secblack,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Week(1, missionCubit, context),
                      missionCubit.week < 2
                          ? locked(2, context)
                          : Week(2, missionCubit, context),
                      missionCubit.week < 3
                          ? locked(3, context)
                          : Week(3, missionCubit, context),
                      missionCubit.week < 4
                          ? locked(4, context)
                          : Week(4, missionCubit, context),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: state is CollectPointLoading
                  ? Components.loadingwidget()
                  : ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return missionlist(missionCubit.missions[index],
                            context, missionCubit, index);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: missionCubit.missions.length),
            )
          ],
        );
}

Widget Week(int index, MissionCubit missionCubit, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: InkWell(
      onTap: missionCubit.indexweek == index
          ? null
          : () => missionCubit.changeweek(index, context),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: missionCubit.indexweek == index
                ? AppColors.primercolor
                : AppColors.secblack),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Components.defaulttext(
              text: "${AppStringTrans(context).week} ${index}"),
        ),
      ),
    ),
  );
}

Widget locked(int index, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.secblack),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Components.defaulttext(
                text: "${AppStringTrans(context).week} ${index}",
                color: AppColors.grey.withOpacity(0.2)),
          ),
        ],
      ),
    ),
  );
}

Widget missionlist(MissionModel missionModel, BuildContext context,
    MissionCubit missionCubit, int index) {
  return InkWell(
    onTap: missionModel.getplayer!.isEmpty ||
            int.parse(missionModel.getplayer![0].count!) <
                int.parse(missionModel.complete!) ||
            missionModel.getplayer![0].isCollect == '1'
        ? null
        : () => missionCubit.collectpoint(
            context, missionModel.missionPoint!, index),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secblack,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Components.defaulttext(
                    text: missionModel.missionName!,
                    color: AppColors.primercolor,
                    size: 16),
                SizedBox(
                  width: 8,
                ),
                missionModel.getplayer!.isEmpty
                    ? Components.defaulttext(
                        text: "(0 / ${missionModel.complete})",
                        color: AppColors.error,
                        size: 16)
                    : int.parse(missionModel.getplayer![0].count!) >=
                            int.parse(missionModel.complete!)
                        ? Components.defaulttext(
                            text: AppStringTrans(context).completed,
                            color: AppColors.success,
                            size: 16)
                        : Components.defaulttext(
                            text:
                                "(${missionModel.getplayer![0].count!} / ${missionModel.complete})",
                            color: AppColors.primercolor,
                            size: 16),
                Spacer(),
                missionModel.getplayer!.isNotEmpty
                    ? int.parse(missionModel.getplayer![0].count!) >=
                            int.parse(missionModel.complete!)
                        ? missionModel.getplayer![0].isCollect == '0'
                            ? Components.defaulttext(
                                text: AppStringTrans(context).taptocollect,
                                size: 16,
                                color: AppColors.primercolor)
                            : Icon(
                                Icons.done,
                                color: AppColors.success,
                              )
                        : Components.defaulttext(text: "", size: 16)
                    : Components.defaulttext(text: "", size: 16),
              ],
            ),
            Components.defaulttext(
                text:
                    "${missionModel.missionPoint} ${AppStringTrans(context).point}",
                size: 16),
          ],
        ),
      ),
    ),
  );
}
