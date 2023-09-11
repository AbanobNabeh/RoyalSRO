import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/app_components.dart';

Widget VIPWid(
  String IMGLVL,
  String lvl,
  String point,
  String maxpoint,
  Widget rw,
  String state,
  BuildContext context,
) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: AppColors.secblack, borderRadius: BorderRadius.circular(8)),
    child: Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.asset(IMGLVL),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Components.defaulttext(text: lvl),
                          state == "complete"
                              ? Components.defaulttext(
                                  text: AppStringTrans(context)
                                      .completed
                                      .toUpperCase(),
                                  color: AppColors.success,
                                  size: 14,
                                  fontWeight: FontWeight.bold)
                              : state == "lock"
                                  ? Components.defaulttext(
                                      text: AppStringTrans(context)
                                          .locked
                                          .toUpperCase(),
                                      color: AppColors.error,
                                      size: 14,
                                      fontWeight: FontWeight.bold)
                                  : Components.defaulttext(
                                      text: "${point} ~ ${maxpoint}", size: 16),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              rw,
            ],
          ),
        ),
      ],
    ),
  );
}
