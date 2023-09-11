import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/core/utils/icon_broken.dart';
import 'package:darksro/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_validator.dart';

class ChangePasswordScreen extends StatelessWidget {
  GlobalKey<FormState> formst = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Components.defaulttext(
                  text: AppStringTrans(context).changepw),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formst,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Components.defaultform(
                          ontap: () => SettingsCubit.get(context).changevisi(),
                          controller:
                              SettingsCubit.get(context).currentpasswordcon,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.visiblePassword,
                          suffixIcon: SettingsCubit.get(context).passico,
                          obscureText: SettingsCubit.get(context).obscureText,
                          validator: (value) =>
                              AppValidator.gamepassword(value, context),
                          hint: AppStringTrans(context).currentpassword),
                      Visibility(
                        visible: SettingsCubit.get(context).passworderr,
                        child: Components.defaulttext(
                            text: AppStringTrans(context).currenterror,
                            color: AppColors.error,
                            size: 14),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Components.defaultform(
                          controller: SettingsCubit.get(context).newpasswordcon,
                          validator: (value) =>
                              AppValidator.gamepassword(value, context),
                          obscureText: SettingsCubit.get(context).obscureText,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.visiblePassword,
                          hint: AppStringTrans(context).newpassword),
                      SizedBox(
                        height: 15,
                      ),
                      Components.defaultform(
                          controller:
                              SettingsCubit.get(context).retypenewpasswordcon,
                          validator: (value) => AppValidator.confrimpass(
                              value,
                              context,
                              SettingsCubit.get(context).newpasswordcon.text),
                          textInputAction: TextInputAction.done,
                          obscureText: SettingsCubit.get(context).obscureText,
                          textInputType: TextInputType.visiblePassword,
                          hint: AppStringTrans(context).retypenewpassword),
                      SizedBox(
                        height: 15,
                      ),
                      Components.defaultbutton(
                          isload: state is PasswordChangeLoading,
                          text: AppStringTrans(context).confirm,
                          ontap: () {
                            if (formst.currentState!.validate()) {
                              SettingsCubit.get(context)
                                  .changepassword(context);
                            }
                          })
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
