import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/core/utils/assets_manager.dart';
import 'package:darksro/core/utils/constants.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:darksro/features/event/presentation/widgets/vipnull.dart';
import 'package:darksro/features/event/presentation/widgets/vipwid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/cubit/home_cubit.dart';

class VipScreen extends StatelessWidget {
  const VipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit()..vipcheck(),
      child: BlocConsumer<EventCubit, EventState>(
        builder: (context, state) {
          if (EventCubit.get(context).vipnull == true) {
            return VIPisNull();
          } else {
            return Scaffold(
              appBar: AppBar(
                title:
                    Components.defaulttext(text: AppStringTrans(context).vip),
              ),
              bottomNavigationBar: state is VIPCheckLoading
                  ? Center(child: Components.loadingwidget())
                  : EventCubit.get(context).vip[0].quest == '0'
                      ? null
                      : Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: Components.defaultbutton(
                              text: AppStringTrans(context).collect,
                              ontap: () => EventCubit.get(context).collectvip(
                                  context,
                                  HomeCubit.get(context).modelinfo[0].getHwid!),
                            ),
                          ),
                        ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: state is VIPCheckLoading
                      ? Center(child: Components.loadingwidget())
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            VIPWid(
                                ImgAssets.lv1,
                                "${AppStringTrans(context).lvl} 1",
                                EventCubit.get(context).vip[0].point!,
                                "1000",
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.arena),
                                        Components.defaulttext(
                                            text: "2x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.iron),
                                        Components.defaulttext(
                                            text: "1x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.gold),
                                        Components.defaulttext(
                                            text: "1x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.global),
                                        Components.defaulttext(
                                            text: "2x", size: 15)
                                      ],
                                    ),
                                  ],
                                ),
                                Constants.mypoint(int.parse(
                                            EventCubit.get(context)
                                                .vip[0]
                                                .point!)) ==
                                        1
                                    ? "load"
                                    : "complete",
                                context),
                            SizedBox(
                              height: 15,
                            ),
                            VIPWid(
                                ImgAssets.lv2,
                                "${AppStringTrans(context).lvl} 2",
                                EventCubit.get(context).vip[0].point!,
                                "3000",
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.arena),
                                        Components.defaulttext(
                                            text: "5x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.iron),
                                        Components.defaulttext(
                                            text: "2x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.gold),
                                        Components.defaulttext(
                                            text: "2x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.global),
                                        Components.defaulttext(
                                            text: "3x", size: 15)
                                      ],
                                    ),
                                  ],
                                ),
                                Constants.mypoint(int.parse(
                                            EventCubit.get(context)
                                                .vip[0]
                                                .point!)) ==
                                        2
                                    ? "load"
                                    : Constants.mypoint(int.parse(
                                                EventCubit.get(context)
                                                    .vip[0]
                                                    .point!)) >
                                            2
                                        ? "complete"
                                        : "lock",
                                context),
                            SizedBox(
                              height: 15,
                            ),
                            VIPWid(
                                ImgAssets.lv3,
                                "${AppStringTrans(context).lvl} 3",
                                EventCubit.get(context).vip[0].point!,
                                "6000",
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.arena),
                                        Components.defaulttext(
                                            text: "7x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.iron),
                                        Components.defaulttext(
                                            text: "3x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.gold),
                                        Components.defaulttext(
                                            text: "3x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.global),
                                        Components.defaulttext(
                                            text: "5x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.silk),
                                        Components.defaulttext(
                                            text: "1x", size: 15)
                                      ],
                                    ),
                                  ],
                                ),
                                Constants.mypoint(int.parse(
                                            EventCubit.get(context)
                                                .vip[0]
                                                .point!)) ==
                                        3
                                    ? "load"
                                    : Constants.mypoint(int.parse(
                                                EventCubit.get(context)
                                                    .vip[0]
                                                    .point!)) >
                                            3
                                        ? "complete"
                                        : "lock",
                                context),
                            SizedBox(
                              height: 15,
                            ),
                            VIPWid(
                                ImgAssets.lv4,
                                "${AppStringTrans(context).lvl} 4",
                                EventCubit.get(context).vip[0].point!,
                                "10000",
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.arena),
                                        Components.defaulttext(
                                            text: "10x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.iron),
                                        Components.defaulttext(
                                            text: "4x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.gold),
                                        Components.defaulttext(
                                            text: "4x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.glgreen),
                                        Components.defaulttext(
                                            text: "3x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.silk),
                                        Components.defaulttext(
                                            text: "2x", size: 15)
                                      ],
                                    ),
                                  ],
                                ),
                                Constants.mypoint(int.parse(
                                            EventCubit.get(context)
                                                .vip[0]
                                                .point!)) ==
                                        4
                                    ? "load"
                                    : Constants.mypoint(int.parse(
                                                EventCubit.get(context)
                                                    .vip[0]
                                                    .point!)) >
                                            4
                                        ? "complete"
                                        : "lock",
                                context),
                            SizedBox(
                              height: 15,
                            ),
                            VIPWid(
                                ImgAssets.lv5,
                                "${AppStringTrans(context).lvl} 5",
                                "",
                                "",
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.arena),
                                        Components.defaulttext(
                                            text: "12x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.iron),
                                        Components.defaulttext(
                                            text: "5x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.gold),
                                        Components.defaulttext(
                                            text: "5x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.glred),
                                        Components.defaulttext(
                                            text: "4x", size: 15)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(ImgAssets.silk),
                                        Components.defaulttext(
                                            text: "3x", size: 15)
                                      ],
                                    ),
                                  ],
                                ),
                                Constants.mypoint(int.parse(
                                            EventCubit.get(context)
                                                .vip[0]
                                                .point!)) ==
                                        5
                                    ? "load"
                                    : Constants.mypoint(int.parse(
                                                EventCubit.get(context)
                                                    .vip[0]
                                                    .point!)) >
                                            5
                                        ? "complete"
                                        : "lock",
                                context),
                          ],
                        ),
                ),
              ),
            );
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
