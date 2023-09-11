import 'package:darksro/core/utils/app_string.dart';

class AppValidator {
  static namevali(value, context) {
    if (value!.isEmpty) {
      return AppStringTrans(context).name;
    } else if (value.length > 16) {
      return AppStringTrans(context).morename;
    } else if (value.length < 4) {
      return AppStringTrans(context).lessname;
    }
  }

  static idvali(value, context) {
    String p = r'^(?=[a-zA-Z0-9._]{6,16}$)(?!.*[_.]{2})[^_.].*[^_.]$';
    RegExp regExp = new RegExp(p);
    if (value!.isEmpty) {
      return AppStringTrans(context).ID;
    } else if (value.length > 16) {
      return AppStringTrans(context).moreid;
    } else if (value.length < 6) {
      return AppStringTrans(context).lessid;
    } else if (!regExp.hasMatch(value)) {
      return AppStringTrans(context).invalidusername;
    }
  }

  static emailvali(value, context) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    if (value.isEmpty) {
      return AppStringTrans(context).email;
    } else if (!regExp.hasMatch(value)) {
      return AppStringTrans(context).invalidemail;
    }
  }

/*
  static webpassword(value, context) {
    if (value.isEmpty) {
      return AppStringTrans(context).passwordweb;
    }else if (value.length < 6){
      return AppStringTrans(context).passworderr;
    }
  }
*/
  static gamepassword(value, context) {
    if (value.isEmpty) {
      return AppStringTrans(context).passwordgame;
    } else if (value.length < 6) {
      return AppStringTrans(context).passworderr;
    }
  }

  static confrimpass(value, context, password) {
    if (value != password) {
      return AppStringTrans(context).passwordnotmatch;
    }
  }
}
