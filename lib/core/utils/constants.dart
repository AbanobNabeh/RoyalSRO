import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_string.dart';

class Constants {
  static String chacklang() {
    if (Stringconstants.lang == null) {
      if (Platform.localeName == "en") {
        return "en_US";
      } else {
        return "ar_EG";
      }
    } else {
      if (Stringconstants.lang == "en") {
        return "en_US";
      } else {
        return "ar_EG";
      }
    }
  }

  static void ErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                msg,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ));
  }

  static int mypoint(int point) {
    if (point < 1000) {
      return 1;
    } else if (point < 3000 && point >= 1000) {
      return 2;
    } else if (point < 6000 && point >= 3000) {
      return 3;
    } else if (point < 10000 && point >= 6000) {
      return 4;
    } else if (point <= 15000 && point >= 10000) {
      return 5;
    } else {
      return 0;
    }
  }

  static int lvlinvite(String invite, String lvl) {
    int level = int.parse(lvl);
    int invited = int.parse(invite);
    if (invited > 15 && level == 0) {
      return 1;
    } else if (invited > 45 && level == 1) {
      return 2;
    } else if (invited > 80 && level == 2) {
      return 3;
    } else if (invited > 110 && level == 3) {
      return 4;
    } else if (invited > 150 && level == 4) {
      return 5;
    } else if (invited > 300 && level == 5) {
      return 6;
    } else {
      return 0;
    }
  }

  static int getlvl(var lvl, var collect) {
    int level = int.parse(lvl);
    int iscollect = int.parse(collect);
    print("${level} and ${iscollect}");
    if (level == 1) {
      if (iscollect >= 1) {
        return 1; //collected
      } else {
        return 0;
      }
    } else if (level == 2) {
      if (iscollect >= 1) {
        return 1;
      } else {
        return 0;
      }
    } else {
      return 10;
    }
  }
}
