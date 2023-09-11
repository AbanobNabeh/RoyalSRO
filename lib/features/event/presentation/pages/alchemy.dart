import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/assets_manager.dart';
import 'package:darksro/core/utils/icon_broken.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:darksro/features/event/presentation/widgets/alchemywid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AlchemyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit()..alchemy(),
      child: BlocConsumer<EventCubit, EventState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Components.defaulttext(text: "Alchemy"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.secblack,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              width: 50,
                              height: 50,
                              imageUrl: EventCubit.get(context)
                                          .alchemyst['img'] ==
                                      ''
                                  ? 'http://89.163.221.170:88/image/sro/equipment/clean.png'
                                  : EventCubit.get(context).alchemyst['img'],
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: AppColors.primercolor,
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                color: AppColors.error,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Components.defaulttext(
                                      text: EventCubit.get(context)
                                                  .alchemyst['name'] !=
                                              ''
                                          ? "${EventCubit.get(context).alchemyst['name']} (+${EventCubit.get(context).alchemyst['plus']})"
                                          : ""),
                                  Container(
                                    width: double.infinity,
                                    color: AppColors.black,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Components.defaulttext(
                                          text: EventCubit.get(context)
                                              .alchemyst['stat'],
                                          size: 15,
                                          color: AppColors.error),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  state is AlchemyGetLoading
                                      ? LinearProgressIndicator()
                                      : Elixirwid(
                                          EventCubit.get(context).elixir!),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Visibility(
                                    visible: EventCubit.get(context)
                                            .alchemyst['name'] !=
                                        '',
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        EventCubit.get(context).vipalchemy ==
                                                false
                                            ? Icon(
                                                IconBroken.Lock,
                                                color: AppColors.error,
                                              )
                                            : Checkbox(
                                                value: true,
                                                onChanged: (value) {},
                                                activeColor:
                                                    AppColors.primercolor,
                                              ),
                                        Components.defaulttext(
                                            text: 'Auto', size: 16),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: AppColors.primercolor),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Components.defaulttext(
                                                  text: 'Go plus', size: 16),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: state is AlchemyGetLoading
                          ? Components.loadingwidget()
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.secblack),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: MediaQueryValues(context)
                                            .width /
                                        (MediaQueryValues(context).height / 3),
                                  ),
                                  itemBuilder: (context, index) => inventoryWid(
                                      EventCubit.get(context),
                                      EventCubit.get(context)
                                          .alchemydata[index]),
                                  itemCount: EventCubit.get(context)
                                      .alchemydata
                                      .length,
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
