import 'package:darksro/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/app_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/app_validator.dart';

Widget SignupWidget(cubit, context) => Column(
      children: [
        Components.defaultform(
          controller: cubit.idcon,
          validator: (value) => AppValidator.idvali(value, context),
          hint: AppStringTrans(context).ID,
        ),
        Align(
          child: Visibility(
            child: Components.defaulttext(
                text: AppStringTrans(context).idused,
                color: AppColors.error,
                size: 16),
            visible: cubit.iderror,
          ),
          alignment: AlignmentDirectional.bottomStart,
        ),
        SizedBox(
          height: 25,
        ),
        Components.defaultform(
          controller: cubit.emailcon,
          textInputAction: TextInputAction.go,
          textInputType: TextInputType.emailAddress,
          validator: (value) => AppValidator.emailvali(value, context),
          hint: AppStringTrans(context).email,
        ),
        SizedBox(
          height: 7,
        ),
        Align(
          child: Visibility(
            child: Components.defaulttext(
                text: AppStringTrans(context).emailused,
                color: AppColors.error,
                size: 16),
            visible: cubit.emailerror,
          ),
          alignment: AlignmentDirectional.bottomStart,
        ),
        SizedBox(
          height: 25,
        ),
        Components.defaultform(
          suffixIcontap: () {
            cubit.changevisipass(1);
          },
          controller: cubit.gamerpass,
          suffixIcon: cubit.passgameicon,
          obscureText: cubit.visipassgame,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.visiblePassword,
          validator: (value) => AppValidator.gamepassword(value, context),
          hint: AppStringTrans(context).passwordgame,
        ),
        SizedBox(
          height: 25,
        ),
        Components.defaultform(
          controller: cubit.gameretypepass,
          obscureText: cubit.visipassgame,
          textInputAction: TextInputAction.go,
          textInputType: TextInputType.visiblePassword,
          validator: (value) =>
              AppValidator.confrimpass(value, context, cubit.gamerpass.text),
          hint: AppStringTrans(context).confirmpasswordgame,
        ),
      ],
    );
/*
Widget Confirmwidget(AuthCubit cubit, context) => Column(
      children: [
        Components.defaultform(
            suffixIcontap: () {
              cubit.changevisipass(0);
            },
            controller: cubit.webpassword,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.visiblePassword,
            suffixIcon: cubit.passwebicon,
            obscureText: cubit.visipassweb,
            validator: (value) => AppValidator.webpassword(value, context),
            hint: AppStringTrans(context).passwordweb),
        SizedBox(
          height: 25,
        ),
        Components.defaultform(
            obscureText: cubit.visipassweb,
            controller: cubit.webretypepass,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.visiblePassword,
            validator: (value) => AppValidator.confrimpass(
                value, context, cubit.webpassword.text),
            hint: AppStringTrans(context).confirmpasswordweb),
      ],
    );
*/