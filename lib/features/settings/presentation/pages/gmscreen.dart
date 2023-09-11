import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/icon_broken.dart';
import 'package:darksro/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class GMScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Builder(builder: (context) {
        SettingsCubit.get(context).getticket();
        return BlocConsumer<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () async {
                        await FirebaseMessaging.instance
                            .subscribeToTopic('supportticket');
                      },
                      icon: Icon(
                        IconBroken.Notification,
                        color: AppColors.primercolor,
                      ))
                ],
              ),
              body: LiquidPullToRefresh(
                animSpeedFactor: 1,
                backgroundColor: AppColors.primercolor,
                color: AppColors.secblack,
                onRefresh: () async {
                  SettingsCubit.get(context).getticket();
                  return await Future.delayed(Duration(seconds: 1));
                },
                child: SingleChildScrollView(
                  child: state is GetTicketChatLoading
                      ? Center(
                          child: Components.loadingwidget(),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => SettingsCubit.get(context)
                                      .gmread(
                                          context,
                                          SettingsCubit.get(context)
                                              .tickets[index]),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.secblack,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Components.defaulttext(
                                                    text:
                                                        "Ticket#${SettingsCubit.get(context).tickets[index].iD}",
                                                    color:
                                                        AppColors.primercolor,
                                                    size: 18),
                                                Components.defaulttext(
                                                    text: SettingsCubit.get(
                                                            context)
                                                        .tickets[index]
                                                        .title!,
                                                    size: 14),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Column(
                                            children: [
                                              Components.defaulttext(
                                                  text:
                                                      SettingsCubit.get(context)
                                                          .tickets[index]
                                                          .category!,
                                                  size: 15),
                                              Visibility(
                                                  visible:
                                                      SettingsCubit.get(context)
                                                              .tickets[index]
                                                              .supread ==
                                                          "0",
                                                  child: CircleAvatar(
                                                    radius: 7.5,
                                                    backgroundColor:
                                                        AppColors.primercolor,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 7,
                                );
                              },
                              itemCount:
                                  SettingsCubit.get(context).tickets.length),
                        ),
                ),
              ),
            );
          },
          listener: (context, state) {},
        );
      }),
    );
  }
}
