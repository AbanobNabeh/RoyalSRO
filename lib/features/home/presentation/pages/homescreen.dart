import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:darksro/features/home/presentation/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
  String charID;
  HomeScreen(this.charID);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        return LiquidPullToRefresh(
          animSpeedFactor: 1,
          backgroundColor: AppColors.primercolor,
          color: AppColors.secblack,
          onRefresh: () async {
            HomeCubit.get(context).GetInfo();
            return await Future.delayed(Duration(seconds: 1));
          },
          child: Scaffold(
            body: state is LoadingGetINFO
                ? Center(
                    child: Components.loadingwidget(),
                  )
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          infowid(context, HomeCubit.get(context),
                              HomeCubit.get(context).modelinfo[0], state),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            child: Components.defaulttext(
                                text: AppStringTrans(context).globalchatting,
                                color: AppColors.primercolor),
                            alignment: AlignmentDirectional.topStart,
                          ),
                          Globalwid(context, HomeCubit.get(context),
                              HomeCubit.get(context).globals, state),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            child: Components.defaulttext(
                                text: AppStringTrans(context).latestuniquekills,
                                color: AppColors.primercolor),
                            alignment: AlignmentDirectional.topStart,
                          ),
                          uniqwid(context, HomeCubit.get(context).unqs, state),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            child: Components.defaulttext(
                                text: AppStringTrans(context).eventschedule,
                                color: AppColors.primercolor),
                            alignment: AlignmentDirectional.topStart,
                          ),
                          state is LoadingGetEvent
                              ? Center(
                                  child: Components.loadingwidget(),
                                )
                              : scheduleevent(context,
                                  HomeCubit.get(context).events, state),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
