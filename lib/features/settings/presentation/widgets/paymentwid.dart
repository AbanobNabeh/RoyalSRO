import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/features/settings/data/models/donatemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_screen_image/full_screen_image.dart';

import '../../../../core/components/app_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_permission.dart';
import '../../../../core/utils/app_string.dart';
import '../cubit/settings_cubit.dart';

Widget paymentwid(BuildContext context, int index, DonateModel model) {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  return Visibility(
    visible: SettingsCubit.get(context).indexpayment == index + 1,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.black),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Components.defaulttext(
                      text: AppStringTrans(context).phonenumbertrans,
                      size: 16,
                      color: AppColors.primercolor),
                  Row(
                    children: [
                      Components.defaulttext(
                          text: AppString.phonepayment, size: 16),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () async {
                          await Clipboard.setData(
                              ClipboardData(text: AppString.phonepayment));
                        },
                        child: Icon(
                          Icons.copy,
                          color: AppColors.primercolor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Form(
            key: formstate,
            child: Components.defaultform(
                controller: SettingsCubit.get(context).phonenumbersell,
                textInputType: TextInputType.phone,
                validator: (value) {
                  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                  RegExp regExp = new RegExp(pattern);
                  if (value!.length == 0) {
                    return AppStringTrans(context).phonenumber;
                  } else if (!regExp.hasMatch(value)) {
                    return AppStringTrans(context).phonenumber;
                  }
                  return null;
                },
                hint: AppStringTrans(context).phonenumber),
          ),
          SizedBox(
            height: 15,
          ),
          SettingsCubit.get(context).imagepay == null
              ? Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: SettingsCubit.get(context).imagenull
                          ? AppColors.error
                          : AppColors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Components.defaulttext(
                              text: AppStringTrans(context).uploadscreenshot,
                              size: 16),
                        ),
                        Expanded(
                          child: Components.defaultbutton(
                            boxShadow: 0,
                            text: AppStringTrans(context).upload,
                            sizetext: 16,
                            ontap: () {
                              PermissionApp.storageperm(
                                  SettingsCubit.get(context).selectimgpay());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : FullScreenWidget(
                  disposeLevel: DisposeLevel.Medium,
                  child: Image.file(
                    SettingsCubit.get(context).imagepay!,
                    width: MediaQueryValues(context).width / 4,
                  ),
                ),
          SizedBox(
            height: 8,
          ),
          Components.defaultbutton(
              text: AppStringTrans(context).buy,
              ontap: () {
                if (formstate.currentState!.validate()) {
                  if (SettingsCubit.get(context).imagepay == null) {
                    SettingsCubit.get(context).imageisnull();
                  } else {
                    SettingsCubit.get(context).buydonate(
                        context,
                        SettingsCubit.get(context)
                            .donatelist[index]
                            .name
                            .toString(),
                        SettingsCubit.get(context)
                            .donatelist[index]
                            .price
                            .toString());
                  }
                }
              },
              boxShadow: 0)
        ],
      ),
    ),
  );
}
