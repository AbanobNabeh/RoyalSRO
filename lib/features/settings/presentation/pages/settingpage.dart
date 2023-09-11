import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:darksro/config/network/url.dart';
import 'package:darksro/config/routes/app_routes.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/core/utils/icon_broken.dart';
import 'package:darksro/features/Splash/presentation/cubit/splash_cubit.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:darksro/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:darksro/features/settings/presentation/widgets/widform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
                  child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQueryValues(context).height / 4,
                decoration: BoxDecoration(
                    color: AppColors.secblack,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(40),
                        bottomStart: Radius.circular(40))),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CachedNetworkImage(
                        height: MediaQueryValues(context).height / 8,
                        imageUrl:
                            "${AppUrl.CharIMg}${HomeCubit.get(context).modelinfo[0].getShardUser![0].refObjID}.gif",
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
                      Components.defaulttext(
                          text: HomeCubit.get(context)
                              .modelinfo[0]
                              .getShardUser![0]
                              .charName16!,
                          size: 16),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Widform(
                        ontap: () =>
                            Navigator.pushNamed(context, AppRoutes.changepw),
                        iconData: IconBroken.Password,
                        text: AppStringTrans(context).changepw),
                    SizedBox(
                      height: 12,
                    ),
                    Widform(
                        ontap: () {
                          AwesomeDialog(
                            titleTextStyle: TextStyle(color: AppColors.white),
                            descTextStyle: TextStyle(color: AppColors.white),
                            btnCancelText: AppStringTrans(context).cancel,
                            btnOkText: AppStringTrans(context).ok,
                            context: context,
                            dialogBackgroundColor: AppColors.secblack,
                            dialogType: DialogType.info,
                            animType: AnimType.rightSlide,
                            title: AppStringTrans(context).confirmnight,
                            desc: AppStringTrans(context).changechardes,
                            btnCancelOnPress: () {},
                            btnOkOnPress: () =>
                                SettingsCubit.get(context).changechar(context),
                          ).show();
                        },
                        iconData: Icons.switch_account_outlined,
                        text: AppStringTrans(context).switcher),
                    SizedBox(
                      height: 12,
                    ),
                    Widform(
                        ontap: () {
                          if (Stringconstants.lang == null) {
                            Platform.localeName.substring(0, 2) == "ar"
                                ? SplashCubit.get(context)
                                    .changelang(context, "en")
                                : SplashCubit.get(context)
                                    .changelang(context, "ar");
                          } else {
                            Stringconstants.lang == "ar"
                                ? SplashCubit.get(context)
                                    .changelang(context, "en")
                                : SplashCubit.get(context)
                                    .changelang(context, "ar");
                          }
                        },
                        iconData: Icons.language,
                        text: AppStringTrans(context).lang),
                    SizedBox(
                      height: 12,
                    ),
                    Widform(
                        ontap: () {
                          if (HomeCubit.get(context).modelinfo[0].secContent ==
                                  '1' &&
                              HomeCubit.get(context).modelinfo[0].secPrimary ==
                                  '1') {
                            Navigator.pushNamed(context, AppRoutes.GMscreen);
                          } else {
                            SettingsCubit.get(context).checkticket(context);
                          }
                        },
                        iconData: Icons.person_2_outlined,
                        text: AppStringTrans(context).support),
                    SizedBox(
                      height: 12,
                    ),
                    Widform(
                        ontap: AppString.CanBuy == 0
                            ? () {
                                Components.errormessage(
                                    context: context,
                                    message: AppStringTrans(context).canbuy);
                              }
                            : () => Navigator.pushNamed(
                                context, AppRoutes.donatescreen),
                        iconData: IconBroken.Buy,
                        text: AppStringTrans(context).donate),
                    SizedBox(
                      height: 12,
                    ),
                    Widform(
                        ontap: () {
                          AwesomeDialog(
                            titleTextStyle: TextStyle(color: AppColors.white),
                            descTextStyle: TextStyle(color: AppColors.white),
                            btnCancelText: AppStringTrans(context).cancel,
                            btnOkText: AppStringTrans(context).logout,
                            context: context,
                            dialogBackgroundColor: AppColors.secblack,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: AppStringTrans(context).logout,
                            desc: AppStringTrans(context).logoutdes,
                            btnCancelOnPress: () {},
                            btnOkOnPress: () =>
                                SettingsCubit.get(context).logout(context),
                          ).show();
                        },
                        iconData: IconBroken.Logout,
                        text: AppStringTrans(context).logout,
                        Logout: 2),
                    SizedBox(
                      height: 12,
                    ),
                    Visibility(
                      visible: HomeCubit.get(context).modelinfo[0].secContent ==
                              "1" &&
                          HomeCubit.get(context).modelinfo[0].secPrimary == "1",
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Widform(
                            ontap: () {
                              Navigator.pushNamed(context, AppRoutes.logscreen);
                            },
                            iconData: IconBroken.Document,
                            text: AppStringTrans(context).log,
                            Logout: 1),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )));
        },
        listener: (context, state) {},
      ),
    );
  }
}
/*
     Widform(
                        ontap: () {},
                        iconData: IconBroken.Notification,
                        text: "Notification"),
                    SizedBox(
                      height: 12,
                    ),
               
 */