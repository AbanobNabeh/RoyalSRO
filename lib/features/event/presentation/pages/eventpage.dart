import 'package:darksro/config/routes/app_routes.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/core/utils/assets_manager.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../home/presentation/cubit/home_cubit.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventCubit, EventState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: HomeCubit.get(context).modelinfo[0].getHwid == null
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Lottie.asset(
                            ImgAssets.error,
                            height: MediaQueryValues(context).height / 5,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Components.defaulttext(
                              text: AppStringTrans(context).hwidnull,
                              color: AppColors.error,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.luckspin);
                          },
                          child: Container(
                            width: double.infinity,
                            height: MediaQueryValues(context).height / 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.secblack,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Lottie.asset(
                                    ImgAssets.spin,
                                    height:
                                        MediaQueryValues(context).height / 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Components.defaulttext(
                                        text:
                                            AppStringTrans(context).luckyspin))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.royalpass),
                          child: Container(
                            width: double.infinity,
                            height: MediaQueryValues(context).height / 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.secblack,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    ImgAssets.logo,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Components.defaulttext(
                                        text:
                                            AppStringTrans(context).royalpass))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.VIP),
                          child: Container(
                            width: double.infinity,
                            height: MediaQueryValues(context).height / 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.secblack,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    ImgAssets.vip,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Components.defaulttext(
                                        text: AppStringTrans(context).vip))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.BESTImg),
                          child: Container(
                            width: double.infinity,
                            height: MediaQueryValues(context).height / 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.secblack,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    ImgAssets.bestimg,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Components.defaulttext(
                                        text: AppStringTrans(context).BestIMG))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        /* InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.alchemy),
                          child: Container(
                            width: double.infinity,
                            height: MediaQueryValues(context).height / 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.secblack,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    ImgAssets.alchemy,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 3,
                                    child:
                                        Components.defaulttext(text: "Alchemy"))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),*/
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.Invite),
                          child: Container(
                            width: double.infinity,
                            height: MediaQueryValues(context).height / 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.secblack,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    ImgAssets.invite,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Components.defaulttext(
                                        text: AppStringTrans(context)
                                            .inviteplayer))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.gift),
                          child: Container(
                            width: double.infinity,
                            height: MediaQueryValues(context).height / 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.secblack,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Lottie.asset(
                                    ImgAssets.gift,
                                    height:
                                        MediaQueryValues(context).height / 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Components.defaulttext(
                                        text: AppStringTrans(context).gift))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, AppRoutes.nightmarket),
                          child: Container(
                            width: double.infinity,
                            height: MediaQueryValues(context).height / 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.secblack,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    ImgAssets.nightmarket,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Components.defaulttext(
                                        text: AppStringTrans(context)
                                            .nightmarket))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
