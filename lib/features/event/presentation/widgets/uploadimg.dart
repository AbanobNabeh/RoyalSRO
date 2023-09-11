import 'package:darksro/core/utils/app_permission.dart';
import 'package:darksro/core/utils/icon_broken.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_screen_image/full_screen_image.dart';

import '../../../../core/components/app_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';

Widget UploadIMGWid(BuildContext context, GlobalKey<ScaffoldState> Scaffoldstat,
    EventCubit eventCubit) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: AppColors.secblack, borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Components.defaulttext(
                  text: AppStringTrans(context).uploadimgds, size: 14)),
          Expanded(
              child: Components.defaultbutton(
                  text: AppStringTrans(context).upload,
                  ontap: () => Scaffoldstat.currentState!.showBottomSheet(
                        (context) => BlocBuilder<EventCubit, EventState>(
                          builder: (context, state) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: state is UploadPOSTLoading
                                ? Center(
                                    child: Components.loadingwidget(),
                                  )
                                : SingleChildScrollView(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppColors.white
                                                .withOpacity(0.5)),
                                        color: AppColors.black,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Components.defaultform(
                                              maxLength: 50,
                                              controller:
                                                  eventCubit.descriptioncont,
                                              validator: (value) {},
                                              hint: AppStringTrans(context)
                                                  .description,
                                            ),
                                            eventCubit.image == null
                                                ? InkWell(
                                                    onTap: () => PermissionApp
                                                        .storageperm(
                                                            EventCubit.get(
                                                                    context)
                                                                .selectimg()),
                                                    child: Container(
                                                      width: 80,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: eventCubit
                                                                    .Imgerror ==
                                                                true
                                                            ? AppColors.error
                                                            : AppColors
                                                                .secblack,
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          IconBroken.Image,
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Align(
                                                    alignment: Alignment.center,
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .topEnd,
                                                      children: [
                                                        FullScreenWidget(
                                                          disposeLevel:
                                                              DisposeLevel
                                                                  .Medium,
                                                          child: Container(
                                                            width: 385,
                                                            height: 245,
                                                            child: Image(
                                                                image: FileImage(
                                                                    eventCubit
                                                                        .image!)),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () =>
                                                              eventCubit
                                                                  .removeimg(),
                                                          child: CircleAvatar(
                                                            radius: 16,
                                                            backgroundColor:
                                                                AppColors.error,
                                                            child: Icon(
                                                              IconBroken.Delete,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Components.defaultbutton(
                                                text: AppStringTrans(context)
                                                    .upload,
                                                ontap: () => eventCubit
                                                    .checkimg(context),
                                                boxShadow: 0)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                  sizetext: 16,
                  boxShadow: 0))
        ],
      ),
    ),
  );
}
