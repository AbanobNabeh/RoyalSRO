import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:darksro/config/network/url.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/event/data/models/NightMarketModel.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

import '../cubit/event_cubit.dart';

Widget ItemNight(NightMarketModel market, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.secblack,
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                child: Components.defchachedimg(
                    "${AppUrl.CharIMg}${market.charIMG}.gif"),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Components.defaulttext(
                        text: market.charname!, color: AppColors.primercolor),
                    Components.defaulttext(
                        text: market.date!, color: AppColors.grey, size: 14),
                    Components.defaulttext(
                        text:
                            "${market.silk} ${AppStringTrans(context).silks}"),
                    Components.defaulttext(
                        text:
                            "${market.price} ${AppStringTrans(context).darkpoint}")
                  ],
                ),
              ),
            ],
          ),
          /* market.charID ==
                  HomeCubit.get(context)
                      .modelinfo[0]
                      .getShardUser![0]
                      .charID
                      .toString()
              ? Container(
                  child: MaterialButton(
                    onPressed: () {
                      AwesomeDialog(
                        titleTextStyle: TextStyle(color: AppColors.white),
                        descTextStyle: TextStyle(color: AppColors.white),
                        btnCancelText: AppStringTrans(context).cancel,
                        btnOkText: AppStringTrans(context).ok,
                        context: context,
                        dialogBackgroundColor: AppColors.secblack,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: AppStringTrans(context).confirmnight,
                        desc: AppStringTrans(context).deletemsg,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      )..show();
                    },
                    child: Components.defaulttext(
                        text: AppStringTrans(context).delete,
                        color: AppColors.white,
                        size: 20),
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.error,
                      borderRadius: BorderRadius.circular(7.5)),
                )
              :
              */
          market.charID ==
                  HomeCubit.get(context)
                      .modelinfo[0]
                      .getShardUser![0]
                      .charID
                      .toString()
              ? Container(
                  child: MaterialButton(
                    onPressed: () {
                      AwesomeDialog(
                        titleTextStyle: TextStyle(color: AppColors.white),
                        descTextStyle: TextStyle(color: AppColors.white),
                        btnCancelText: AppStringTrans(context).cancel,
                        btnOkText: AppStringTrans(context).ok,
                        context: context,
                        dialogBackgroundColor: AppColors.secblack,
                        dialogType: DialogType.info,
                        animType: AnimType.rightSlide,
                        title: AppStringTrans(context).delete,
                        desc: AppStringTrans(context).deletemsg,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () => EventCubit.get(context).deleteoffer(
                            silk: market.silk!,
                            iD: market.iD!,
                            homeCubit: HomeCubit.get(context),
                            context: context),
                      )..show();
                    },
                    child: Components.defaulttext(
                        text: AppStringTrans(context).delete,
                        color: AppColors.white,
                        size: 20),
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.error,
                      borderRadius: BorderRadius.circular(7.5)),
                )
              : Container(
                  child: MaterialButton(
                    onPressed: () {
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
                        desc:
                            "${AppStringTrans(context).buymsg} \n ${market.silk} ${AppStringTrans(context).silks} = ${market.price} ${AppStringTrans(context).darkpoint}",
                        btnCancelOnPress: () {},
                        btnOkOnPress: () => EventCubit.get(context)
                            .buyNightmarket(
                                CharIDseller: market.charID!,
                                price: market.price!,
                                silk: market.silk!,
                                iD: market.iD!,
                                homeCubit: HomeCubit.get(context),
                                context: context),
                      )..show();
                    },
                    child: Components.defaulttext(
                        text: AppStringTrans(context).buy,
                        color: AppColors.white,
                        size: 20),
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.primercolor,
                      borderRadius: BorderRadius.circular(7.5)),
                )
        ],
      ),
    ),
  );
}

Widget Filter(EventCubit event, BuildContext context) {
  var formstate = GlobalKey<FormState>();
  return Visibility(
    visible: event.filter,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColors.secblack),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formstate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Components.defaulttext(
                    text: AppStringTrans(context).silks,
                    color: AppColors.primercolor),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Components.defaultform(
                              controller: event.minsilk,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStringTrans(context).min;
                                } else if (int.parse(value) >=
                                    int.parse(event.maxsilk.text)) {
                                  return '> ${event.maxsilk.text}';
                                }
                              },
                              maxLength: 6,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.number,
                              hint: AppStringTrans(context).min)),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                          child: Components.defaultform(
                              controller: event.maxsilk,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStringTrans(context).max;
                                } else if (int.parse(value) <=
                                    int.parse(event.minsilk.text)) {
                                  return "< ${event.minsilk.text}";
                                }
                              },
                              maxLength: 6,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.number,
                              hint: AppStringTrans(context).max)),
                    ],
                  ),
                ),
                Components.defaulttext(
                    text: AppStringTrans(context).price,
                    color: AppColors.primercolor),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Components.defaultform(
                              controller: event.minprice,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStringTrans(context).min;
                                } else if (int.parse(value) >=
                                    int.parse(event.maxprice.text)) {
                                  return '> ${event.maxprice.text}';
                                }
                              },
                              maxLength: 6,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.number,
                              hint: AppStringTrans(context).min)),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                          child: Components.defaultform(
                              controller: event.maxprice,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStringTrans(context).max;
                                } else if (int.parse(value) <=
                                    int.parse(event.minprice.text)) {
                                  return '< ${event.minprice.text}';
                                }
                              },
                              maxLength: 6,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.number,
                              hint: AppStringTrans(context).max)),
                    ],
                  ),
                ),
                Container(
                  child: MaterialButton(
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        event.getnightmarket(
                            minsilk: event.minsilk.text,
                            maxsilk: event.maxsilk.text,
                            minprice: event.minprice.text,
                            maxprice: event.maxprice.text);
                        event.filterstate();
                      }
                    },
                    child: Components.defaulttext(
                        text: AppStringTrans(context).apply,
                        color: AppColors.white,
                        size: 20),
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.primercolor,
                      borderRadius: BorderRadius.circular(7.5)),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
