import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_permission.dart';
import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_screen_image/full_screen_image.dart';

import '../../../../core/utils/app_colors.dart';

class PaymentScreen extends StatelessWidget {
  Map infopayment;
  PaymentScreen(this.infopayment);
  var formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Components.defaulttext(text: AppStringTrans(context).buy),
          ),
          bottomSheet: Container(
            decoration: BoxDecoration(
                color: AppColors.secblack,
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Components.defaultbutton(
                  isload: state is BuyDarkPointLoading,
                  text: AppStringTrans(context).buy,
                  ontap: () {
                    if (formstate.currentState!.validate()) {
                      if (HomeCubit.get(context).image == null) {
                        HomeCubit.get(context).imageisnull();
                      } else {
                        HomeCubit.get(context).buy(
                            dpcount: infopayment['darkpoint'].toString(),
                            le: infopayment['darkpoint'].toString(),
                            context: context);
                      }
                    }
                  },
                  boxShadow: 0),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: infopayment['darkpoint'],
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.secblack,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Components.defaulttext(
                                        text:
                                            '${infopayment['darkpoint']} ${AppStringTrans(context).darkpoint}',
                                        color: AppColors.primercolor,
                                        size: 15),
                                    Components.defaulttext(
                                        text:
                                            '${infopayment['price']} ${AppStringTrans(context).le}',
                                        size: 14),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Components.defaultform(
                              controller: HomeCubit.get(context).firstname,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStringTrans(context).firstname;
                                }
                              },
                              hint: AppStringTrans(context).firstname),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Components.defaultform(
                              controller: HomeCubit.get(context).lastname,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStringTrans(context).lastname;
                                }
                              },
                              hint: AppStringTrans(context).lastname),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Components.defaultform(
                        controller: HomeCubit.get(context).phonenumber,
                        textInputType: TextInputType.phone,
                        validator: (value) {
                          String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          RegExp regExp = new RegExp(pattern);
                          if (value!.length == 0) {
                            return AppStringTrans(context).phonenumber;
                          } else if (!regExp.hasMatch(value!)) {
                            return AppStringTrans(context).phonenumber;
                          }
                          return null;
                        },
                        hint: AppStringTrans(context).phonenumber),
                    SizedBox(
                      height: 15,
                    ),
                    /* Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.secblack),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Components.defaulttext(
                                    text:
                                        AppStringTrans(context).paymentmethod)),
                            DropdownButton(
                              autofocus: true,
                              iconEnabledColor: AppColors.grey,
                              focusColor: AppColors.primercolor,
                              iconDisabledColor: AppColors.primercolor,
                              dropdownColor: AppColors.secblack,
                              value: HomeCubit.get(context).valuelist,
                              items: <DropdownMenuItem<int>>[
                                new DropdownMenuItem(
                                  child: Components.defaulttext(
                                      text: AppStringTrans(context).visa,
                                      size: 15),
                                  value: 0,
                                ),
                                new DropdownMenuItem(
                                  child: Components.defaulttext(
                                      text: AppStringTrans(context).kiosk,
                                      size: 15),
                                  value: 1,
                                ),
                                new DropdownMenuItem(
                                  child: Components.defaulttext(
                                      text: AppStringTrans(context).wallet,
                                      size: 15),
                                  value: 2,
                                ),
                              ],
                              onChanged: (Object? value) {
                                HomeCubit.get(context).changepayment(value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    */
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.secblack),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Components.defaulttext(
                                    text: AppStringTrans(context)
                                        .phonenumbertrans,
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
                                        await Clipboard.setData(ClipboardData(
                                            text: AppString.phonepayment));
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
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    HomeCubit.get(context).image == null
                        ? Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: HomeCubit.get(context).imagenull
                                    ? AppColors.error
                                    : AppColors.secblack),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Components.defaulttext(
                                        text: AppStringTrans(context)
                                            .uploadscreenshot,
                                        size: 16),
                                  ),
                                  Expanded(
                                    child: Components.defaultbutton(
                                      boxShadow: 0,
                                      text: AppStringTrans(context).upload,
                                      sizetext: 16,
                                      ontap: () {
                                        PermissionApp.storageperm(
                                            HomeCubit.get(context).selectimg());
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
                              HomeCubit.get(context).image!,
                              width: MediaQueryValues(context).width / 4,
                            ),
                          ),
                    SizedBox(
                      height: 15,
                    ),
                    Components.defaulttext(
                      text: AppStringTrans(context).notic,
                      color: AppColors.error,
                    ),
                    Components.defaulttext(
                        text: AppStringTrans(context).noticpayment,
                        color: AppColors.white,
                        size: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
