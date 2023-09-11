import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darksro/config/network/diohelper.dart';
import 'package:darksro/config/network/url.dart';
import 'package:darksro/config/shared_preferences/shared_preferences.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/Splash/presentation/widgets/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../Auth/presentation/pages/selectchar.dart';
import '../../../home/presentation/pages/homepage.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  static SplashCubit get(context) => BlocProvider.of(context);

  void init(BuildContext context) {
    FirebaseFirestore.instance
        .collection('update')
        .doc('message')
        .get()
        .then((value) {
      if (value.data()!['msg'] == '0') {
        Timer(Duration(seconds: 3), () {
          if (Stringconstants.Accid == null) {
            Navigator.pushReplacementNamed(context, AppRoutes.Signin);
          } else {
            if (Stringconstants.Charid == null) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SelectCharScreen(Stringconstants.Accid)));
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(Stringconstants.Charid),
                  ),
                  (route) => false);
            }
          }
        });
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => updatemsg(value.data()!['msg']),
            ),
            (route) => false);
      }
    });
  }

  void changelang(BuildContext context, String lang) async {
    await CacheHelper.saveData(key: AppString.lang, value: lang).then((value) {
      Stringconstants.lang = lang;
      emit(ChangeLang());
    });
  }

  void getinit() {
    DioApp.getData(url: AppUrl.getphonepayemnt).then((value) {
      print(value.data);
      AppString.CanBuy = int.parse(value.data['Enable']);
      AppString.phonepayment = "0${value.data['MobileNumber']}";
    });
  }
}
/*

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MyApp()),
        (Route<dynamic> route) => false);
 */