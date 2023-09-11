import 'package:darksro/config/network/url.dart';
import 'package:darksro/features/settings/data/models/messagemodel.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

import '../../../../core/components/app_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../data/models/ticketmodel.dart';

Widget reciverd(
    BuildContext context, MessageModel message, ModelTicket ticket) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQueryValues(context).width / 1.5,
                maxHeight: MediaQueryValues(context).height / 1.5),
            decoration: BoxDecoration(
                color: AppColors.secblack,
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(8),
                    topEnd: Radius.circular(8),
                    topStart: Radius.circular(8))),
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: message.message != ''
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Components.defaulttext(
                              lines: 100, text: message.message!, size: 18),
                          message.img == null
                              ? SizedBox()
                              : FullScreenWidget(
                                  child: Components.defchachedimg(
                                      "${AppUrl.PostIMG}ticket${ticket.iD}/${message.img}",
                                      wid: MediaQueryValues(context).width / 5),
                                  disposeLevel: DisposeLevel.Medium,
                                )
                        ],
                      )
                    : FullScreenWidget(
                        child: Components.defchachedimg(
                            "${AppUrl.PostIMG}ticket${ticket.iD}/${message.img}"),
                        disposeLevel: DisposeLevel.Medium)),
          ),
          SizedBox(
            height: 7,
          ),
        ],
      )
    ],
  );
}

Widget sender(BuildContext context, MessageModel message, ModelTicket ticket) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQueryValues(context).width / 1.5,
                maxHeight: MediaQueryValues(context).height / 1.5),
            decoration: BoxDecoration(
                color: AppColors.primercolor,
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(8),
                    topEnd: Radius.circular(8),
                    topStart: Radius.circular(8))),
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: message.message != ''
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Components.defaulttext(
                              lines: 100, text: message.message!, size: 18),
                          message.img == null
                              ? SizedBox()
                              : FullScreenWidget(
                                  child: Components.defchachedimg(
                                      "${AppUrl.PostIMG}ticket${ticket.iD}/${message.img}",
                                      wid: MediaQueryValues(context).width / 5),
                                  disposeLevel: DisposeLevel.Medium,
                                )
                        ],
                      )
                    : FullScreenWidget(
                        child: Components.defchachedimg(
                            "${AppUrl.PostIMG}ticket${ticket.iD}/${message.img}"),
                        disposeLevel: DisposeLevel.Medium)),
          ),
        ],
      )
    ],
  );
}
