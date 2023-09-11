import 'package:darksro/core/utils/constants.dart';
import 'package:flutter/material.dart';

class FormatData {
  static String checklang(String value, BuildContext context) {
    if (Constants.chacklang() == "en_US") {
      return convertTimeToJustNow(value, context);
    } else {
      return convertTimeToJustNowAR(value, context);
    }
  }

  static String convertTimeToJustNow(String value, BuildContext context) {
    DateTime time = DateTime.parse(value);
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inSeconds < 5) {
      return "Just Now";
    } else if (difference.inMinutes < 1) {
      return "${difference.inSeconds} Seconds ago";
    } else if (difference.inHours < 1) {
      return "${difference.inMinutes} Minutes ago";
    } else if (difference.inDays < 1) {
      return "${difference.inHours} Hours ago";
    } else if (difference.inDays < 7) {
      return "${difference.inDays} Days ago";
    } else {
      return time.toString();
    }
  }

  static String convertTimeToJustNowAR(String value, BuildContext context) {
    DateTime time = DateTime.parse(value);
    final now = DateTime.now();
    final difference = now.difference(time);
    if (difference.inSeconds < 5) {
      return "الان";
    } else if (difference.inMinutes < 1) {
      return "قبل ${difference.inSeconds} ثانيه";
    } else if (difference.inHours < 1) {
      return "قبل ${difference.inMinutes} دقيقه";
    } else if (difference.inDays < 1) {
      return "قبل ${difference.inHours} ساعه";
    } else if (difference.inDays < 7) {
      return "قبل ${difference.inDays} يوم";
    } else {
      return time.toString();
    }
  }

  String convertTo12HourFormat(String militaryTime) {
    List<String> parts = militaryTime.split(":");
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    String period = hour >= 12 ? "PM" : "AM";

    if (hour == 0) {
      hour = 12;
    } else if (hour > 12) {
      hour -= 12;
    }

    return '$hour:${minute.toString().padLeft(2, '0')} $period';
  }
}
