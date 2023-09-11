import 'dart:io';

import 'package:darksro/config/network/diohelper.dart';
import 'package:darksro/config/network/notification.dart';
import 'package:darksro/config/network/url.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/home/data/models/GlobalModel.dart';
import 'package:darksro/features/home/data/models/InfoModel.dart';
import 'package:darksro/features/home/data/models/UnqsModel.dart';
import 'package:darksro/features/home/data/models/eventschedule.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int index = 0;
  List<InfoModel> modelinfo = [];
  void GetInfo() {
    modelinfo = [];
    emit(LoadingGetINFO());
    FirebaseMessaging.instance.getToken().then((value) {
      DioApp.postData(url: AppUrl.getinfo, data: {
        "jid": Stringconstants.Accid,
        "CharID": Stringconstants.Charid,
        "FCMToken": value
      }).then((value) {
        modelinfo.add(InfoModel.fromJson(value.data));
        getglobal();

        emit(SuccessGetINFO());
      }).catchError((error) {
        emit(ErrorGetINFO());
      });
    });
  }

  List<GlobalModel> globals = [];
  void getglobal() {
    emit(LoadingGetGlobal());
    globals = [];
    DioApp.getData(url: AppUrl.getglobal).then((value) async {
      await value.data.forEach((element) {
        globals.add(GlobalModel.fromJson(element));
      });
      getunqs();
      emit(SuccessGetGlobal());
    }).catchError((error) {
      emit(ErrorGetGlobal());
      print(error.toString());
    });
  }

  List<ModelUnqs> unqs = [];
  void getunqs() {
    emit(LoadingGetUnq());
    unqs = [];
    DioApp.getData(url: AppUrl.LastUnqKill).then((value) async {
      await value.data.forEach((element) {
        unqs.add(ModelUnqs.fromJson(element));
      });
      getevent();
      emit(SuccessGetEvent());
    }).catchError((error) {
      emit(ErrorGetEvent());
      print(error.toString());
    });
  }

  List<EventSchedule> events = [];
  void getevent() {
    emit(LoadingGetEvent());
    events = [];
    DioApp.getData(url: AppUrl.getevent).then((value) async {
      await value.data.forEach((element) {
        events.add(EventSchedule.fromJson(element));
      });
      emit(SuccessGetEvent());
    }).catchError((error) {});
  }

  void changepage(int val) {
    index = val;
    emit(Changepage());
  }

  int indexpage = 1;
  void changepageprice(int index) {
    indexpage = index;
    emit(ChangepageIndex());
  }

  bool wallett = false;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController phonenumbersell = TextEditingController();
  TextEditingController instapay = TextEditingController();
  bool imagenull = false;
  void changepayment() {
    wallett = !wallett;
    emit(ChangePyment());
  }

  File? image;
  final ImagePicker pickerimage = ImagePicker();
  Future<void> selectimg() async {
    emit(ImageLoading());
    final photo = await pickerimage.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      image = File(photo.path);
      emit(ImageSuccess());
    } else {
      emit(ImageError());
    }
  }

  void imageisnull() {
    imagenull = true;
    emit(ImageNullState());
  }

  void buy(
      {required String dpcount,
      required String le,
      required BuildContext context}) async {
    emit(BuyDarkPointLoading());
    FormData formData = FormData.fromMap({
      "Charname": modelinfo[0].getShardUser![0].charName16,
      'file': await MultipartFile.fromFile(image!.path),
      "countdp": dpcount,
      "le": le,
      "fullname": "${firstname.text} ${lastname.text}",
      "phonenumber": phonenumber.text,
      "wallet": AppString.phonepayment,
    });
    DioApp.postimg(url: AppUrl.buydarkpoint, data: formData).then((value) {
      if (value.data == 'fail') {
        Components.errormessage(
            context: context, message: AppStringTrans(context).buyfaild);
      } else {
        Components.successmessage(
            context: context, message: AppStringTrans(context).buysuccess);
        firstname.text = '';
        lastname.text = '';
        phonenumber.text = '';
        image = null;
        imagenull = false;
        APInotification.postRequset(
            to: '/topics/supportticket',
            title: "Buy DarkPoint",
            body: "New purchase order");
      }
      emit(BuyDarkPointSuccess());
    }).catchError((error) {
      print(error.toString());
    });
  }

  void sell(
      {required String dpcount,
      required String le,
      required BuildContext context}) {
    emit(SellDarkPointLoading());
    DioApp.postData(url: AppUrl.sell, data: {
      "Charname": modelinfo[0].getShardUser![0].charName16,
      "darkpoint": dpcount,
      "phonenumber": phonenumbersell.text,
      "le": le
    }).then((value) {
      if (value.data == 'fail') {
        Components.errormessage(
            context: context, message: AppStringTrans(context).errormessagebuy);
      } else if (value.data == 'haveone') {
        Components.errormessage(
            context: context, message: AppStringTrans(context).buyfaild);
      } else {
        Components.successmessage(
            context: context, message: AppStringTrans(context).buysuccess);
        APInotification.postRequset(
            to: '/topics/supportticket',
            title: "Sell DarkPoint",
            body: "New Sell order");
        phonenumbersell.text = '';
      }
      emit(SellDarkPointSuccess());
    });
  }
}





