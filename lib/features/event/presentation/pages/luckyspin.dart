import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import '../widgets/royalpasstool.dart';

class LuckySpin extends StatelessWidget {
  const LuckySpin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EventCubit()..checkspin(HomeCubit.get(context).modelinfo[0].getHwid!),
      child: BlocConsumer<EventCubit, EventState>(
        builder: (context, state) {
          var cubit = EventCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Components.defaulttext(
                  text: AppStringTrans(context).luckyspin, size: 25),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: state is CheckSpinLoading
                  ? Center(
                      child: Components.loadingwidget(),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: FortuneWheel(
                            onAnimationEnd: () {
                              cubit.sendrw(context);
                            },
                            selected: cubit.select,
                            animateFirst: false,
                            items: [
                              for (int i = 0;
                                  i < RoyalPassTool.spinitem.length;
                                  i++) ...<FortuneItem>{
                                FortuneItem(
                                    child: Components.defaulttext(
                                        text: RoyalPassTool.spinitem[i]
                                            ['name']))
                              }
                            ],
                          ),
                        ),
                        Visibility(
                          visible: cubit.spin,
                          child: Components.defaultbutton(
                              isload: state is LuckySpinLoading,
                              text: AppStringTrans(context).spin,
                              ontap: () {
                                cubit.select.add(Fortune.randomInt(
                                    0, RoyalPassTool.spinitem.length));
                                cubit.luckyspin(HomeCubit.get(context)
                                    .modelinfo[0]
                                    .getHwid!);
                              }),
                        ),
                        Components.defaulttext(text: cubit.spintime)
                      ],
                    ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
