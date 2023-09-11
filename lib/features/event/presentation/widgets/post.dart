import 'package:darksro/config/network/url.dart';
import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/event/data/models/modelpost.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:intl/intl.dart';

import '../../../../core/components/app_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/icon_broken.dart';

Widget PostWID(ModelPOST post, GlobalKey<ScaffoldState> Scaffoldstat,
    BuildContext context, int index) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.secblack,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(top: 8, start: 5, end: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                child: Components.defchachedimg(
                    '${AppUrl.CharIMg}${post.charIMG!}.gif'),
              ),
              SizedBox(
                width: 7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Components.defaulttext(
                      text: post.charName!,
                      size: 18,
                      fontWeight: FontWeight.bold),
                  Components.defaulttext(
                      text: DateFormat.yMd()
                          .format(DateTime.parse(post.dateTime!)),
                      size: 14,
                      color: AppColors.grey),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          post.description == 'null'
              ? SizedBox(
                  height: 3,
                )
              : Components.defaulttext(text: post.description!, size: 16),
          Align(
            alignment: Alignment.center,
            child: FullScreenWidget(
              disposeLevel: DisposeLevel.Medium,
              child: Container(
                width: 385,
                height: 245,
                child: Components.defchachedimg(
                    '${AppUrl.PostIMG}${post.charName}/${post.iMG}'),
              ),
            ),
          ),
          Divider(
            color: AppColors.white,
            height: 1,
            thickness: 0.2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Container(
                  child: InkWell(
                    onTap: () =>
                        Scaffoldstat.currentState!.showBottomSheet((context) {
                      return ReviewWid(context, post);
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Components.defaulttext(
                              text: double.parse(post.rate!).toStringAsFixed(2),
                              size: 14),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.black),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                IconBroken.User,
                size: 18,
                color: Colors.white,
              ),
              SizedBox(
                width: 3,
              ),
              Components.defaulttext(
                  text: post.getViewposts!.length.toString(), size: 16),
              Spacer(),
              Visibility(
                  visible: !post.myrate!,
                  child: Components.defaulttextbutton(
                      ontap: () => Scaffoldstat.currentState!.showBottomSheet(
                          (context) => addcomment(
                              post, context, EventCubit.get(context), index)),
                      text: AppStringTrans(context).review,
                      size: 16,
                      color: AppColors.blue))
            ],
          )
        ],
      ),
    ),
  );
}

Widget ReviewWid(BuildContext context, ModelPOST post) {
  return Container(
    height: MediaQueryValues(context).height / 1.5,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primercolor.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(8),
      color: AppColors.black,
    ),
    child: post.getViewposts!.isEmpty
        ? Center(
            child: Components.defaulttext(
                text: AppStringTrans(context).nocommentyet,
                fontWeight: FontWeight.bold),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Components.defaulttext(
                    text:
                        "${post.getViewposts!.length} ${AppStringTrans(context).comment}",
                    fontWeight: FontWeight.bold),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 45,
                          child: Components.defchachedimg(
                              '${AppUrl.CharIMg}${post.getViewposts![index].charIMG}.gif'),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Components.defaulttext(
                                  text: post.getViewposts![index].charName!,
                                  size: 16),
                              Components.defaulttext(
                                  text: DateFormat.yMd().format(DateTime.parse(
                                      post.getViewposts![index].dateTime!)),
                                  size: 14,
                                  color: AppColors.grey),
                              Components.defaulttext(
                                  text: post.getViewposts![index].comment!,
                                  size: 16),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.secblack),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Components.defaulttext(
                                      text: double.parse(
                                              post.getViewposts![index].review!)
                                          .toStringAsFixed(2),
                                      size: 14),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                    itemCount: post.getViewposts!.length,
                  ),
                )
              ],
            ),
          ),
  );
}

Widget addcomment(
    ModelPOST post, BuildContext context, EventCubit eventCubit, int index) {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  return BlocBuilder<EventCubit, EventState>(
    builder: (context, state) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primercolor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formstate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: FullScreenWidget(
                      disposeLevel: DisposeLevel.Medium,
                      child: Container(
                        width: 385,
                        height: 245,
                        child: Components.defchachedimg(
                            '${AppUrl.PostIMG}${post.charName}/${post.iMG}'),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Components.defaulttext(
                          text: post.charName!,
                          size: 14,
                          fontWeight: FontWeight.bold),
                      Components.defaulttext(
                          text: DateFormat.yMd()
                              .format(DateTime.parse(post.dateTime!)),
                          size: 12,
                          color: AppColors.grey),
                    ],
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
                color: AppColors.white,
              ),
              SizedBox(
                height: 15,
              ),
              Components.defaultform(
                  textInputType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLength: 100,
                  controller: eventCubit.commentcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStringTrans(context).comment;
                    }
                  },
                  hint: AppStringTrans(context).comment),
              SizedBox(
                height: 15,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0.5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                unratedColor: eventCubit.rateerror == true
                    ? AppColors.error
                    : AppColors.white,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  eventCubit.rate = rating;
                },
              ),
              SizedBox(
                height: 40,
              ),
              Components.defaultbutton(
                  text: AppStringTrans(context).addrate,
                  ontap: () {
                    if (formstate.currentState!.validate()) {
                      eventCubit.checkrate(
                          HomeCubit.get(context).modelinfo[0].getShardUser![0],
                          post.iD,
                          index,
                          context);
                    }
                  },
                  boxShadow: 0)
            ],
          ),
        ),
      ),
    ),
  );
}
