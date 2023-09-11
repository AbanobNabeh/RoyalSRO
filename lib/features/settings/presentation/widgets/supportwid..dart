import 'package:darksro/core/utils/app_permission.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

import '../../../../core/components/app_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';

Widget createticket(
    SettingsCubit cubit, BuildContext context, SettingsState state) {
  List dropmenu = [
    {"value": "bug", "name": "${AppStringTrans(context).bug}"},
    {"value": "scammer", "name": "${AppStringTrans(context).scammer}"},
    {"value": "donate", "name": "${AppStringTrans(context).donate}"},
    {"value": "other", "name": "${AppStringTrans(context).other}"},
  ];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  return Form(
    key: formstate,
    child: Column(
      children: [
        Components.defaultform(
            controller: cubit.titlecon,
            maxLength: 25,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return AppStringTrans(context).title;
              }
            },
            hint: AppStringTrans(context).title),
        SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.secblack,
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    child: Components.defaulttext(
                        text: AppStringTrans(context).category)),
                DropdownButton(
                  autofocus: true,
                  iconEnabledColor: AppColors.grey,
                  focusColor: AppColors.primercolor,
                  iconDisabledColor: AppColors.primercolor,
                  dropdownColor: AppColors.secblack,
                  items: dropmenu
                      .map((e) => DropdownMenuItem(
                            value: e['value'],
                            child: Components.defaulttext(
                                text: e['name'].toString(), size: 15),
                          ))
                      .toList(),
                  onChanged: (value) => cubit.onchangecate(value),
                  value: cubit.categpry,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          maxLines: 7,
          controller: cubit.subjectcon,
          maxLength: 150,
          style: TextStyle(color: AppColors.white),
          validator: (value) {
            if (value!.isEmpty) {
              return AppStringTrans(context).subject;
            }
          },
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            counterStyle: TextStyle(color: AppColors.white),
            hintText: AppStringTrans(context).subject,
            hintStyle: TextStyle(
              color: AppColors.white,
            ),
            fillColor: AppColors.secblack,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: AppColors.primercolor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: AppColors.primercolor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.secblack,
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: cubit.images.isEmpty
                ? Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Components.defaulttext(
                              text: AppStringTrans(context).uploadimages,
                              size: 16)),
                      Components.defaulttextbutton(
                          ontap: () => PermissionApp.storageperm(
                              cubit.uploadmiultphoto()),
                          text: AppStringTrans(context).clickhere,
                          size: 14,
                          color: AppColors.blue)
                    ],
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      childAspectRatio: MediaQueryValues(context).width /
                          (MediaQueryValues(context).height / 2),
                    ),
                    itemBuilder: (context, index) => FullScreenWidget(
                      disposeLevel: DisposeLevel.Medium,
                      child: AssetThumb(
                        asset: cubit.images[index],
                        height: 20,
                        quality: 100,
                        width: 20,
                        spinner: Center(
                            child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator())),
                      ),
                    ),
                    itemCount: cubit.images.length,
                  ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Components.defaultbutton(
            isload: state is CreateTicketLoading,
            text: AppStringTrans(context).send,
            ontap: () {
              if (formstate.currentState!.validate()) {
                cubit.createticket(context);
              }
            })
      ],
    ),
  );
}
