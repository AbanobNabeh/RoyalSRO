import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:darksro/features/event/presentation/widgets/rewardlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';

class RoyalPassScreen extends StatelessWidget {
  const RoyalPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit()..getRoyalpass(context),
      child: BlocConsumer<EventCubit, EventState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title:
                Components.defaulttext(text: AppStringTrans(context).royalpass),
            actions: [
              InkWell(
                onTap: () => EventCubit.get(context).gotomission(context),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primercolor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Components.defaulttext(
                              text: AppStringTrans(context).mission)),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: state is RoyalPassGetLoading
                  ? Components.loadingwidget()
                  : Column(
                      children: [
                        royalpassinfo(
                            EventCubit.get(context).royalpassplayer[0],
                            context),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.secblack),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Components.defaulttext(
                                        text: AppStringTrans(context).lvl,
                                        color: AppColors.primercolor,
                                        fontWeight: FontWeight.bold),
                                    for (int i = 0;
                                        i <
                                            EventCubit.get(context)
                                                .rewardroyalmodel
                                                .length;
                                        i++)
                                      lvllist(
                                          EventCubit.get(context)
                                              .rewardroyalmodel[i],
                                          i,
                                          context)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Components.defaulttext(
                                        text: AppStringTrans(context).normal,
                                        color: AppColors.primercolor,
                                        fontWeight: FontWeight.bold),
                                    for (int i = 0;
                                        i <
                                            EventCubit.get(context)
                                                .rewardroyalmodel
                                                .length;
                                        i++)
                                      imagelist(
                                          EventCubit.get(context)
                                              .rewardroyalmodel[i],
                                          i,
                                          context)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Components.defaulttext(
                                        text: AppStringTrans(context).vip,
                                        color: AppColors.primercolor,
                                        fontWeight: FontWeight.bold),
                                    for (int i = 0;
                                        i <
                                            EventCubit.get(context)
                                                .rewardroyalmodel
                                                .length;
                                        i++)
                                      imageviplist(
                                          EventCubit.get(context)
                                              .rewardroyalmodel[i],
                                          i,
                                          context)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Components.defaulttext(
                                        text: AppStringTrans(context).status,
                                        color: AppColors.primercolor,
                                        fontWeight: FontWeight.bold),
                                    for (int i = 0;
                                        i <
                                            EventCubit.get(context)
                                                .rewardroyalmodel
                                                .length;
                                        i++)
                                      int.parse(EventCubit.get(context)
                                                      .rewardroyalmodel[i]
                                                      .lvl!) >
                                                  int.parse(
                                                      EventCubit.get(context)
                                                          .royalpassplayer[0]
                                                          .lvl!) ||
                                              EventCubit.get(context).isnew ==
                                                  true
                                          ? Container(
                                              height: MediaQueryValues(context)
                                                      .height /
                                                  15,
                                              child: Components.defaulttext(
                                                  text: AppStringTrans(context)
                                                      .locked,
                                                  color: AppColors.error),
                                            )
                                          : statuslist(
                                              int.parse(EventCubit.get(context)
                                                  .rewardroyalmodel[i]
                                                  .lvl!),
                                              int.parse(EventCubit.get(context)
                                                  .royalpassplayer[0]
                                                  .collectlvl!),
                                              context,
                                              i),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
        listener: (context, state) {},
      ),
    );
  }
}
