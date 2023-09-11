import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/core/utils/app_validator.dart';
import 'package:darksro/core/utils/assets_manager.dart';
import 'package:darksro/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';

class SignInScreen extends StatelessWidget {
  var formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: MediaQueryValues(context).height / 3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.secblack,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                        ),
                        Image.asset(
                          ImgAssets.logo,
                          width: MediaQueryValues(context).width / 1.5,
                          height: MediaQueryValues(context).height / 5,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Components.defaulttext(
                              text: AppStringTrans(context).welcome, size: 24),
                          Components.defaulttext(
                              text: AppStringTrans(context).Welcomemessage,
                              color: AppColors.grey,
                              size: 16),
                          SizedBox(
                            height: 25,
                          ),
                          Components.defaultform(
                              controller: cubit.idcon,
                              validator: (value) =>
                                  AppValidator.idvali(value, context),
                              hint: AppStringTrans(context).ID),
                          SizedBox(
                            height: 25,
                          ),
                          Components.defaultform(
                              obscureText: cubit.visipassweb,
                              controller: cubit.webpassword,
                              validator: (value) =>
                                  AppValidator.gamepassword(value, context),
                              hint: AppStringTrans(context).passwordgame,
                              suffixIcon: cubit.passwebicon,
                              suffixIcontap: () => cubit.changevisipass(0)),
                          Visibility(
                            child: Align(
                              alignment: AlignmentDirectional.bottomStart,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Components.defaulttext(
                                    text: AppStringTrans(context).invalidlogin,
                                    size: 16,
                                    color: AppColors.error),
                              ),
                            ),
                            visible: cubit.loginerror,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Components.defaultbutton(
                              text: AppStringTrans(context).login,
                              isload: state is LoginLoading,
                              ontap: () {
                                if (formstate.currentState!.validate()) {
                                  cubit.signin(context);
                                }
                              }),
                        ],
                      ),
                    ),
                    Center(
                        child: Components.defaulttextbutton(
                            ontap: () =>
                                Navigator.pushNamed(context, AppRoutes.Signup),
                            text: AppStringTrans(context).createaccount,
                            size: 18,
                            color: AppColors.blue))
                  ],
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
