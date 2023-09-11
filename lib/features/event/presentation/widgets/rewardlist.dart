import 'package:darksro/config/network/url.dart';
import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/event/data/models/rewardroyalmodel.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:darksro/features/event/presentation/widgets/royalpasstool.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/app_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/royalpassmodel.dart';

Widget royalpassinfo(ModelRoyalpass modelRoyalpass, BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: AppColors.secblack, borderRadius: BorderRadius.circular(8)),
    child: Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      RoyalPassTool.royallvl[int.parse(modelRoyalpass.lvl!)],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Components.defaulttext(
                              text: 'RP : ${modelRoyalpass.lvl}'),
                          Components.defaulttext(
                              text:
                                  "${modelRoyalpass.point} ${AppStringTrans(context).point}",
                              size: 16),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget lvllist(RewardRoyalModel reward, int index, BuildContext context) {
  return Container(
    height: MediaQueryValues(context).height / 15,
    child: Components.defaulttext(
        text: reward.lvl!,
        color: AppColors.primercolor,
        fontWeight: FontWeight.bold),
  );
}

Widget imagelist(RewardRoyalModel reward, int index, BuildContext context) {
  return Container(
    height: MediaQueryValues(context).height / 15,
    child: Column(
      children: [
        Image.network(
          '${AppUrl.ETClink}${reward.normal}',
          height: MediaQueryValues(context).height / 25,
        ),
        Components.defaulttext(
            text: '${reward.countNorm!}X',
            size: 12,
            color: AppColors.white,
            fontWeight: FontWeight.bold)
      ],
    ),
  );
}

Widget imageviplist(RewardRoyalModel reward, int index, BuildContext context) {
  return Container(
    height: MediaQueryValues(context).height / 15,
    child: Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Image.network(
            '${AppUrl.ETClink}${reward.vIP}',
            height: MediaQueryValues(context).height / 25,
          ),
          Components.defaulttext(
              text: '${reward.countVip!}X',
              size: 12,
              color: AppColors.white,
              fontWeight: FontWeight.bold)
        ],
      ),
    ),
  );
}

Widget statuslist(int lvl, int collect, BuildContext context, int i) {
  return Container(
    height: MediaQueryValues(context).height / 15,
    child: lvl <= collect
        ? Components.defaulttext(
            text: AppStringTrans(context).collected, color: AppColors.success)
        : InkWell(
            onTap: () => EventCubit.get(context).royalcollect(i, context),
            child: Components.defaulttext(
                text: AppStringTrans(context).collect,
                color: AppColors.success),
          ),
  );
}
