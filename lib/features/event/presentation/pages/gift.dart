import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/app_components.dart';

class GiftScreen extends StatelessWidget {
  const GiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit()..Checkgift(context),
      child: BlocConsumer<EventCubit, EventState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Components.defaulttext(
                  text: AppStringTrans(context).gift,
                )),
            body: Center(
              child: state is GiftCheckLoading || state is CollectGiftLoading
                  ? Components.loadingwidget()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        EventCubit.get(context).usergift.isNotEmpty
                            ? Components.defaulttext(
                                text:
                                    "${EventCubit.get(context).usergift[0].charName}\n${EventCubit.get(context).usergift[0].silk}",
                                textAlign: TextAlign.center)
                            : EventCubit.get(context).gifttime == false
                                ? Components.defaulttext(
                                    text: AppStringTrans(context).gifttimeout,
                                    color: AppColors.error)
                                : Components.defaultbutton(
                                    width: MediaQueryValues(context).width / 2,
                                    text: AppStringTrans(context).collect,
                                    ontap: () => EventCubit.get(context)
                                        .collectgift(
                                            HomeCubit.get(context), context))
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
