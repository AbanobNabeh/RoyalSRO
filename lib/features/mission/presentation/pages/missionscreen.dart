import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/mission/presentation/cubit/mission_cubit.dart';
import 'package:darksro/features/mission/presentation/widgets/daily.dart';
import 'package:darksro/features/mission/presentation/widgets/weakly.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MissionCubit()..checkdaily(),
      child: BlocConsumer<MissionCubit, MissionState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.secblack,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: double.infinity,
                      height: 55,
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: MissionCubit.get(context).indexpage == 1
                                  ? null
                                  : () => MissionCubit.get(context)
                                      .changepage(1, context),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        MissionCubit.get(context).indexpage == 1
                                            ? AppColors.primercolor
                                            : AppColors.secblack,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Components.defaulttext(
                                        text:
                                            AppStringTrans(context).rewarddaily,
                                        size: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: MissionCubit.get(context).indexpage == 2
                                  ? null
                                  : () => MissionCubit.get(context)
                                      .changepage(2, context),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        MissionCubit.get(context).indexpage == 2
                                            ? AppColors.primercolor
                                            : AppColors.secblack,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Components.defaulttext(
                                        text: AppStringTrans(context)
                                            .weeklymission,
                                        size: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MissionCubit.get(context).indexpage == 1
                      ? DailyWid(MissionCubit.get(context).rw, state, context,
                          MissionCubit.get(context))
                      : WeeklyWid(MissionCubit.get(context), state, context)
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
