import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/icon_broken.dart';

Widget bottomNavigationBar(BuildContext context, HomeCubit homeCubit) =>
    FloatingNavbar(
      onTap: (int val) {
        homeCubit.changepage(val);
      },
      currentIndex: homeCubit.index,
      items: [
        FloatingNavbarItem(
            icon: IconBroken.Home, title: AppStringTrans(context).home),
        FloatingNavbarItem(
            icon: IconBroken.Calendar, title: AppStringTrans(context).event),
        FloatingNavbarItem(
            icon: IconBroken.Category, title: AppStringTrans(context).mission),
        FloatingNavbarItem(
            icon: IconBroken.Setting, title: AppStringTrans(context).setting),
      ],
      backgroundColor: AppColors.secblack,
      selectedItemColor: AppColors.primercolor,
      selectedBackgroundColor: AppColors.black,
    );
