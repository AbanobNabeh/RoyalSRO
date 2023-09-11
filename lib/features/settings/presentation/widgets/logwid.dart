import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:darksro/config/network/url.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/settings/data/models/buymodel.dart';
import 'package:darksro/features/settings/data/models/donatepaymentmodel.dart';
import 'package:darksro/features/settings/data/models/sellmodel.dart';
import 'package:darksro/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_screen_image/full_screen_image.dart';

Widget buywid(BuyModel buy, BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.secblack,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Components.defaulttext(
              text: "CharName : ${buy.playerName!}",
              color: AppColors.primercolor),
          Components.defaulttext(
              text: "Mobile wallet  0${buy.phonenumber}",
              color: AppColors.white),
          Components.defaulttext(
              text: "payment wallet 0${buy.mobilewallet}",
              color: AppColors.white),
          Components.defaulttext(
              text: "${buy.countDP} ${AppStringTrans(context).darkpoint}",
              color: AppColors.white),
          Components.defaulttext(
              text: "${buy.lE} ${AppStringTrans(context).le}",
              color: AppColors.white),
          Components.defaulttext(text: "${buy.date}", color: AppColors.grey),
          FullScreenWidget(
              child: Components.defchachedimg(
                  "${AppUrl.BUYLING}${buy.playerName}/${buy.screenshot}",
                  wid: 80),
              disposeLevel: DisposeLevel.Medium),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Components.defaulttextbutton(
                ontap: () {
                  AwesomeDialog(
                      titleTextStyle: TextStyle(color: AppColors.white),
                      descTextStyle: TextStyle(color: AppColors.white),
                      btnCancelText: "لا",
                      btnOkText: "ياعم متاكد",
                      context: context,
                      dialogBackgroundColor: AppColors.secblack,
                      dialogType: DialogType.info,
                      animType: AnimType.rightSlide,
                      title: AppStringTrans(context).confirmnight,
                      desc: "متاكد من الطلب دي ؟؟ ",
                      btnCancelOnPress: () {},
                      btnOkOnPress: () => SettingsCubit.get(context)
                          .acceptbuy(buy, context)).show();
                },
                text: AppStringTrans(context).accept,
                size: 18,
                color: AppColors.primercolor),
          )
        ],
      ),
    ),
  );
}

Widget sellwid(SellModel sell, BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.secblack,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Components.defaulttext(
              text: "CharName : ${sell.charName!}",
              color: AppColors.primercolor),
          InkWell(
            onTap: () async {
              await Clipboard.setData(
                  ClipboardData(text: "0${sell.phoneNumber}"));
            },
            child: Components.defaulttext(
                text: "Mobile Wallet : 0${sell.phoneNumber}",
                color: AppColors.white),
          ),
          Components.defaulttext(
              text: "${sell.darkpoint} ${AppStringTrans(context).darkpoint}",
              color: AppColors.white),
          Components.defaulttext(
              text: "${sell.lE} ${AppStringTrans(context).le}",
              color: AppColors.white),
          Components.defaulttext(text: "${sell.date}", color: AppColors.grey),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Components.defaulttextbutton(
                ontap: () {
                  AwesomeDialog(
                      titleTextStyle: TextStyle(color: AppColors.white),
                      descTextStyle: TextStyle(color: AppColors.white),
                      btnCancelText: "لا",
                      btnOkText: "ياعم متاكد",
                      context: context,
                      dialogBackgroundColor: AppColors.secblack,
                      dialogType: DialogType.info,
                      animType: AnimType.rightSlide,
                      title: AppStringTrans(context).confirmnight,
                      desc: "متاكد من الطلب دي ؟؟ ",
                      btnCancelOnPress: () {},
                      btnOkOnPress: () => SettingsCubit.get(context)
                          .acceptsell(sell, context)).show();
                },
                text: AppStringTrans(context).accept,
                size: 18,
                color: AppColors.primercolor),
          )
        ],
      ),
    ),
  );
}

Widget donatewid(DonatePaymentModel donate, BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.secblack,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Components.defaulttext(
              text: "Charname : ${donate.charName!}",
              color: AppColors.primercolor),
          InkWell(
            onTap: () async {
              await Clipboard.setData(
                  ClipboardData(text: "0${donate.phonenumber}"));
            },
            child: Components.defaulttext(
                text: "Mobile Wallet 0${donate.phonenumber}",
                color: AppColors.white),
          ),
          Components.defaulttext(
              text: "Payment Wallet 0${donate.wallet}", color: AppColors.white),
          Components.defaulttext(
              text: "${donate.name}", color: AppColors.white),
          Components.defaulttext(
              text: "${donate.price} ${AppStringTrans(context).le}",
              color: AppColors.white),
          FullScreenWidget(
              child: Components.defchachedimg(
                  "${AppUrl.DONATEING}${donate.charName}/${donate.image}",
                  wid: 80),
              disposeLevel: DisposeLevel.Medium),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Components.defaulttextbutton(
                ontap: () {
                  AwesomeDialog(
                      titleTextStyle: TextStyle(color: AppColors.white),
                      descTextStyle: TextStyle(color: AppColors.white),
                      btnCancelText: "لا",
                      btnOkText: "ياعم متاكد",
                      context: context,
                      dialogBackgroundColor: AppColors.secblack,
                      dialogType: DialogType.info,
                      animType: AnimType.rightSlide,
                      title: AppStringTrans(context).confirmnight,
                      desc: "متاكد من الطلغ دي ؟؟ ",
                      btnCancelOnPress: () {},
                      btnOkOnPress: () => SettingsCubit.get(context)
                          .acceptdonate(donate, context)).show();
                },
                text: AppStringTrans(context).accept,
                size: 18,
                color: AppColors.primercolor),
          )
        ],
      ),
    ),
  );
}
