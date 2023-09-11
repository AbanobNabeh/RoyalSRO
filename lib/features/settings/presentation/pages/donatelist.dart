import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:darksro/features/settings/presentation/widgets/paymentwid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';

class DonateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit()..getdonate(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title:
                  Components.defaulttext(text: AppStringTrans(context).donate),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.secblack,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Components.defaulttext(
                                          text:
                                              '${SettingsCubit.get(context).donatelist[index].name}',
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primercolor),
                                      Components.defaulttext(
                                          text:
                                              '${SettingsCubit.get(context).donatelist[index].price} ${AppStringTrans(context).le}'),
                                    ],
                                  ),
                                ),
                                SettingsCubit.get(context).indexpayment ==
                                        index + 1
                                    ? SizedBox()
                                    : Expanded(
                                        child: Components.defaultbutton(
                                            text: AppStringTrans(context).buy,
                                            ontap: () =>
                                                SettingsCubit.get(context)
                                                    .changepayment(index + 1),
                                            boxShadow: 0))
                              ],
                            ),
                            paymentwid(context, index,
                                SettingsCubit.get(context).donatelist[index])
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: SettingsCubit.get(context).donatelist.length),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
