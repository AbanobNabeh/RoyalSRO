import 'package:flutter/material.dart';

import '../../../../core/components/app_components.dart';
import '../../../../core/utils/app_colors.dart';

Widget Widform(
    {required Function()? ontap,
    required iconData,
    required String text,
    int Logout = 0}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secblack,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Logout == 2 ? AppColors.error : AppColors.primercolor,
              size: 26,
            ),
            SizedBox(
              width: 7,
            ),
            Components.defaulttext(text: text, size: 16)
          ],
        ),
      ),
    ),
  );
}
