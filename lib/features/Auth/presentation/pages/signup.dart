import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:darksro/features/Auth/presentation/widgets/widgetsignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:darksro/core/utils/app_size.dart';
import '../../../../core/utils/assets_manager.dart';

class SignUpScreen extends StatelessWidget {
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
                          height: MediaQueryValues(context).height / 3.5,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Components.defaulttext(
                              text: AppStringTrans(context).createaccount,
                              size: 24),
                          SizedBox(
                            height: 25,
                          ),
                          SignupWidget(cubit, context),
                          SizedBox(
                            height: 25,
                          ),
                          Components.defaultbutton(
                              text: AppStringTrans(context).createaccount,
                              ontap: () {
                                if (formstate.currentState!.validate()) {
                                  cubit.CheckUser(context);
                                }
                              },
                              isload: state is CheckUserLoading ||
                                  state is SignUpLoading),
                        ],
                      ),
                    ),
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
