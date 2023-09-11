import 'package:darksro/config/routes/app_routes.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/event/presentation/pages/eventpage.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:darksro/features/home/presentation/pages/homescreen.dart';
import 'package:darksro/features/settings/presentation/pages/settingpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/app_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../mission/presentation/pages/missionscreen.dart';
import '../widgets/bottomnavbar.dart';

class HomePage extends StatelessWidget {
  String charID;
  HomePage(this.charID);

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeScreen(charID),
      EventPage(),
      MissionScreen(),
      SettingsPage()
    ];
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStringTrans(context).AppName),
            actions: [
              state is LoadingGetINFO
                  ? Center(
                      child: Components.loadingwidget(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, AppRoutes.pricedp),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(ImgAssets.dp),
                                SizedBox(
                                  width: 7,
                                ),
                                Components.defaulttext(
                                    text: Components.Formataint(int.parse(
                                        HomeCubit.get(context)
                                            .modelinfo[0]
                                            .getShardUser![0]
                                            .DarkPoint!)),
                                    size: 18)
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.secblack),
                        ),
                      ),
                    )
            ],
          ),
          bottomNavigationBar:
              bottomNavigationBar(context, HomeCubit.get(context)),
          body: screen[HomeCubit.get(context).index],
        );
      },
      listener: (context, state) {},
    );
  }
}
