import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/itemtype.dart';
import 'package:darksro/features/event/data/models/alchemymodel.dart';
import 'package:darksro/features/event/data/models/elixiermodel.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/app_components.dart';
import '../../../../core/utils/assets_manager.dart';

Widget Elixirwid(ElixerModel elixerModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Image.asset(
              ImgAssets.alchemyweapon,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            Components.defaulttext(
                text: elixerModel.wep!, size: 14, fontWeight: FontWeight.bold)
          ],
        ),
      ),
      Container(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Image.asset(
              ImgAssets.alchemyshield,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            Components.defaulttext(
                text: elixerModel.shield!,
                size: 14,
                fontWeight: FontWeight.bold)
          ],
        ),
      ),
      Container(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Image.asset(
              ImgAssets.alchemyset,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            Components.defaulttext(
                text: elixerModel.sets!, size: 14, fontWeight: FontWeight.bold)
          ],
        ),
      ),
      Container(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Image.asset(
              ImgAssets.alchemyaccs,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            Components.defaulttext(
                text: elixerModel.accs!, size: 14, fontWeight: FontWeight.bold)
          ],
        ),
      ),
    ],
  );
}

Widget inventoryWid(EventCubit eventCubit, AlchemyModel alchemyModel) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      InkWell(
        onTap: alchemyModel.webInventory!.degree == 12 &&
                alchemyModel.webInventory!.type != null
            ? () {
                eventCubit.setitem({
                  'img': alchemyModel.imgpath,
                  'name': alchemyModel.webInventory!.type,
                  'plus': alchemyModel.webInventory!.optLevel,
                  'stat': '.....'
                });
              }
            : null,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset(ImgAssets.clean),
            Image.network(
              alchemyModel.imgpath!,
            ),
          ],
        ),
      ),
      alchemyModel.amount == false
          ? alchemyModel.webInventory!.degree == 12 &&
                  alchemyModel.webInventory!.type != null
              ? Components.defaulttext(
                  text: "+${alchemyModel.webInventory!.optLevel}",
                  size: 12,
                  color: AppColors.primercolor)
              : Components.defaulttext(text: "1", size: 12)
          : Components.defaulttext(text: "${alchemyModel.amount}X", size: 12)
    ],
  );
}
