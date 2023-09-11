import 'package:darksro/core/utils/app_unq.dart';
import 'package:darksro/core/utils/formatedata.dart';
import 'package:darksro/features/home/data/models/GlobalModel.dart';
import 'package:darksro/features/home/data/models/InfoModel.dart';
import 'package:darksro/features/home/data/models/UnqsModel.dart';
import 'package:darksro/features/home/data/models/eventschedule.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/app_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_string.dart';

Widget infowid(BuildContext context, HomeCubit homeCubit, InfoModel model,
        HomeState state) =>
    Container(
      decoration: BoxDecoration(
          color: AppColors.secblack, borderRadius: BorderRadius.circular(7)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Components.defaulttext(
                  text: AppStringTrans(context).info,
                  color: AppColors.primercolor),
              alignment: AlignmentDirectional.topStart,
            ),
            Components.defaulttext(
                text:
                    '${AppStringTrans(context).charName} ${model.getShardUser![0].charName16}'),
            Components.defaulttext(
                text:
                    '${AppStringTrans(context).gold} ${Components.Formataint(int.parse(model.getShardUser![0].remainGold!))}'),
            Components.defaulttext(
                text:
                    '${AppStringTrans(context).silk} : ${Components.Formataint(int.parse(model.getSkSilk!.silkOwn!))}'),
            Components.defaulttext(
                text:
                    '${AppStringTrans(context).uniquepoint} : ${Components.Formataint(int.parse(model.getSkSilk!.silkPoint!))}'),
          ],
        ),
      ),
    );
Widget Globalwid(BuildContext context, HomeCubit cubit, List<GlobalModel> model,
        HomeState state) =>
    Container(
      width: double.infinity,
      height: MediaQueryValues(context).height / 3,
      decoration: BoxDecoration(
          color: AppColors.secblack, borderRadius: BorderRadius.circular(8)),
      child: state is LoadingGetGlobal
          ? Center(
              child: Components.loadingwidget(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.black),
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Components.defaulttext(
                                        size: 16,
                                        fontWeight: FontWeight.bold,
                                        text: model[index].charName!,
                                        color: AppColors.primercolor),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Components.defaulttext(
                                        size: 14,
                                        fontWeight: FontWeight.bold,
                                        text: model[index].globalChat!,
                                        color: AppColors.grey),
                                  ],
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 8,
                            ),
                        itemCount: model.length),
                  ),
                ],
              ),
            ),
    );
Widget uniqwid(BuildContext context, List<ModelUnqs> unqs, HomeState state) =>
    Container(
      width: double.infinity,
      height: MediaQueryValues(context).height / 2,
      decoration: BoxDecoration(
          color: AppColors.secblack, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: state is LoadingGetUnq
                    ? Center(
                        child: Components.loadingwidget(),
                      )
                    : ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.black),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Components.defaulttext(
                                          size: 14,
                                          fontWeight: FontWeight.bold,
                                          text: unqs[index].charName!,
                                          color: AppColors.primercolor),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Expanded(
                                        child: Components.defaulttext(
                                            size: 14,
                                            fontWeight: FontWeight.bold,
                                            text: unqs[index].getName![0].name!,
                                            color: AppColors.error),
                                      ),
                                    ],
                                  ),
                                  Components.defaulttext(
                                      text:
                                          "${FormatData.checklang(unqs[index].date!, context)}",
                                      size: 12,
                                      color: AppColors.grey)
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 3,
                            ),
                        itemCount: unqs.length))
          ],
        ),
      ),
    );

/*
Widget uniqwid(BuildContext context, List<ModelUnqs> unqs, HomeState state) =>
    Container(
      width: double.infinity,
      height: MediaQueryValues(context).height / 2,
      decoration: BoxDecoration(
          color: AppColors.secblack, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: state is LoadingGetUnq
                    ? Center(
                        child: Components.loadingwidget(),
                      )
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Components.defaulttext(
                            size: 16,
                            fontWeight: FontWeight.bold,
                            text:
                                "[${unqs[index].charName}] ${AppStringTrans(context).killed} (${unqs[index].getName![0].name}) ${FormatData.checklang(unqs[index].date!, context)}",
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 3,
                            ),
                        itemCount: unqs.length))
          ],
        ),
      ),
    );
 */

Widget scheduleevent(
    BuildContext context, List<EventSchedule> event, HomeState state) {
  return Container(
    width: double.infinity,
    height: MediaQueryValues(context).height / 2,
    decoration: BoxDecoration(
        color: AppColors.secblack, borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.black),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Components.defaulttext(
                                text: event[index].Eventname!,
                                size: 18,
                                color: AppColors.primercolor),
                            Components.defaulttext(
                                text:
                                    "${FormatData().convertTo12HourFormat(event[index].time!)} ${event[index].day}",
                                size: 12,
                                color: AppColors.error)
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 3,
                      ),
                  itemCount: event.length))
        ],
      ),
    ),
  );
}
