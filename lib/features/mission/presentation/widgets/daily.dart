import 'package:darksro/config/network/url.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:flutter/material.dart';

import '../../data/models/dailyrwnodel.dart';
import '../cubit/mission_cubit.dart';

Widget DailyWid(List<DailyRWModel> rw, MissionState state, BuildContext context,
    MissionCubit cubit) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    child: state is CheckDailyLoading
        ? Components.loadingwidget()
        : ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return int.parse(rw[index].day!) <= cubit.isday
                  ? collected(rw[index], state, context, cubit)
                  : item(rw[index], state, context, cubit);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15,
              );
            },
            itemCount: rw.length),
  );
}

Widget item(DailyRWModel rw, MissionState state, BuildContext context,
    MissionCubit cubit) {
  return InkWell(
    onTap: cubit.iscollect && cubit.isday + 1 == int.parse(rw.day!)
        ? () {
            cubit.collectdailay(rw.refItemID!, rw.count!, context);
          }
        : null,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secblack,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Components.defchachedimg("${AppUrl.imgday}${rw.image}"),
                SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Components.defaulttext(
                        text: "Day ${rw.day}", color: AppColors.primercolor),
                    Components.defaulttext(
                        text: "${rw.count}X ${rw.rwname}",
                        size: 14,
                        color: AppColors.grey),
                  ],
                ),
              ],
            ),
            Spacer(),
            Visibility(
                visible:
                    cubit.iscollect && cubit.isday + 1 == int.parse(rw.day!),
                child: Components.defaulttext(
                    text: AppStringTrans(context).taptocollect,
                    size: 14,
                    color: AppColors.success))
          ],
        ),
      ),
    ),
  );
}

Widget collected(DailyRWModel rw, MissionState state, BuildContext context,
    MissionCubit cubit) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.success,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Components.defchachedimg("${AppUrl.imgday}${rw.image}"),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Components.defaulttext(
                      text: "Day ${rw.day}", color: AppColors.primercolor),
                  Components.defaulttext(
                      text: "${rw.count}X ${rw.rwname}", size: 12),
                ],
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.check,
            color: AppColors.white,
          )
        ],
      ),
    ),
  );
}