/*

  //payment
  void changepayment(var index) {
    valuelist = index;
    if (valuelist == 2) {
      wallett = true;
    } else {
      wallett = false;
    }
    emit(ChangePyment());
  }

  void checkvalue(BuildContext context, int price) {
    if (valuelist == 2) {
      wallett = true;
    } else {
      wallett = false;
      getfirsttoken(context, price);
    }
  }

  void getfirsttoken(BuildContext context, int price) {
    emit(PaymentLoading());
    DioPayment.postData(
        url: "auth/tokens",
        data: {"api_key": AppString.paymobapikey}).then((value) {
      AppString.paymobfirsttoken = value.data['token'];
      getorderid(context, price);
    }).catchError((error) {
      print("first ${error.toString()}");
    });
  }

  void getorderid(BuildContext context, int price) async {
    DioPayment.postData(url: "ecommerce/orders", data: {
      "auth_token": AppString.paymobfirsttoken,
      "delivery_needed": "false",
      "amount_cents": "${150.round()}00",
      "currency": "EGP",
      "items": [
        {
          "name": "ASC1515",
          "amount_cents": "500000",
          "description": "Smart Watch",
          "quantity": "1"
        }
      ]
    }).then((value) {
      AppString.orderid = value.data['id'].toString();
      valuelist == 0
          ? getfinaltokencard(context, price)
          : getfinaltokenKiosk(context, price);
    }).catchError((error) {
      print("sec ${error.toString()}");
    });
  }

  WebViewController webview = WebViewController();
  void getfinaltokencard(BuildContext context, int price) async {
    DioPayment.postData(url: "acceptance/payment_keys", data: {
      "auth_token": AppString.paymobfirsttoken,
      "amount_cents": "${price.round()}00",
      "expiration": 3600,
      "order_id": AppString.orderid,
      "billing_data": {
        "apartment": "NA",
        "email": modelinfo[0].email,
        "floor": "NA",
        "first_name": firstname.text,
        "street": "NA",
        "building": "NA",
        "phone_number": phonenumber.text,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastname.text,
        "state": "NA",
      },
      "currency": "EGP",
      "integration_id": AppString.InitIDCard,
      "lock_order_when_paid": "false"
    }).then((value) {
      webview
        ..loadRequest(
          Uri.parse(
              'https://accept.paymob.com/api/acceptance/iframes/698136?payment_token=${value.data['token']}'),
        )
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
        )).then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => VisaScreen()));
        });
      emit(PaymentCardSuccess());
    }).catchError((error) {
      print("last ${error.toString()}");
    });
  }

  void getfinaltokenKiosk(BuildContext context, int price) async {
    DioPayment.postData(url: "acceptance/payment_keys", data: {
      "auth_token": AppString.paymobfirsttoken,
      "amount_cents": "${price.round()}00",
      "expiration": 3600,
      "order_id": AppString.orderid,
      "billing_data": {
        "apartment": "NA",
        "email": modelinfo[0].email,
        "floor": "NA",
        "first_name": firstname.text,
        "street": "NA",
        "building": "NA",
        "phone_number": phonenumber.text,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastname.text,
        "state": "NA",
      },
      "currency": "EGP",
      "integration_id": AppString.InitIDKiosk,
      "lock_order_when_paid": "false"
    }).then((value) {
      AppString.finaltokenKiosk = value.data['token'];
      Refcode(context);
    }).catchError((error) {});
  }

  void Refcode(BuildContext context) async {
    DioPayment.postData(url: "acceptance/payments/pay", data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": AppString.finaltokenKiosk
    }).then((value) {
      AppString.refcode = value.data['id'].toString();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => KioskScreen()));

      emit(PaymentKioskSuccess());
    }).catchError((error) {
      print("last ${error.toString()}");
    });
  }

 */