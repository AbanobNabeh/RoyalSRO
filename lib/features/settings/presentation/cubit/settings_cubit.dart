import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darksro/app.dart';
import 'package:darksro/config/network/diohelper.dart';
import 'package:darksro/config/network/notification.dart';
import 'package:darksro/config/network/url.dart';
import 'package:darksro/config/shared_preferences/shared_preferences.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/core/utils/icon_broken.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:darksro/features/settings/data/models/donatemodel.dart';
import 'package:darksro/features/settings/data/models/donatepaymentmodel.dart';
import 'package:darksro/features/settings/data/models/messagemodel.dart';
import 'package:darksro/features/settings/data/models/sellmodel.dart';
import 'package:darksro/features/settings/data/models/ticketmodel.dart';
import 'package:darksro/features/settings/presentation/pages/chatscreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

import '../../../../config/routes/app_routes.dart';
import '../../data/models/buymodel.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of(context);

  TextEditingController currentpasswordcon = TextEditingController();
  TextEditingController newpasswordcon = TextEditingController();
  TextEditingController retypenewpasswordcon = TextEditingController();
  bool obscureText = true;
  IconData passico = IconBroken.Show;

  void changevisi() {
    if (obscureText == true) {
      passico = IconBroken.Hide;
      obscureText = false;
    } else {
      obscureText = true;
      passico = IconBroken.Show;
    }
    emit(ChangePasswordVisi());
  }

  bool passworderr = false;
  void changepassword(BuildContext context) {
    passworderr = false;
    emit(PasswordChangeLoading());
    DioApp.postData(url: AppUrl.changepass, data: {
      "currentpass": currentpasswordcon.text,
      "newpassword": newpasswordcon.text,
      "username": HomeCubit.get(context).modelinfo[0].strUserID
    }).then((value) {
      if (value.data == 'success') {
        Components.successmessage(
            context: context, message: AppStringTrans(context).successchangepw);
      } else {
        passworderr = true;
      }
      emit(PasswordChangeSuccess());
    }).catchError((error) {
      emit(PasswordChangeError());
    });
  }

  void changechar(BuildContext context) {
    Stringconstants.Charid = null;

    CacheHelper.removeData(key: AppString.CharID);
    emit(ChangeCharacter());
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MyApp()),
        (Route<dynamic> route) => false);
  }

  List<Asset> images = <Asset>[];

  Future<void> uploadmiultphoto() async {
    emit(ImagePickerLoading());
    MultipleImagesPicker.pickImages(
      maxImages: 12,
      enableCamera: true,
      selectedAssets: images,
      cupertinoOptions: CupertinoOptions(takePhotoIcon: "ticket"),
      materialOptions: MaterialOptions(
        actionBarColor: "#F5C802",
        actionBarTitle: "RoyalSRO",
        allViewTitle: "All Photos",
        useDetailsView: true,
        selectCircleStrokeColor: "#F5C802",
      ),
    ).then((value) {
      images = value;
      emit(ImagePickerSuccess());
    });
  }

  TextEditingController titlecon = TextEditingController();
  String categpry = 'bug';
  TextEditingController subjectcon = TextEditingController();
  void openticket() {}
  FormData formData = FormData();

  void checkticket(BuildContext context) {
    DioApp.postData(url: AppUrl.checkticket, data: {
      "Charname":
          HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16
    }).then((value) {
      if (value.data == "create") {
        Navigator.pushNamed(context, AppRoutes.support);
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ChatScreen(ModelTicket.fromJson(value.data)),
            ));
      }
    }).catchError((error) {});
  }

  void onchangecate(value) {
    categpry = value;
    emit(ChamgeCategory());
  }

  void createticket(BuildContext context) {
    emit(CreateTicketLoading());
    DioApp.postData(url: AppUrl.createticket, data: {
      "title": titlecon.text,
      "category": categpry,
      "subject": subjectcon.text,
      "Charname":
          HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16,
      "image": images.isEmpty ? "false" : "true"
    }).then((value) {
      APInotification.postRequset(
              to: "/topics/supportticket", title: "Ticket", body: "New Ticket")
          .then((valuenot) {
        if (images.isEmpty) {
          emit(CreateTicketSuccess());
        } else {
          uploadimages(value.data['id'].toString(), context);
        }
      });
    }).catchError((error) {
      emit(CreateTicketError());
    });
  }

  void uploadimages(String idTicket, BuildContext context) async {
    for (int i = 0; i < images.length; i++) {
      ByteData byteData = await images[i].getByteData();
      List<int> imageData = byteData.buffer.asUint8List();
      String fileName =
          'image${i}.jpg'; // You can adjust the file name as needed
      formData = FormData.fromMap({
        'IMG${i}': MultipartFile.fromBytes(imageData, filename: fileName),
        "ID": idTicket
      });
      DioApp.postimg(url: AppUrl.uploadimg, data: formData).then((value) {
        i + 1 == images.length ? emit(CreateTicketSuccess()) : null;
      }).catchError((error) {});
    }
  }

  List<ModelTicket> tickets = [];
  void getticket() {
    tickets = [];
    emit(GetTicketChatLoading());
    DioApp.getData(url: AppUrl.gettickets).then((value) {
      value.data.forEach((element) {
        tickets.add(ModelTicket.fromJson(element));
      });
      emit(GetTicketChatSuccess());
    });
  }

  void gmread(BuildContext context, ModelTicket ticket) {
    emit(GMReadLoading());
    DioApp.postData(url: AppUrl.gmread, data: {
      "id": ticket.iD,
      "Charnane":
          HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16
    }).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(ticket),
          ));
      emit(GMReadSuccess());
    });
  }

  void acceptticket(ModelTicket ticket) {
    emit(AcceptedTicektLoading());
    DioApp.postData(url: AppUrl.acceptedticket, data: {"id": ticket})
        .then((value) {
      APInotification.postRequset(
          to: value.data,
          title: "Ticket",
          body: "Your ticket has been accepted");
      ticket.state = "acc";
      getticket();
      emit(AcceptedTicektSuccess());
    }).catchError((error) {
      print(error.toString());
    });
  }

  TextEditingController messagecon = TextEditingController();
  void sendmessage(String id, BuildContext context, {String nameimg = ''}) {
    emit(SendMessageLoading());
    DioApp.getData(url: "http://worldtimeapi.org/api/timezone/Africa/Cairo")
        .then((value) {
      FirebaseFirestore.instance
          .collection("tickets")
          .doc("ticket#${id}")
          .collection("message")
          .add({
        "message": messagecon.text,
        "namesender":
            HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16,
        "img": nameimg == '' ? null : nameimg,
        "record": null,
        "date": value.data['datetime'].toString(),
      }).then((value) {
        messagecon.text = '';
        image = null;
        emit(SendMessageSuccess());
      }).catchError((error) {});
    });
  }

  List<MessageModel> messages = [];
  void getmessages(
    String id,
  ) {
    emit(GetMessagesLoading());
    FirebaseFirestore.instance
        .collection("tickets")
        .doc("ticket#${id}")
        .collection("message")
        .orderBy("date")
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.reversed.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(GetMessagesSuccess());
    });
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
      print('No Image Selected');
      emit(ImageError());
    }
  }

  void uploadimg(String id, BuildContext context) async {
    emit(ImgUploadChat());
    FormData formData = FormData.fromMap(
        {'file': await MultipartFile.fromFile(image!.path), "ticketid": id});
    DioApp.postimg(url: AppUrl.uploadimgchat, data: formData).then((value) {
      sendmessage(id, context, nameimg: value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

  void closeticket(String id) {
    DioApp.postData(url: AppUrl.closeticket, data: {"id": id})
        .then((valueapi) async {});
  }

  void logout(BuildContext context) async {
    DioApp.postData(url: AppUrl.logout, data: {
      "CharID": Stringconstants.Charid,
      "email": HomeCubit.get(context).modelinfo[0].strUserID
    }).then((value) async {
      Stringconstants.Accid = null;
      Stringconstants.Charid = null;
      await CacheHelper.removeData(key: AppString.AccID);
      await CacheHelper.removeData(key: AppString.CharID);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyApp()),
          (Route<dynamic> route) => false);
    });
  }

  int logindex = 0;
  void changeindex(int value) {
    logindex = value;
    if (value == 0) {
      getbuy();
    } else if (value == 1) {
      getsell();
    } else {
      getdonatepayment();
    }
    emit(ChangeLogindex());
  }

  List<BuyModel> buylist = [];
  void getbuy() {
    emit(GetBuyLoading());
    buylist = [];
    DioApp.getData(url: AppUrl.getbuy).then((value) {
      value.data.forEach((element) {
        buylist.add(BuyModel.fromJson(element));
      });
      emit(GetBuySuccess());
    });
  }

  void acceptbuy(BuyModel model, BuildContext context) {
    DioApp.postData(url: AppUrl.accpetbuy, data: {
      "Charname": model.playerName,
      "darkpoint": model.countDP,
      "gmread": HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16,
      "ID": model.iD
    }).then((value) {
      getbuy();
      APInotification.postRequset(
          to: value.data,
          title: "DarkPoint",
          body: "${model.countDP} DarkPoint added successfully");
    });
  }

  List<SellModel> selllist = [];
  void getsell() {
    emit(GetSellLoading());
    selllist = [];
    DioApp.getData(url: AppUrl.getsell).then((value) {
      value.data.forEach((element) {
        selllist.add(SellModel.fromJson(element));
      });
      emit(GetSellSuccess());
    });
  }

  void acceptsell(SellModel model, BuildContext context) {
    DioApp.postData(url: AppUrl.accpetsell, data: {
      "Charname": model.charName,
      "gmread": HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16,
      "ID": model.iD
    }).then((value) {
      getsell();
    });
  }

  List<DonateModel> donatelist = [];
  void getdonate() {
    emit(GetDonateLoading());
    donatelist = [];
    DioApp.getData(url: AppUrl.getdonate).then((value) {
      value.data.forEach((element) {
        donatelist.add(DonateModel.fromJson(element));
      });
      emit(GetDonateSuccess());
    });
  }

  bool wallett = false;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController phonenumbersell = TextEditingController();
  TextEditingController instapay = TextEditingController();
  bool imagenull = false;
  int indexpayment = 0;
  void changepayment(int index) {
    indexpayment = index;
    emit(ChangePyment());
  }

  File? imagepay;
  final ImagePicker pickerdonateimage = ImagePicker();
  Future<void> selectimgpay() async {
    emit(ImageLoading());
    final photo =
        await pickerdonateimage.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      imagepay = File(photo.path);
      emit(ImageSuccess());
    } else {
      emit(ImageError());
    }
  }

  void imageisnull() {
    imagenull = true;
    emit(ImageNullState());
  }

  void buydonate(BuildContext context, String name, String price) async {
    emit(BuyDonateLoading());

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imagepay!.path),
      "name": name,
      'wallet': AppString.phonepayment,
      "price": int.parse(price),
      "phonenumber": phonenumbersell.text,
      "Charname":
          HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16,
    });
    DioApp.postimg(url: AppUrl.donatepayment, data: formData).then((value) {
      if (value.data == 'fail') {
        Components.errormessage(
            context: context, message: AppStringTrans(context).buyfaild);
      } else {
        Components.successmessage(
            context: context, message: AppStringTrans(context).buysuccess);
        phonenumbersell.text = '';
        imagepay = null;
        imagenull = false;
        APInotification.postRequset(
            to: '/topics/supportticket',
            title: "Buy Donate",
            body: "New purchase Donate order");
      }
      emit(BuyDonateSuccess());
    }).catchError((error) {
      print(error.toString());
    });
  }

  List<DonatePaymentModel> donate = [];
  void getdonatepayment() {
    emit(GetDonatePaymenLoading());
    donate = [];
    DioApp.getData(url: AppUrl.getbuyDonate).then((value) {
      value.data.forEach((element) {
        donate.add(DonatePaymentModel.fromJson(element));
      });
      emit(GetDonatePaymenSuccess());
    });
  }

  void acceptDonate(BuyModel model, BuildContext context) {
    DioApp.postData(url: AppUrl.accpetbuy, data: {
      "Charname": model.playerName,
      "darkpoint": model.countDP,
      "gmread": HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16,
      "ID": model.iD
    }).then((value) {
      getbuy();
      APInotification.postRequset(
          to: value.data,
          title: "DarkPoint",
          body: "${model.countDP} DarkPoint added successfully");
    });
  }

  void acceptdonate(DonatePaymentModel model, BuildContext context) {
    DioApp.postData(url: AppUrl.accepteddonate, data: {
      "gmread": HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16,
      "ID": model.iD
    }).then((value) {
      getdonatepayment();
    });
  }
}
