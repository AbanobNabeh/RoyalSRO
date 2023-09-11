import 'package:another_flushbar/flushbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Components {
  static Widget defaulttext(
      {required String text,
      Color color = Colors.white,
      double size = 20,
      TextAlign textAlign = TextAlign.start,
      FontWeight fontWeight = FontWeight.normal,
      int lines = 3}) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }

  static Widget defaultform(
      {required TextEditingController controller,
      required String? Function(String?)? validator,
      required String hint,
      IconData? suffixIcon,
      IconData? prefixIcon,
      Color suffixcolor = Colors.white,
      Function()? suffixIcontap,
      Function()? prefixIcontap,
      Function()? ontap,
      TextInputAction? textInputAction,
      bool obscureText = false,
      TextInputType? textInputType,
      int? maxLength}) {
    return TextFormField(
      maxLength: maxLength,
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(color: AppColors.white),
      validator: validator,
      onTap: ontap,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      decoration: InputDecoration(
        counterStyle: TextStyle(color: AppColors.white),
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.white,
        ),
        fillColor: AppColors.secblack,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.primercolor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.primercolor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        suffixIcon: suffixIcon == null
            ? null
            : IconButton(
                onPressed: suffixIcontap,
                icon: Icon(
                  suffixIcon,
                  color: suffixcolor,
                ),
              ),
        prefixIcon: prefixIcon == null
            ? null
            : IconButton(
                onPressed: prefixIcontap,
                icon: Icon(
                  prefixIcon,
                  color: suffixcolor,
                ),
              ),
      ),
    );
  }

  static Widget defaulttextbutton(
      {required Function() ontap,
      required String text,
      required double size,
      Color color = Colors.white}) {
    return TextButton(
        onPressed: ontap,
        child: Components.defaulttext(text: text, size: size, color: color));
  }

  static Widget defaultbutton(
      {required String text,
      required Function() ontap,
      bool isload = false,
      int boxShadow = 1,
      double sizetext = 20,
      double width = double.infinity}) {
    return Container(
      width: width,
      height: 55,
      child: MaterialButton(
        onPressed: isload == true ? null : ontap,
        child: isload == true
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              )
            : Components.defaulttext(
                text: text, color: AppColors.white, size: sizetext),
      ),
      decoration: BoxDecoration(
          color: AppColors.primercolor,
          boxShadow: boxShadow == 1
              ? [
                  BoxShadow(
                    color: AppColors.primercolor.withOpacity(0.3),
                    spreadRadius: 2,
                    blurStyle: BlurStyle.inner,
                    blurRadius: 2,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ]
              : null,
          borderRadius: BorderRadius.circular(7.5)),
    );
  }

  static Widget loadingwidget() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primercolor,
      ),
    );
  }

  static Flushbar<dynamic> successmessage(
      {required BuildContext context,
      required String message,
      double sizefont = 20}) {
    return Flushbar(
      message: message,
      icon: Icon(
        Icons.check_circle_outline,
        size: 28.0,
        color: Colors.green[300],
      ),
      margin: EdgeInsets.all(6.0),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      textDirection: Directionality.of(context),
      borderRadius: BorderRadius.circular(8),
      duration: Duration(seconds: 3),
      messageSize: sizefont,
      leftBarIndicatorColor: Colors.green[300],
    )..show(context);
  }

  static String Formataint(int number) {
    final formatter = NumberFormat('#,##0', 'en_US');
    String formattedNumber = formatter.format(number);

    return formattedNumber;
  }

  static Flushbar<dynamic> errormessage(
      {required BuildContext context,
      required String message,
      double sizefont = 20}) {
    return Flushbar(
      message: message,
      icon: Icon(
        Icons.error,
        size: 28.0,
        color: Colors.red[300],
      ),
      margin: EdgeInsets.all(6.0),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      textDirection: Directionality.of(context),
      borderRadius: BorderRadius.circular(8),
      duration: Duration(seconds: 3),
      messageSize: sizefont,
      leftBarIndicatorColor: Colors.red[300],
    )..show(context);
  }

  static defchachedimg(String url, {double? wid, double? high}) {
    return CachedNetworkImage(
      width: wid,
      height: high,
      imageUrl: url,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: AppColors.primercolor,
        ),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: AppColors.error,
      ),
    );
  }
}
