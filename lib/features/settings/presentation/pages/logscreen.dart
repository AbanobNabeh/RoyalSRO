import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:darksro/features/settings/presentation/widgets/logwid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit()..getbuy(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        builder: (context, state) {
          List pages = [
            state is GetBuyLoading
                ? Center(
                    child: Components.loadingwidget(),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buywid(
                            SettingsCubit.get(context).buylist[index], context),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container();
                    },
                    itemCount: SettingsCubit.get(context).buylist.length),
            state is GetSellLoading
                ? Center(
                    child: Components.loadingwidget(),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: sellwid(
                            SettingsCubit.get(context).selllist[index],
                            context),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container();
                    },
                    itemCount: SettingsCubit.get(context).selllist.length),
            state is GetDonatePaymenLoading
                ? Center(
                    child: Components.loadingwidget(),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: donatewid(
                            SettingsCubit.get(context).donate[index], context),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container();
                    },
                    itemCount: SettingsCubit.get(context).donate.length)
          ];
          return Scaffold(
            appBar: AppBar(
              title: Components.defaulttext(text: AppStringTrans(context).log),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
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
                                onTap: SettingsCubit.get(context).logindex != 0
                                    ? () {
                                        SettingsCubit.get(context)
                                            .changeindex(0);
                                      }
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          SettingsCubit.get(context).logindex ==
                                                  0
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
                                onTap: SettingsCubit.get(context).logindex != 1
                                    ? () {
                                        SettingsCubit.get(context)
                                            .changeindex(1);
                                      }
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          SettingsCubit.get(context).logindex ==
                                                  1
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
                            Expanded(
                              child: InkWell(
                                onTap: SettingsCubit.get(context).logindex != 2
                                    ? () {
                                        SettingsCubit.get(context)
                                            .changeindex(2);
                                      }
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          SettingsCubit.get(context).logindex ==
                                                  2
                                              ? AppColors.primercolor
                                              : AppColors.secblack,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Components.defaulttext(
                                          text: AppStringTrans(context).donate,
                                          size: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  pages[SettingsCubit.get(context).logindex]
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
