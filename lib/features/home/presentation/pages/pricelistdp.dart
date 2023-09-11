import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:darksro/features/home/presentation/widgets/pricedpwid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';

class PriceDPScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        List<Widget> screen = [
          BuyDP(context, scaffoldState),
          SellDP(context, scaffoldState, state)
        ];
        return Scaffold(
          key: scaffoldState,
          appBar: AppBar(
            title:
                Components.defaulttext(text: AppStringTrans(context).darkpoint),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
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
                                onTap: HomeCubit.get(context).indexpage == 2
                                    ? () {
                                        HomeCubit.get(context)
                                            .changepageprice(1);
                                      }
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          HomeCubit.get(context).indexpage == 1
                                              ? AppColors.primercolor
                                              : AppColors.secblack,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Components.defaulttext(
                                          text: AppStringTrans(context).buy,
                                          size: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: HomeCubit.get(context).indexpage == 1
                                    ? () {
                                        HomeCubit.get(context)
                                            .changepageprice(2);
                                      }
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          HomeCubit.get(context).indexpage == 2
                                              ? AppColors.primercolor
                                              : AppColors.secblack,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Components.defaulttext(
                                          text: AppStringTrans(context).sell,
                                          size: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  screen[HomeCubit.get(context).indexpage - 1]
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
