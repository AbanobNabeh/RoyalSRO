import 'package:darksro/config/network/url.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/features/settings/data/models/ticketmodel.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

Widget imgwid(GetWebimage img) {
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        img.iMG0 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG0}",
                    wid: 60,
                    high: 60)),
        img.iMG1 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG1}",
                    wid: 60,
                    high: 60)),
        img.iMG2 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG2}",
                    wid: 60,
                    high: 60)),
        img.iMG3 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG3}",
                    wid: 60,
                    high: 60)),
        img.iMG4 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG4}",
                    wid: 60,
                    high: 60)),
        img.iMG5 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG5}",
                    wid: 60,
                    high: 60)),
        img.iMG6 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG6}",
                    wid: 60,
                    high: 60)),
        img.iMG7 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG7}",
                    wid: 60,
                    high: 60)),
        img.iMG8 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG8}",
                    wid: 60,
                    high: 60)),
        img.iMG9 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG9}",
                    wid: 60,
                    high: 60)),
        img.iMG10 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG10}",
                    wid: 60,
                    high: 60)),
        img.iMG11 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG11}",
                    wid: 60,
                    high: 60)),
        img.iMG12 == null
            ? SizedBox()
            : FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Components.defchachedimg(
                    "${AppUrl.PostIMG}Ticket${img.iD}/${img.iMG12}",
                    wid: 60,
                    high: 60)),
      ],
    ),
  );
}
