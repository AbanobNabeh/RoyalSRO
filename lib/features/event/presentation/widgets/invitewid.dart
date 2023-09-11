import 'package:darksro/config/network/url.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/components/app_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/icon_broken.dart';
import '../../data/models/invitemodel.dart';

Widget continfo(BuildContext context, EventCubit eventCubit, EventState state,
    InviteModel inviteModel, GlobalKey<FormState> formstate) {
  List lvl = [
    contlvl(
        context,
        Constants.lvlinvite(
                    inviteModel.invited!, inviteModel.info![0].getlvl!.lVL!) ==
                1
            ? true
            : false,
        '15',
        '500 ${AppStringTrans(context).silk}', () {
      eventCubit.collectinvite(context, 500, 1);
    }),
    contlvl(
        context,
        Constants.lvlinvite(
                    inviteModel.invited!, inviteModel.info![0].getlvl!.lVL!) ==
                2
            ? true
            : false,
        '45',
        '800 ${AppStringTrans(context).silk}', () {
      eventCubit.collectinvite(context, 800, 2);
    }),
    contlvl(
        context,
        Constants.lvlinvite(
                    inviteModel.invited!, inviteModel.info![0].getlvl!.lVL!) ==
                3
            ? true
            : false,
        '80',
        '1.2k ${AppStringTrans(context).silk}', () {
      eventCubit.collectinvite(context, 1200, 3);
    }),
    contlvl(
        context,
        Constants.lvlinvite(
                    inviteModel.invited!, inviteModel.info![0].getlvl!.lVL!) ==
                4
            ? true
            : false,
        '110',
        '2k ${AppStringTrans(context).silk}', () {
      eventCubit.collectinvite(context, 2000, 4);
    }),
    contlvl(
        context,
        Constants.lvlinvite(
                    inviteModel.invited!, inviteModel.info![0].getlvl!.lVL!) ==
                5
            ? true
            : false,
        '150',
        '5k ${AppStringTrans(context).silk}', () {
      eventCubit.collectinvite(context, 5000, 5);
    }),
    contlvl(
        context,
        Constants.lvlinvite(
                    inviteModel.invited!, inviteModel.info![0].getlvl!.lVL!) ==
                6
            ? true
            : false,
        '300',
        '20k ${AppStringTrans(context).silk}', () {
      eventCubit.collectinvite(context, 20000, 6);
    }),
  ];
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.secblack),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: MediaQueryValues(context).height / 6,
                  child: Components.defchachedimg(
                      '${AppUrl.CharIMg}${HomeCubit.get(context).modelinfo[0].getShardUser![0].refObjID}.gif'),
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Components.defaulttext(
                          text:
                              "${AppStringTrans(context).charName} ${HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16}",
                          size: 14),
                      Components.defaulttext(
                          text:
                              "${AppStringTrans(context).invited} : ${inviteModel.invited}",
                          size: 14),
                      Components.defaulttext(
                          text:
                              "${AppStringTrans(context).lvl} : ${inviteModel.info![0].getlvl!.lVL}",
                          size: 14),
                      Row(
                        children: [
                          Components.defaulttext(
                              text: "${AppStringTrans(context).yourcode} : ",
                              size: 14),
                          Components.defaulttext(
                              text: inviteModel.info![0].code.toString(),
                              size: 14,
                              color: AppColors.primercolor),
                          SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text: inviteModel.info![0].code.toString()));
                            },
                            child: Icon(
                              Icons.copy,
                              color: AppColors.white,
                              size: 16,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        state is GETCodeRedemLoading
            ? LinearProgressIndicator(
                color: AppColors.primercolor,
                backgroundColor: AppColors.white,
              )
            : Visibility(
                visible: inviteModel.redem!,
                child: ReedemRW(eventCubit, formstate, context)),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: lvl.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            mainAxisExtent: 256,
          ),
          itemBuilder: (context, index) {
            return lvl[index];
          },
        ),
      ],
    ),
  );
}

Widget redemCode(
    BuildContext context, EventCubit eventCubit, EventState state) {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  return Form(
    key: formState,
    child: state is CreateCodeLoading
        ? Components.loadingwidget()
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Components.defaultform(
                  controller: eventCubit.codecontroller,
                  maxLength: 12,
                  validator: (value) {
                    if (value!.length < 5) {
                      return AppStringTrans(context).lesscode;
                    }
                  },
                  hint: AppStringTrans(context).reedemcode),
              Visibility(
                visible: EventCubit.get(context).redemerror,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        IconBroken.Close_Square,
                        color: AppColors.error,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Components.defaulttext(
                        text: AppStringTrans(context).codeused,
                        size: 16,
                        color: AppColors.error,
                      ),
                    ],
                  ),
                ),
              ),
              Components.defaultbutton(
                text: AppStringTrans(context).create,
                ontap: () {
                  if (formState.currentState!.validate()) {
                    eventCubit.createcode(context);
                  }
                },
              )
            ],
          ),
  );
}

Widget contlvl(BuildContext context, bool collect, String invite, String RW,
    Function()? ontap) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: InkWell(
      onTap: collect == true ? ontap : null,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: collect == true ? AppColors.success : AppColors.secblack),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  IconBroken.Add_User,
                  color: AppColors.white,
                ),
                Components.defaulttext(text: invite, size: 14),
                SizedBox(
                  height: 7,
                ),
                Components.defaulttext(text: RW, size: 14),
                Visibility(
                  visible: collect,
                  child: Components.defaulttext(
                    text: AppStringTrans(context).taptocollect,
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget ReedemRW(EventCubit eventCubit, GlobalKey<FormState> formstate,
    BuildContext context) {
  return Form(
    key: formstate,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Components.defaultform(
              controller: eventCubit.giftcodecontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStringTrans(context).redeemcode;
                } else if (value == eventCubit.infoinv[0].info![0].code) {
                  return AppStringTrans(context).cantusedyoucode;
                }
              },
              hint: AppStringTrans(context).redeemcode,
              suffixIcon: Icons.check_box,
              suffixcolor: AppColors.success,
              suffixIcontap: () {
                if (formstate.currentState!.validate()) {
                  eventCubit.getredem(context);
                }
              }),
          SizedBox(
            height: 8,
          ),
          Visibility(
            visible: eventCubit.errorgift,
            child: Row(
              children: [
                Icon(
                  IconBroken.Close_Square,
                  color: AppColors.error,
                  size: 18,
                ),
                SizedBox(
                  width: 3,
                ),
                Components.defaulttext(
                    text: AppStringTrans(context).codeincorrect,
                    color: AppColors.error,
                    size: 15)
              ],
            ),
          )
        ],
      ),
    ),
  );
}
