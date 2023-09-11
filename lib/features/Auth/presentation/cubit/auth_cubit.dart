import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darksro/config/network/diohelper.dart';
import 'package:darksro/config/network/url.dart';
import 'package:darksro/config/routes/app_routes.dart';
import 'package:darksro/config/shared_preferences/shared_preferences.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/core/utils/icon_broken.dart';
import 'package:darksro/features/Auth/data/models/ModelChar.dart';
import 'package:darksro/features/Auth/presentation/pages/selectchar.dart';
import 'package:darksro/features/home/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/app_components.dart';
import '../../data/models/ModelSignup.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController emailcon = TextEditingController();
  TextEditingController namecon = TextEditingController();
  TextEditingController idcon = TextEditingController();
  TextEditingController webpassword = TextEditingController();
  TextEditingController webretypepass = TextEditingController();
  TextEditingController gamerpass = TextEditingController();
  TextEditingController gameretypepass = TextEditingController();
  bool iderror = false;
  bool emailerror = false;
  bool visipassweb = true;
  bool visipassgame = true;
  IconData passgameicon = IconBroken.Show;
  IconData passwebicon = IconBroken.Show;
  int page = 0;
  ModelSignUP? modelSignUP;
  bool loginerror = false;
  List<ModelChar> Chars = [];
  String? char;
  bool savechar = false;

  void changevisipass(value) {
    if (value == 0) {
      if (visipassweb == true) {
        passwebicon = IconBroken.Hide;
        visipassweb = false;
      } else {
        passwebicon = IconBroken.Show;
        visipassweb = true;
      }
    } else if (value == 1) {
      if (visipassgame == true) {
        visipassgame = false;
        passgameicon = IconBroken.Hide;
      } else {
        visipassgame = true;
        passgameicon = IconBroken.Show;
      }
    }
    emit(ChangePassVisi());
  }

  void CheckUser(BuildContext context) {
    iderror = false;
    emailerror = false;
    emit(CheckUserLoading());
    DioApp.postData(url: 'check', data: {
      "silkroad_id": idcon.text.toLowerCase(),
      "email": emailcon.text
    }).then((value) {
      if (value.data == 'id') {
        iderror = true;
      } else if (value.data == 'email') {
        emailerror = true;
      } else if (value.data == 'success') {
        signup(context);
      }
      emit(CheckUserSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(CheckUserSuccess());
    });
  }

  void signup(context) {
    emit(SignUpLoading());
    modelSignUP = ModelSignUP(
        email: emailcon.text,
        name: namecon.text,
        silkroadId: idcon.text.toLowerCase(),
        sroPassword: gamerpass.text,
        webPassword: webpassword.text);
    DioApp.postData(url: AppUrl.signup, data: modelSignUP!.toMap())
        .then((value) {
      Components.successmessage(
          context: context,
          message: AppStringTrans(context).successmsg,
          sizefont: 16);
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context!, AppRoutes.Signin);
      });
      emit(SignUpSuccess());
    }).catchError((error) {
      emit(SignUpError());
      print(error.toString());
    });
  }

  void signin(context) {
    loginerror = false;
    emit(LoginLoading());
    DioApp.postData(
            url: AppUrl.signin,
            data: {"email": idcon.text, "password": webpassword.text})
        .then((value) {
      if (value.data != "fail") {
        if (value.data != 'login') {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SelectCharScreen(value.data['JID'])));
          CacheHelper.saveData(key: AppString.AccID, value: value.data['JID'])
              .then((values) {
            Stringconstants.Accid = value.data['JID'];
          });
        } else {
          Components.errormessage(
              context: context, message: AppStringTrans(context).anotherdevice);
        }
      } else {
        loginerror = true;
      }
      emit(LoginSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(LoginError());
    });
  }

  void getallchar(String Jid) {
    emit(SelectCharLoading());
    DioApp.postData(url: AppUrl.charselect, data: {"UserJID": Jid})
        .then((value) {
      value.data.forEach((element) {
        print(element);
        Chars.add(ModelChar.fromJson(element));
      });
      emit(SelectCharSuccess());
    }).catchError((error) {
      emit(SelectCharError());
    });
  }

  void charsave(bool value) {
    savechar = value;
    emit(ChangeStateSave());
  }

  void showconfbtn() {
    emit(ChangeBTNConf());
  }

  void confselect(BuildContext context) {
    if (savechar == true) {
      CacheHelper.saveData(key: AppString.CharID, value: char).then((value) {
        Stringconstants.Charid = char;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(char!),
            ),
            (route) => false);
      });
    } else {
      Stringconstants.Charid = char;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(char!),
          ),
          (route) => false);
    }
  }
}
