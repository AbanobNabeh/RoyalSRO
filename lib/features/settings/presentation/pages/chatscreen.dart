import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_permission.dart';
import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/core/utils/assets_manager.dart';
import 'package:darksro/core/utils/icon_broken.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:darksro/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:darksro/features/settings/presentation/widgets/chatwid.dart';
import 'package:darksro/features/settings/presentation/widgets/imgwid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/ticketmodel.dart';

class ChatScreen extends StatelessWidget {
  ModelTicket ticket;

  ChatScreen(this.ticket);
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Builder(builder: (context) {
        SettingsCubit.get(context).getmessages(ticket.iD.toString());
        return BlocConsumer<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.secblack,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage(ImgAssets.logo))),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Components.defaulttext(
                        text: "Ticket#${ticket.iD}", size: 16),
                  ],
                ),
                actions: [
                  HomeCubit.get(context).modelinfo[0].secPrimary == '1'
                      ? IconButton(
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
                              desc: AppStringTrans(context).closeticket,
                              btnCancelOnPress: () {},
                              btnOkOnPress: () => SettingsCubit.get(context)
                                  .closeticket(ticket.iD.toString()),
                            ).show();
                          },
                          icon: Icon(
                            IconBroken.Delete,
                            color: AppColors.error,
                          ))
                      : Container()
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                          reverse: true,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index++ ==
                                SettingsCubit.get(context).messages.length) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                            maxWidth: MediaQueryValues(context)
                                                    .width /
                                                1.5,
                                            maxHeight: MediaQueryValues(context)
                                                    .height /
                                                1.5),
                                        decoration: BoxDecoration(
                                            color: AppColors.secblack,
                                            borderRadius:
                                                BorderRadiusDirectional.only(
                                                    bottomEnd:
                                                        Radius.circular(8),
                                                    topEnd: Radius.circular(8),
                                                    topStart:
                                                        Radius.circular(8))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Components.defaulttext(
                                              lines: 100,
                                              text: ticket.subject!,
                                              size: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      ticket.getWebimage != null
                                          ? Container(
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQueryValues(context)
                                                              .width /
                                                          1.5),
                                              child:
                                                  imgwid(ticket.getWebimage!))
                                          : SizedBox()
                                    ],
                                  )
                                ],
                              );
                            } else {
                              if (SettingsCubit.get(context)
                                          .messages[index - 1]
                                          .namesender ==
                                      HomeCubit.get(context)
                                          .modelinfo[0]
                                          .getShardUser![0]
                                          .charName16! ||
                                  SettingsCubit.get(context)
                                          .messages[index - 1]
                                          .namesender !=
                                      ticket.charname) {
                                return sender(
                                    context,
                                    SettingsCubit.get(context)
                                        .messages[index - 1],
                                    ticket);
                              } else {
                                return reciverd(
                                    context,
                                    SettingsCubit.get(context)
                                        .messages[index - 1],
                                    ticket);
                              }
                            }
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 15,
                            );
                          },
                          itemCount:
                              SettingsCubit.get(context).messages.length + 1),
                    ),
                  ),
                  ticket.state == "waiting"
                      ? HomeCubit.get(context).modelinfo[0].secPrimary == '1'
                          ? Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8)),
                                  color: AppColors.secblack),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 10),
                                child: Center(
                                    child: Components.defaulttextbutton(
                                        size: 16,
                                        text: AppStringTrans(context).accept,
                                        color: AppColors.success,
                                        ontap: () => SettingsCubit.get(context)
                                            .acceptticket(ticket))),
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8)),
                                  color: AppColors.secblack),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 10),
                                child: Center(
                                    child: Components.defaulttextbutton(
                                        size: 16,
                                        text: AppStringTrans(context)
                                            .ticketwaiting,
                                        ontap: () {})),
                              ),
                            )
                      : Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              color: AppColors.secblack),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SettingsCubit.get(context).image == null
                                    ? SizedBox()
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width:
                                              MediaQueryValues(context).width /
                                                  4,
                                          height:
                                              MediaQueryValues(context).height /
                                                  9,
                                          child: Image.file(
                                              SettingsCubit.get(context)
                                                  .image!),
                                        ),
                                      ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Form(
                                        key: formstate,
                                        child: TextFormField(
                                          controller: SettingsCubit.get(context)
                                              .messagecon,
                                          style:
                                              TextStyle(color: AppColors.white),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return AppStringTrans(context)
                                                  .writeyoumessage;
                                            } else {
                                              return null;
                                            }
                                          },
                                          textInputAction:
                                              TextInputAction.newline,
                                          keyboardType: TextInputType.multiline,
                                          decoration: InputDecoration(
                                              counterStyle: TextStyle(
                                                  color: AppColors.white),
                                              hintText: AppStringTrans(context)
                                                  .writeyoumessage,
                                              hintStyle: TextStyle(
                                                color: AppColors.white,
                                              ),
                                              fillColor: AppColors.black,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                borderSide: BorderSide(
                                                  color: AppColors.primercolor,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                borderSide: BorderSide(
                                                  color: AppColors.primercolor,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              suffixIcon: state
                                                          is SendMessageLoading ||
                                                      state is ImgUploadChat
                                                  ? Components.loadingwidget()
                                                  : InkWell(
                                                      onTap: () {
                                                        if (SettingsCubit.get(
                                                                    context)
                                                                .image ==
                                                            null) {
                                                          if (formstate
                                                              .currentState!
                                                              .validate()) {
                                                            SettingsCubit.get(
                                                                    context)
                                                                .sendmessage(
                                                                    ticket.iD
                                                                        .toString(),
                                                                    context);
                                                          }
                                                        } else {
                                                          SettingsCubit.get(
                                                                  context)
                                                              .uploadimg(
                                                                  ticket.iD
                                                                      .toString(),
                                                                  context);
                                                        }
                                                      },
                                                      child: Icon(
                                                        Icons.send,
                                                        color: AppColors
                                                            .primercolor,
                                                      ),
                                                    )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        PermissionApp.storageperm(
                                            SettingsCubit.get(context)
                                                .selectimg());
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.primercolor,
                                        child: Icon(
                                          Icons.photo,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                ],
              ),
            );
          },
          listener: (context, state) {},
        );
      }),
    );
  }
}
