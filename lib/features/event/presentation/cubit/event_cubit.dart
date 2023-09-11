import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:darksro/config/network/diohelper.dart';
import 'package:darksro/config/network/notification.dart';
import 'package:darksro/config/network/url.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/core/utils/deviceinfo.dart';
import 'package:darksro/features/event/data/models/NightMarketModel.dart';
import 'package:darksro/features/event/data/models/chestmodel.dart';
import 'package:darksro/features/event/data/models/elixiermodel.dart';
import 'package:darksro/features/event/data/models/giftmodel.dart';
import 'package:darksro/features/event/data/models/modelpost.dart';
import 'package:darksro/features/event/data/models/rewardroyalmodel.dart';
import 'package:darksro/features/event/data/models/royalpassmodel.dart';
import 'package:darksro/features/event/data/models/vipmodel.dart';
import 'package:darksro/features/event/data/repositories/viplvl.dart';
import 'package:darksro/features/home/data/models/HWIDModel.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:darksro/features/mission/presentation/cubit/mission_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../home/data/models/CharModel.dart';
import '../../data/models/alchemymodel.dart';
import '../../data/models/invitemodel.dart';
import '../widgets/royalpasstool.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());
  static EventCubit get(context) => BlocProvider.of(context);
  TextEditingController descriptioncont = TextEditingController();
  bool Imgerror = false;
  final select = BehaviorSubject<int>();
  String spintime = '00:00:00';
  bool spin = false;

  void checkspin(GetHwid getHwid) async {
    emit(CheckSpinLoading());
    NetworkInterface.list().then((value) {});
    DioApp.postData(url: AppUrl.spincheck, data: {
      "CharID": Stringconstants.Charid,
      "UserID": Stringconstants.Accid,
      "IP": DeviceInfo.androidInfo.id,
      "PCIP": getHwid.ip,
      "HWID": getHwid.hwid!
    }).then((value) {
      if (value.data == '1') {
        spin = true;
      } else {
        spintime = value.data;
      }
      emit(CheckSpinSuccess());
    }).catchError((error) {
      emit(CheckSpinError());
    });
  }

  Future luckyspin(GetHwid getHwid) async {
    spin = false;
    emit(LuckySpinLoading());
    DioApp.postData(url: AppUrl.luckyspin, data: {
      "CharID": Stringconstants.Charid,
      "UserID": Stringconstants.Accid,
      "IP": DeviceInfo.androidInfo.id,
      "PCIP": getHwid.ip!,
      "HWID": getHwid.hwid!
    }).then((value) {
      spintime = DateTime.now().toString();
      emit(LuckySpinSuccess());
    }).catchError((error) {
      emit(LuckySpinError());
    });
  }

  ModelChest? chest;
  void sendrw(BuildContext context) {
    int randomNumber = Random().nextInt(15) + 1;
    chest = ModelChest(
      charID: Stringconstants.Charid.toString(),
      ItemID: RoyalPassTool.spinitem[select.value]['code'].toString(),
      count: randomNumber.toString(),
    );
    if (chest!.ItemID == '0') {
      badlucky(context);
    } else {
      DioApp.postData(url: AppUrl.giverw, data: chest!.toJson()).then((value) {
        wonmessage(context);
      }).catchError((error) {
        print(error.toString());
      });
    }
  }

  void wonmessage(BuildContext context) {
    Components.successmessage(
        sizefont: 16,
        context: context,
        message:
            "${AppStringTrans(context).won} ${chest!.count}X ${RoyalPassTool.spinitem[select.value]['name']} ${AppStringTrans(context).checkchest}");
  }

  void badlucky(BuildContext context) {
    Components.errormessage(
        sizefont: 18,
        context: context,
        message: AppStringTrans(context).badlucky);
  }

  List<VIPModel> vip = [];
  bool vipnull = false;
  void vipcheck() {
    emit(VIPCheckLoading());
    vip = [];
    DioApp.postData(url: AppUrl.vip, data: {
      "CharID": Stringconstants.Charid,
    }).then((value) {
      if (value.data == "non") {
        vipnull = true;
      } else {
        vip.add(VIPModel.fromJson(value.data[0]));
      }
      emit(VIPCheckSuccess());
    }).catchError((error) {
      emit(VIPCheckError());
    });
  }

  void collectvip(BuildContext context, GetHwid getHwid) {
    emit(VIPCollectkLoading());
    DioApp.postData(url: AppUrl.collectVIP, data: {
      'CharID': Stringconstants.Charid,
      'IP': DeviceInfo.androidInfo.id,
      "PCIP": getHwid.ip!,
      "HWID": getHwid.hwid!,
      'RW': VIPLvlRW.lvl(int.parse(vip[0].point.toString())),
      "Point": int.parse(vip[0].point.toString()) < 15000
          ? "${int.parse(vip[0].point.toString()) + 200}"
          : 15000
    }).then((value) {
      if (value.data == "error") {
        Components.errormessage(
            sizefont: 18,
            context: context,
            message: "Sorry Can't Collect Reward You Collect Aonther ChaR");
      } else {
        vip[0].point = int.parse(vip[0].point.toString()) < 15000
            ? "${int.parse(vip[0].point.toString()) + 200}"
            : "15000";
        vip[0].quest = '0';
        Components.successmessage(
            sizefont: 18,
            context: context,
            message: "Now Can Collect Reward From Chest You Welcome");
      }
      emit(VIPCollectkSuccess());
    }).catchError((error) {
      emit(VIPCollectkError());
    });
  }

  List<ModelPOST> posts = [];
  bool mypost = true;
  void getposts(BuildContext context) {
    posts = [];
    emit(GetPostLoading());
    DioApp.postData(url: AppUrl.CheckPost, data: {
      "CharName":
          HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16
    }).then((value) {
      mypost = value.data['Mypost'];
      value.data['Posts'].forEach((element) {
        posts.add(ModelPOST.fromJson(element));
      });
      emit(GetPostSuccess());
    }).catchError((error) {
      emit(GetPostError());
    });
  }

  bool IMGempyt = true;
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

  void removeimg() {
    emit(ImgRemoveLoading());
    image = null;
    emit(ImgRemove());
  }

  void checkimg(BuildContext context) {
    if (image == null) {
      Imgerror = true;
    } else {
      uploadpost(HomeCubit.get(context).modelinfo[0].getShardUser![0], context);
    }
    emit(ImgState());
  }

  void uploadpost(GetShardUser shardUser, BuildContext context) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(image!.path),
      'charName': shardUser.charName16,
      'description':
          descriptioncont.text.isEmpty ? 'null' : descriptioncont.text,
      'CharIMG': shardUser.refObjID,
    });
    emit(UploadPOSTLoading());
    DioApp.postimg(url: AppUrl.uploadpost, data: formData).then((value) {
      getposts(context);
      Navigator.pop(context);
      emit(UploadPOSTSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(UploadPOSTError());
    });
  }

  double rate = 0;
  bool rateerror = false;
  TextEditingController commentcontroller = TextEditingController();
  void checkrate(
      GetShardUser getShardUser, var idpost, int index, BuildContext context) {
    if (rate == 0) {
      rateerror = true;
      emit(CheckRate());
    } else {
      addreview(getShardUser, idpost, index, context);
    }
  }

  void addreview(
      GetShardUser getShardUser, var idpost, index, BuildContext context) {
    emit(AddReviewLoading());
    DioApp.postData(url: AppUrl.addreview, data: {
      "rate": rate,
      "idpost": idpost,
      "charid": Stringconstants.Charid,
      "charname": getShardUser.charName16,
      "comment": commentcontroller.text,
      "charimg": getShardUser.refObjID
    }).then((value) {
      posts[index].myrate = true;
      Navigator.pop(context);
      emit(AddReviewSuccess());
    }).catchError((error) {
      emit(AddReviewError());
    });
  }

  bool redemerror = false;
  bool rdeme = false;
  List<InviteModel> infoinv = [];
  void checkinvite(BuildContext context) {
    infoinv = [];
    emit(CheckIniteLoading());
    DioApp.postData(url: AppUrl.Checkinvite, data: {
      "charid": Stringconstants.Charid,
      'HWID': HomeCubit.get(context).modelinfo[0].getHwid!.hwid
    }).then((value) {
      if (value.data == 'Redem') {
        rdeme = true;
        emit(CheckIniteSuccess());
      } else {
        print(value.data);
        infoinv.add(InviteModel.fromJson(value.data));
        emit(CheckIniteSuccess());
      }
    }).catchError((error) {
      print(error.toString());
      emit(CheckIniteError());
    });
  }

  TextEditingController codecontroller = TextEditingController();
  void createcode(BuildContext context) {
    redemerror = false;
    emit(CreateCodeLoading());
    DioApp.postData(url: AppUrl.createcode, data: {
      'CharID': Stringconstants.Charid,
      'Code': codecontroller.text.toLowerCase(),
      'IP': DeviceInfo.androidInfo.id
    }).then((value) {
      print(value.data);
      if (value.data == 'error') {
        redemerror = true;
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.Invite);
      }
      emit(CreateCodeSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(CreateCodeError());
    });
  }

  TextEditingController giftcodecontroller = TextEditingController();
  bool errorgift = false;
  void getredem(BuildContext context) {
    emit(GETCodeRedemLoading());
    DioApp.postData(url: AppUrl.getredem, data: {
      "Code": giftcodecontroller.text.toLowerCase(),
      "CharID": Stringconstants.Charid,
      "IP": DeviceInfo.androidInfo.id,
      "PCIP": HomeCubit.get(context).modelinfo[0].getHwid!.ip,
      "HWID": HomeCubit.get(context).modelinfo[0].getHwid!.hwid
    }).then((value) {
      if (value.data == 'error') {
        errorgift = true;
      } else {
        infoinv[0].redem = false;
        Components.successmessage(
            sizefont: 16,
            context: context,
            message: "${AppStringTrans(context).successrw}");
      }
      emit(GETCodeRedemSuccess());
    }).catchError((error) {
      emit(GETCodeRedemError());
    });
  }

  void collectinvite(BuildContext context, int silk, int level) {
    infoinv[0].info![0].getlvl!.lVL = '1';
    DioApp.postData(url: AppUrl.collectinvite, data: {
      "CharName":
          HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16,
      "silk": silk,
      "CharID": Stringconstants.Charid,
      "level": level
    }).then((value) {
      print("Data = ${value.data}");
    }).catchError((error) {
      checkinvite(context);
    });
  }

  bool gifttime = false;
  List<GiftModel> usergift = [];
  void Checkgift(BuildContext context) {
    usergift = [];
    emit(GiftCheckLoading());
    DioApp.postData(url: AppUrl.checkgift, data: {
      "HWID": HomeCubit.get(context).modelinfo[0].getHwid!.hwid,
      "ip": DeviceInfo.androidInfo.id
    }).then((value) {
      print(value.data);
      if (value.data == 'on') {
        gifttime = true;
      } else if (value.data == 'off') {
        gifttime = false;
      } else {
        usergift.add(GiftModel.fromJson(value.data[0]));
      }
      emit(GiftCheckSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GiftCheckError());
    });
  }

  GiftModel? giftModel;
  void collectgift(HomeCubit home, BuildContext context) {
    emit(CollectGiftLoading());
    giftModel = GiftModel(
      iD: '1',
      charName: home.modelinfo[0].getShardUser![0].charName16,
      hWID: home.modelinfo[0].getHwid!.hwid,
      iP: DeviceInfo.androidInfo.id,
      silk: "${Random().nextInt(5000) + 1}",
    );
    DioApp.postData(url: AppUrl.collectgift, data: giftModel!.toJson())
        .then((value) {})
        .catchError((error) {
      Checkgift(context);
    });
  }

  double value = 0;
  void loadingalchemy({double? loading}) async {
    print(value);
    emit(LoadingAlchemy());
  }

  List<ModelRoyalpass> royalpassplayer = [];
  List<RewardRoyalModel> rewardroyalmodel = [];
  bool isnew = false;
  void getRoyalpass(BuildContext context) {
    emit(RoyalPassGetLoading());
    royalpassplayer = [];
    rewardroyalmodel = [];
    DioApp.postData(url: AppUrl.royalpass, data: {
      "CharName":
          HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16
    }).then((value) {
      if (value.data['player'].length != 0) {
        royalpassplayer.add(ModelRoyalpass.fromJson(value.data['player'][0]));
      } else {
        isnew = true;
        royalpassplayer = [
          ModelRoyalpass(charName: 'a', collectlvl: '0', lvl: '1', point: '0')
        ];
      }
      value.data['reward'].forEach((element) {
        rewardroyalmodel.add(RewardRoyalModel.fromJson(element));
      });
      emit(RoyalPassGetSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(RoyalPassGetError());
    });
  }

  void royalcollect(int i, BuildContext context) {
    emit(RoyalPassGetLoading());

    DioApp.postData(url: AppUrl.colllectroyal, data: {
      "CharName":
          HomeCubit.get(context).modelinfo[0].getShardUser![0].charName16,
      "CharID": Stringconstants.Charid,
      "collectlvl": rewardroyalmodel[i].lvl,
      "itemidvip": rewardroyalmodel[i].iDVIP,
      "countvip": rewardroyalmodel[i].countVip,
      "itemidnorm": rewardroyalmodel[i].iDnorm,
      "countnorm": rewardroyalmodel[i].countNorm
    }).then((value) {
      getRoyalpass(context);
    }).catchError((error) {
      print(error.toString());
    });
  }

  List<AlchemyModel> alchemydata = [];
  ElixerModel? elixir;
  void alchemy() {
    alchemydata = [];
    emit(AlchemyGetLoading());
    DioApp.postData(url: AppUrl.getinventory, data: {
      "CharID": Stringconstants.Charid,
    }).then((value) {
      elixir = ElixerModel(
          wep: value.data['alchmey'][0]['Wep'],
          shield: value.data['alchmey'][0]['shield'],
          sets: value.data['alchmey'][0]['Sets'],
          accs: value.data['alchmey'][0]['accs']);
      vipalchemy = value.data['vip'];
      value.data['inventory'].forEach((element) {
        alchemydata.add(AlchemyModel.fromJson(element));
      });
      emit(AlchemyGetSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(AlchemyGetError());
    });
  }

  void gotomission(BuildContext context) {
    Navigator.pop(context);
    HomeCubit.get(context).changepage(2);
    emit(BackToMission());
  }

  bool vipalchemy = false;
  Map alchemyst = {'img': '', 'name': '', 'plus': '', 'stat': ''};
  void setitem(Map item) {
    alchemyst = item;
    emit(SetItem());
  }

  //Nighmarket
  bool isshow = false;
  TextEditingController silk = TextEditingController();
  TextEditingController price = TextEditingController();
  void changestat() {
    isshow = !isshow;
    emit(ChangeState());
  }

  void addNightmarket(HomeCubit home, BuildContext context) {
    emit(LoadingAddNightMarket());
    DioApp.postData(url: AppUrl.addnightmarket, data: {
      "Jid": home.modelinfo[0].jID,
      "Silk": int.parse(silk.text),
      "Charname": home.modelinfo[0].getShardUser![0].charName16,
      "CharID": home.modelinfo[0].getShardUser![0].charID,
      "price": int.parse(price.text),
      "charimg": home.modelinfo[0].getShardUser![0].refObjID,
    }).then((value) {
      print(value.data);
      if (value.data == 'fail') {
        Components.errormessage(
            context: context, message: AppStringTrans(context).faildsilk);
      } else {
        Navigator.pop(context);
        Components.successmessage(
            context: context, message: AppStringTrans(context).successsilk);
        getnightmarket(
            minsilk: '1', maxsilk: '999999', minprice: '1', maxprice: '999999');
      }
      emit(SuccessgAddNightMarket());
    }).catchError((error) {
      emit(ErrorgAddNightMarket());
    });
  }

  List<NightMarketModel> nightmarket = [];
  TextEditingController minsilk = TextEditingController();
  TextEditingController maxsilk = TextEditingController();
  TextEditingController minprice = TextEditingController();
  TextEditingController maxprice = TextEditingController();
  bool filter = false;
  bool vipmarket = false;
  void getnightmarket(
      {required String minsilk,
      required String maxsilk,
      required String minprice,
      required String maxprice}) {
    nightmarket = [];
    emit(GetNightMarketLoading());
    DioApp.postData(url: AppUrl.getnightmarket, data: {
      "minsilk": minsilk,
      "maxsilk": maxsilk,
      "minprice": minprice,
      "maxprice": maxprice,
      "CharID": Stringconstants.Charid
    }).then((value) {
      value.data['data'].forEach((element) {
        nightmarket.add(NightMarketModel.fromJson(element));
      });
      vipmarket = bool.parse(value.data['vip'].toString());
      emit(GetNightMarketSuccess());
    }).catchError((error) {
      emit(GetNightMarketError());
    });
  }

  void filterstate() {
    filter = !filter;
    minsilk.text = '1';
    maxsilk.text = '999999';
    minprice.text = '1';
    maxprice.text = '999999';
    emit(ChanmgeFilterState());
  }

  void buyNightmarket(
      {required String CharIDseller,
      required String price,
      required String silk,
      required String iD,
      required HomeCubit homeCubit,
      required BuildContext context}) {
    emit(BuyNightMarketLoading());
    DioApp.postData(url: AppUrl.buyNightmarket, data: {
      "CharIDSeller": CharIDseller,
      "CharID": homeCubit.modelinfo[0].getShardUser![0].charID,
      "Jid": homeCubit.modelinfo[0].jID,
      "Silk": silk,
      "Price": price,
      "IDoffer": iD
    }).then((value) {
      if (value.data == 'fail') {
        Components.errormessage(
            context: context, message: AppStringTrans(context).errormessagebuy);
      } else {
        Components.successmessage(
            context: context,
            message: AppStringTrans(context).succesmessagebuy);
        getnightmarket(
            minsilk: '1', maxsilk: '999999', minprice: '1', maxprice: '999999');
        sendnotifcation(value.data.toString());
      }
      emit(BuyNightMarketSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(BuyNightMarketError());
    });
  }

  void deleteoffer(
      {required String silk,
      required String iD,
      required HomeCubit homeCubit,
      required BuildContext context}) {
    emit(DeleteOfferLoading());
    DioApp.postData(url: AppUrl.deleteoffer, data: {
      "CharID": homeCubit.modelinfo[0].getShardUser![0].charID,
      "Jid": homeCubit.modelinfo[0].jID,
      "Silk": silk,
      "IDoffer": iD
    }).then((value) {
      if (value.data == 'fail') {
      } else {
        getnightmarket(
            minsilk: '1', maxsilk: '999999', minprice: '1', maxprice: '999999');
      }
      emit(DeleteOfferSuccess());
    }).catchError((error) {
      emit(DeleteOfferError());
    });
  }

  void sendnotifcation(String token) {
    APInotification.postRequset(
        to: token,
        title: 'Night Market',
        body: "Your offer has been successfully purchased");
  }
}
